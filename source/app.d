import oracles.bank00;
import oracles.data;
import oracles.data.gfx;
import oracles.common.data.roomPacks;
import oracles.common.data.musicAssignments;
import oracles.defs;
import oracles.external;
import oracles.extra;
import oracles.globals;
import oracles.structures;

import replatform64.gameboy;

import d_imgui.imgui_h;
import ImGui = d_imgui;

import std.format;
import std.functional;
import std.meta;
import std.traits;

alias loadableDataModules = AliasSeq!(oracles.data, oracles.data.gfx, oracles.common.data.roomPacks, oracles.common.data.musicAssignments);

void main(string[] args) {
	repositoryURL = "https://github.com/Herringway/oracles";
	gbc.entryPoint = &start;
	gbc.model = GameBoyModel.cgb;
	gbc.interruptHandlerVBlank = &vblankInterruptHandler;
	gbc.interruptHandlerSTAT = &lcdcInterruptHandler;
	gbc.interruptHandlerSerial = &serialTransferCompleteInterruptHandler;
	gbc.interruptHandlerTimer = &timerOverflowInterruptHandler;
	gbc.interruptHandlerJoypad = &joypadTransitionInterruptHandler;
	gbc.title = gameTitle;
	gbc.sourceFile = game ~ ".gbc";
	gbc.gameID = "oracleof" ~ game;
	if (gbc.parseArgs(args)) {
		return;
	}
	gameSettings = gbc.loadSettings!GameSettings();
	gbc.debugMenuRenderer = (&debugFunction).toDelegate;

	gbc.registerMemoryRange("VRAM Attribute Buffer", vramAttributes[]);
	gbc.initialize();
	gbc.handleAssets!loadableDataModules(&extractExtraAssets, &loadExtraData);
	gbc.run();
	gbc.saveSettings(gameSettings);
}

void debugFunction(const UIState uiState) {
	alias FP16 = FixedPoint2!(16, 8, true);
	if (ImGui.BeginTabBar("gamestuff")) {
		if (ImGui.BeginTabItem("State")) {
			ImGui.InputText("Save file", state.saveFileString[]);
			InputEditable("Game ID", state.gameID);
			ImGui.InputText("Link's name", cast(char[])state.linkName[]);
			InputEditable("C608", state.unnamedC608);
			ImGui.InputText("Kid's name", cast(char[])state.kidName[]);
			InputEditable("Kid status", state.childStatus);
			InputEditable("Animal companion", state.animalCompanion);
			InputEditable("Game", state.whichGame);
			InputEditable("Linked game", state.fileIsLinkedGame);
			InputEditable("Hero game", state.fileIsHeroGame);
			InputEditable("Completed game", state.fileIsCompleted);
			InputEditable("Has ring box", state.obtainedRingBox);
			InputEditable("Rings obtained", state.ringsObtained);
			InputEditable("Times died", state.deathCounter);
			InputEditable("Enemies killed", state.totalEnemiesKilled);
			InputEditable("Play time", state.playtimeCounter);
			InputEditable("Signs destroyed", state.totalSignsDestroyed);
			InputEditable("Rupees collected", state.totalRupeesCollected);
			InputEditable("Text speed", state.textSpeed);
			InputEditable("Language", state.activeLanguage);
			ImGui.EndTabItem();
		}
		if (ImGui.BeginTabItem("ZThreads")) {
			foreach (idx, ref thread; threadState) {
				ImGui.SeparatorText(format!"ZThread %d"(idx));
				InputEditable!(ZThread.State)("State", thread.state);
				InputEditable("Frame counter", thread.frameCounter);
			}
			ImGui.EndTabItem();
		}
		if (ImGui.BeginTabItem("Objects")) {
			void renderGameObject(Enum)(string type, size_t idx, ref GameObject obj) {
				if (!obj.enabled) {
					return;
				}
				void autoObjectEnumInput(string id, T)(string label, ref T field) {
					sw: switch (obj.id) {
						static foreach (m; EnumMembers!Enum) {{
							enum wantedEnum = format!"%s%s%02X"(Enum.stringof, id, cast(uint)m);
							static if (is(mixin(wantedEnum))) {
								case m: InputEditable!(mixin(wantedEnum))(label, field); break sw;
							}
						}}
						default: InputEditable(label, field); break;
					}
				}
				void flagCheckbox(ubyte bit, T)(string label, ref T field) {
					bool value = !!(field & (1 << bit));
					if (ImGui.Checkbox(label, &value)) {
						field &= cast(ubyte)~(1 << bit);
						field |= value << bit;
					}

				}
				ImGui.PushID(cast(int)idx);
				ImGui.SeparatorText(format!"%s %s"(type, idx));
				InputEditable("Enabled", obj.enabled);
				InputEditable!Enum("ID", obj.id);
				autoObjectEnumInput!"SubID"("Sub ID", obj.subid);
				InputEditable("Var 03", obj.var03);
				autoObjectEnumInput!"State"("State", obj.state);
				InputEditable("Substate", obj.substate);
				InputEditable("Counter 1", obj.counter1);
				InputEditable("Counter 2", obj.counter2);
				InputEditable("Direction", obj.direction);
				InputEditable("Angle", obj.angle);
				if (auto positions = InputEditableR("Position", FP16.fromRaw(obj.fullX), FP16.fromRaw(obj.fullY), FP16.fromRaw(obj.fullZ))) {
					obj.fullX = positions[0].toRaw;
					obj.fullY = positions[1].toRaw;
					obj.fullZ = positions[2].toRaw;
				}
				InputEditable("Speed", obj.speedX, obj.speedY, obj.speedZ);
				ImGui.SeparatorText("Visibility");
				flagCheckbox!7("Visible", obj.visible);
				flagCheckbox!6("Terrain effects", obj.visible);
				InputEditable("OAM tile base", obj.oamTileIndexBase);
				ImGui.PopID();
			}
			if (ImGui.TreeNode("Item Obj")) {
				foreach (idx, ref itemObj; itemObjects) {
					renderGameObject!ItemObj("Item Obj", idx, itemObj);
				}
				ImGui.TreePop();
			}
			if (ImGui.TreeNode("Interactions")) {
				foreach (idx, ref interaction; interactions) {
					renderGameObject!Interaction("Interaction", idx, interaction);
				}
				ImGui.TreePop();
			}
			if (ImGui.TreeNode("Enemies")) {
				foreach (idx, ref enemy; enemies) {
					renderGameObject!Enemy("Enemy", idx, enemy);
				}
				ImGui.TreePop();
			}
			if (ImGui.TreeNode("Parts")) {
				foreach (idx, ref part; parts) {
					renderGameObject!Part("Part", idx, part);
				}
				ImGui.TreePop();
			}
			ImGui.EndTabItem();
		}
		if (ImGui.BeginTabItem("Palettes")) {
			if (ImGui.TreeNode("Queued for transfer")) {
				ImGui.SeparatorText("BG");
				showPalette(cast(BGR555[])bgPalettesBuffer, 4);
				ImGui.SeparatorText("Sprite");
				showPalette(cast(BGR555[])spritePalettesBuffer, 4);
				ImGui.TreePop();
			}
			if (ImGui.TreeNode("Tileset")) {
				ImGui.SeparatorText("BG");
				showPalette(cast(BGR555[])tilesetBGPalettes, 4);
				ImGui.SeparatorText("Sprite");
				showPalette(cast(BGR555[])tilesetSpritePalettes, 4);
				ImGui.TreePop();
			}
			if (ImGui.TreeNode("Fade")) {
				ImGui.SeparatorText("BG");
				showPalette(cast(BGR555[])fadingBGPalettes, 4);
				ImGui.SeparatorText("Sprite");
				showPalette(cast(BGR555[])fadingSpritePalettes, 4);
				ImGui.TreePop();
			}
			ImGui.EndTabItem();
		}
		ImGui.EndTabBar();
	}
}

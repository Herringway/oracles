module oracles.bank06;

import oracles.external;

public import oracles.common.interactableTiles;
public import oracles.common.specialObjectAnimationsAndDamage;
public import oracles.common.breakableTiles;
public import oracles.common.parentItemUsage;

public import oracles.common.objects.itemParents.shieldParent;
public import oracles.common.objects.itemParents.otherSwordsParent;
public import oracles.common.objects.itemParents.switchHookParent;
public import oracles.common.objects.itemParents.caneOfSomariaParent;
public import oracles.common.objects.itemParents.swordParent;
public import oracles.common.objects.itemParents.harpFluteParent;
public import oracles.common.objects.itemParents.seedsParent;
public import oracles.common.objects.itemParents.shovelParent;
public import oracles.common.objects.itemParents.boomerangParent;
public import oracles.common.objects.itemParents.bombsBraceletParent;
public import oracles.common.objects.itemParents.featherParent;
public import oracles.common.objects.itemParents.magnetGloveParent;

public import oracles.common.objects.itemParents.commonCode;

public import oracles.common.data.itemUsageTables;

public import oracles.common.objects.special.minecart;
static if (gameVersion == GameVersion.ages) {
	public import oracles.ages.objects.special.raft;
}
public import oracles.common.data.specialObjectAnimations;
public import oracles.common.objects.special.companionCutscene;
public import oracles.common.objects.special.linkInCutscene;
public import oracles.common.data.signText;
public import oracles.common.data.tileProperties.breakableTiles;

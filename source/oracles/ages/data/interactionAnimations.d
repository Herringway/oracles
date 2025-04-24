module oracles.ages.data.interactionAnimations;

import oracles.ages.data.interactionOamData;
import oracles.external;
import oracles.structures;

immutable interactionAnimationTable = [
	interaction00Animations,
	interaction01Animations,
	interaction02Animations,
	interaction03Animations,
	interaction04Animations,
	interaction05Animations,
	interaction06Animations,
	interaction07Animations,
	interaction08Animations,
	interaction09Animations,
	interaction0AAnimations,
	interaction0BAnimations,
	interaction0CAnimations,
	interaction0DAnimations,
	interaction0EAnimations,
	interaction0FAnimations,
	interaction10Animations,
	interaction11Animations,
	interaction12Animations,
	interaction13Animations,
	interaction14Animations,
	interaction15Animations,
	interaction16Animations,
	interaction17Animations,
	interaction18Animations,
	interaction19Animations,
	interaction1AAnimations,
	interaction1BAnimations,
	interaction1CAnimations,
	interaction1DAnimations,
	interaction1EAnimations,
	interaction1FAnimations,
	interaction20Animations,
	interaction21Animations,
	interaction22Animations,
	interaction23Animations,
	interaction24Animations,
	interaction25Animations,
	interaction26Animations,
	interaction27Animations,
	interaction28Animations,
	interaction29Animations,
	interaction2AAnimations,
	interaction2BAnimations,
	interaction2CAnimations,
	interaction2DAnimations,
	interaction2EAnimations,
	interaction2FAnimations,
	interaction30Animations,
	interaction31Animations,
	interaction32Animations,
	interaction33Animations,
	interaction34Animations,
	interaction35Animations,
	interaction36Animations,
	interaction37Animations,
	interaction38Animations,
	interaction39Animations,
	interaction3AAnimations,
	interaction3BAnimations,
	interaction3CAnimations,
	interaction3DAnimations,
	interaction3EAnimations,
	interaction3FAnimations,
	interaction40Animations,
	interaction41Animations,
	interaction42Animations,
	interaction43Animations,
	interaction44Animations,
	interaction45Animations,
	interaction46Animations,
	interaction47Animations,
	interaction48Animations,
	interaction49Animations,
	interaction4AAnimations,
	interaction4BAnimations,
	interaction4CAnimations,
	interaction4DAnimations,
	interaction4EAnimations,
	interaction4FAnimations,
	interaction50Animations,
	interaction51Animations,
	interaction52Animations,
	interaction53Animations,
	interaction54Animations,
	interaction55Animations,
	interaction56Animations,
	interaction57Animations,
	interaction58Animations,
	interaction59Animations,
	interaction5AAnimations,
	interaction5BAnimations,
	interaction5CAnimations,
	interaction5DAnimations,
	interaction5EAnimations,
	interaction5FAnimations,
	interaction60Animations,
	interaction61Animations,
	interaction62Animations,
	interaction63Animations,
	interaction64Animations,
	interaction65Animations,
	interaction66Animations,
	interaction67Animations,
	interaction68Animations,
	interaction69Animations,
	interaction6AAnimations,
	interaction6BAnimations,
	interaction6CAnimations,
	interaction6DAnimations,
	interaction6EAnimations,
	interaction6FAnimations,
	interaction70Animations,
	interaction71Animations,
	interaction72Animations,
	interaction73Animations,
	interaction74Animations,
	interaction75Animations,
	interaction76Animations,
	interaction77Animations,
	interaction78Animations,
	interaction79Animations,
	interaction7AAnimations,
	interaction7BAnimations,
	interaction7CAnimations,
	interaction7DAnimations,
	interaction7EAnimations,
	interaction7FAnimations,
	interaction80Animations,
	interaction81Animations,
	interaction82Animations,
	interaction83Animations,
	interaction84Animations,
	interaction85Animations,
	interaction86Animations,
	interaction87Animations,
	interaction88Animations,
	interaction89Animations,
	interaction8AAnimations,
	interaction8BAnimations,
	interaction8CAnimations,
	interaction8DAnimations,
	interaction8EAnimations,
	interaction8FAnimations,
	interaction90Animations,
	interaction91Animations,
	interaction92Animations,
	interaction93Animations,
	interaction94Animations,
	interaction95Animations,
	interaction96Animations,
	interaction97Animations,
	interaction98Animations,
	interaction99Animations,
	interaction9AAnimations,
	interaction9BAnimations,
	interaction9CAnimations,
	interaction9DAnimations,
	interaction9EAnimations,
	interaction9FAnimations,
	interactionA0Animations,
	interactionA1Animations,
	interactionA2Animations,
	interactionA3Animations,
	interactionA4Animations,
	interactionA5Animations,
	interactionA6Animations,
	interactionA7Animations,
	interactionA8Animations,
	interactionA9Animations,
	interactionAAAnimations,
	interactionABAnimations,
	interactionACAnimations,
	interactionADAnimations,
	interactionAEAnimations,
	interactionAFAnimations,
	interactionB0Animations,
	interactionB1Animations,
	interactionB2Animations,
	interactionB3Animations,
	interactionB4Animations,
	interactionB5Animations,
	interactionB6Animations,
	interactionB7Animations,
	interactionB8Animations,
	interactionB9Animations,
	interactionBAAnimations,
	interactionBBAnimations,
	interactionBCAnimations,
	interactionBDAnimations,
	interactionBEAnimations,
	interactionBFAnimations,
	interactionC0Animations,
	interactionC1Animations,
	interactionC2Animations,
	interactionC3Animations,
	interactionC4Animations,
	interactionC5Animations,
	interactionC6Animations,
	interactionC7Animations,
	interactionC8Animations,
	interactionC9Animations,
	interactionCAAnimations,
	interactionCBAnimations,
	interactionCCAnimations,
	interactionCDAnimations,
	interactionCEAnimations,
	interactionCFAnimations,
	interactionD0Animations,
	interactionD1Animations,
	interactionD2Animations,
	interactionD3Animations,
	interactionD4Animations,
	interactionD5Animations,
	interactionD6Animations,
	interactionD7Animations,
	interactionD8Animations,
	interactionD9Animations,
	interactionDAAnimations,
	interactionDBAnimations,
	interactionDCAnimations,
	interactionDDAnimations,
	interactionDEAnimations,
	interactionDFAnimations,
	interactionE0Animations,
	interactionE1Animations,
	interactionE2Animations,
	interactionE3Animations,
	interactionE4Animations,
	interactionE5Animations,
	interactionE6Animations,
];

immutable interactionOAMDataTable = [
	interaction00OAMDataPointers,
	interaction01OAMDataPointers,
	interaction02OAMDataPointers,
	interaction03OAMDataPointers,
	interaction04OAMDataPointers,
	interaction05OAMDataPointers,
	interaction06OAMDataPointers,
	interaction07OAMDataPointers,
	interaction08OAMDataPointers,
	interaction09OAMDataPointers,
	interaction0AOAMDataPointers,
	interaction0BOAMDataPointers,
	interaction0COAMDataPointers,
	interaction0DOAMDataPointers,
	interaction0EOAMDataPointers,
	interaction0FOAMDataPointers,
	interaction10OAMDataPointers,
	interaction11OAMDataPointers,
	interaction12OAMDataPointers,
	interaction13OAMDataPointers,
	interaction14OAMDataPointers,
	interaction15OAMDataPointers,
	interaction16OAMDataPointers,
	interaction17OAMDataPointers,
	interaction18OAMDataPointers,
	interaction19OAMDataPointers,
	interaction1AOAMDataPointers,
	interaction1BOAMDataPointers,
	interaction1COAMDataPointers,
	interaction1DOAMDataPointers,
	interaction1EOAMDataPointers,
	interaction1FOAMDataPointers,
	interaction20OAMDataPointers,
	interaction21OAMDataPointers,
	interaction22OAMDataPointers,
	interaction23OAMDataPointers,
	interaction24OAMDataPointers,
	interaction25OAMDataPointers,
	interaction26OAMDataPointers,
	interaction27OAMDataPointers,
	interaction28OAMDataPointers,
	interaction29OAMDataPointers,
	interaction2AOAMDataPointers,
	interaction2BOAMDataPointers,
	interaction2COAMDataPointers,
	interaction2DOAMDataPointers,
	interaction2EOAMDataPointers,
	interaction2FOAMDataPointers,
	interaction30OAMDataPointers,
	interaction31OAMDataPointers,
	interaction32OAMDataPointers,
	interaction33OAMDataPointers,
	interaction34OAMDataPointers,
	interaction35OAMDataPointers,
	interaction36OAMDataPointers,
	interaction37OAMDataPointers,
	interaction38OAMDataPointers,
	interaction39OAMDataPointers,
	interaction3AOAMDataPointers,
	interaction3BOAMDataPointers,
	interaction3COAMDataPointers,
	interaction3DOAMDataPointers,
	interaction3EOAMDataPointers,
	interaction3FOAMDataPointers,
	interaction40OAMDataPointers,
	interaction41OAMDataPointers,
	interaction42OAMDataPointers,
	interaction43OAMDataPointers,
	interaction44OAMDataPointers,
	interaction45OAMDataPointers,
	interaction46OAMDataPointers,
	interaction47OAMDataPointers,
	interaction48OAMDataPointers,
	interaction49OAMDataPointers,
	interaction4AOAMDataPointers,
	interaction4BOAMDataPointers,
	interaction4COAMDataPointers,
	interaction4DOAMDataPointers,
	interaction4EOAMDataPointers,
	interaction4FOAMDataPointers,
	interaction50OAMDataPointers,
	interaction51OAMDataPointers,
	interaction52OAMDataPointers,
	interaction53OAMDataPointers,
	interaction54OAMDataPointers,
	interaction55OAMDataPointers,
	interaction56OAMDataPointers,
	interaction57OAMDataPointers,
	interaction58OAMDataPointers,
	interaction59OAMDataPointers,
	interaction5AOAMDataPointers,
	interaction5BOAMDataPointers,
	interaction5COAMDataPointers,
	interaction5DOAMDataPointers,
	interaction5EOAMDataPointers,
	interaction5FOAMDataPointers,
	interaction60OAMDataPointers,
	interaction61OAMDataPointers,
	interaction62OAMDataPointers,
	interaction63OAMDataPointers,
	interaction64OAMDataPointers,
	interaction65OAMDataPointers,
	interaction66OAMDataPointers,
	interaction67OAMDataPointers,
	interaction68OAMDataPointers,
	interaction69OAMDataPointers,
	interaction6AOAMDataPointers,
	interaction6BOAMDataPointers,
	interaction6COAMDataPointers,
	interaction6DOAMDataPointers,
	interaction6EOAMDataPointers,
	interaction6FOAMDataPointers,
	interaction70OAMDataPointers,
	interaction71OAMDataPointers,
	interaction72OAMDataPointers,
	interaction73OAMDataPointers,
	interaction74OAMDataPointers,
	interaction75OAMDataPointers,
	interaction76OAMDataPointers,
	interaction77OAMDataPointers,
	interaction78OAMDataPointers,
	interaction79OAMDataPointers,
	interaction7AOAMDataPointers,
	interaction7BOAMDataPointers,
	interaction7COAMDataPointers,
	interaction7DOAMDataPointers,
	interaction7EOAMDataPointers,
	interaction7FOAMDataPointers,
	interaction80OAMDataPointers,
	interaction81OAMDataPointers,
	interaction82OAMDataPointers,
	interaction83OAMDataPointers,
	interaction84OAMDataPointers,
	interaction85OAMDataPointers,
	interaction86OAMDataPointers,
	interaction87OAMDataPointers,
	interaction88OAMDataPointers,
	interaction89OAMDataPointers,
	interaction8AOAMDataPointers,
	interaction8BOAMDataPointers,
	interaction8COAMDataPointers,
	interaction8DOAMDataPointers,
	interaction8EOAMDataPointers,
	interaction8FOAMDataPointers,
	interaction90OAMDataPointers,
	interaction91OAMDataPointers,
	interaction92OAMDataPointers,
	interaction93OAMDataPointers,
	interaction94OAMDataPointers,
	interaction95OAMDataPointers,
	interaction96OAMDataPointers,
	interaction97OAMDataPointers,
	interaction98OAMDataPointers,
	interaction99OAMDataPointers,
	interaction9AOAMDataPointers,
	interaction9BOAMDataPointers,
	interaction9COAMDataPointers,
	interaction9DOAMDataPointers,
	interaction9EOAMDataPointers,
	interaction9FOAMDataPointers,
	interactionA0OAMDataPointers,
	interactionA1OAMDataPointers,
	interactionA2OAMDataPointers,
	interactionA3OAMDataPointers,
	interactionA4OAMDataPointers,
	interactionA5OAMDataPointers,
	interactionA6OAMDataPointers,
	interactionA7OAMDataPointers,
	interactionA8OAMDataPointers,
	interactionA9OAMDataPointers,
	interactionAAOAMDataPointers,
	interactionABOAMDataPointers,
	interactionACOAMDataPointers,
	interactionADOAMDataPointers,
	interactionAEOAMDataPointers,
	interactionAFOAMDataPointers,
	interactionB0OAMDataPointers,
	interactionB1OAMDataPointers,
	interactionB2OAMDataPointers,
	interactionB3OAMDataPointers,
	interactionB4OAMDataPointers,
	interactionB5OAMDataPointers,
	interactionB6OAMDataPointers,
	interactionB7OAMDataPointers,
	interactionB8OAMDataPointers,
	interactionB9OAMDataPointers,
	interactionBAOAMDataPointers,
	interactionBBOAMDataPointers,
	interactionBCOAMDataPointers,
	interactionBDOAMDataPointers,
	interactionBEOAMDataPointers,
	interactionBFOAMDataPointers,
	interactionC0OAMDataPointers,
	interactionC1OAMDataPointers,
	interactionC2OAMDataPointers,
	interactionC3OAMDataPointers,
	interactionC4OAMDataPointers,
	interactionC5OAMDataPointers,
	interactionC6OAMDataPointers,
	interactionC7OAMDataPointers,
	interactionC8OAMDataPointers,
	interactionC9OAMDataPointers,
	interactionCAOAMDataPointers,
	interactionCBOAMDataPointers,
	interactionCCOAMDataPointers,
	interactionCDOAMDataPointers,
	interactionCEOAMDataPointers,
	interactionCFOAMDataPointers,
	interactionD0OAMDataPointers,
	interactionD1OAMDataPointers,
	interactionD2OAMDataPointers,
	interactionD3OAMDataPointers,
	interactionD4OAMDataPointers,
	interactionD5OAMDataPointers,
	interactionD6OAMDataPointers,
	interactionD7OAMDataPointers,
	interactionD8OAMDataPointers,
	interactionD9OAMDataPointers,
	interactionDAOAMDataPointers,
	interactionDBOAMDataPointers,
	interactionDCOAMDataPointers,
	interactionDDOAMDataPointers,
	interactionDEOAMDataPointers,
	interactionDFOAMDataPointers,
	interactionE0OAMDataPointers,
	interactionE1OAMDataPointers,
	interactionE2OAMDataPointers,
	interactionE3OAMDataPointers,
	interactionE4OAMDataPointers,
	interactionE5OAMDataPointers,
	interactionE6OAMDataPointers,
];

alias interaction01Animations = interaction00Animations;
alias interaction0DAnimations = interaction00Animations;
alias interaction0EAnimations = interaction00Animations;
alias interaction12Animations = interaction00Animations;
alias interaction13Animations = interaction00Animations;
alias interaction15Animations = interaction00Animations;
alias interaction1DAnimations = interaction00Animations;
alias interaction1EAnimations = interaction00Animations;
alias interaction1FAnimations = interaction00Animations;
alias interaction20Animations = interaction00Animations;
alias interaction21Animations = interaction00Animations;
alias interaction22Animations = interaction00Animations;
alias interaction23Animations = interaction00Animations;
alias interaction24Animations = interaction00Animations;
alias interaction25Animations = interaction00Animations;
alias interaction26Animations = interaction00Animations;
alias interaction27Animations = interaction00Animations;
alias interaction2FAnimations = interaction00Animations;
alias interaction33Animations = interaction00Animations;
alias interaction67Animations = interaction00Animations;
alias interaction6CAnimations = interaction00Animations;
alias interaction70Animations = interaction00Animations;
alias interaction74Animations = interaction00Animations;
alias interaction76Animations = interaction00Animations;
alias interaction78Animations = interaction00Animations;
alias interaction7CAnimations = interaction00Animations;
alias interaction85Animations = interaction00Animations;
alias interaction8AAnimations = interaction00Animations;
alias interaction90Animations = interaction00Animations;
alias interaction97Animations = interaction00Animations;
alias interaction9BAnimations = interaction00Animations;
alias interactionA8Animations = interaction00Animations;
alias interactionACAnimations = interaction00Animations;
alias interactionB2Animations = interaction00Animations;
alias interactionB3Animations = interaction00Animations;
alias interactionB5Animations = interaction00Animations;
alias interactionBDAnimations = interaction00Animations;
alias interactionBEAnimations = interaction00Animations;
alias interactionC5Animations = interaction00Animations;
alias interactionC6Animations = interaction00Animations;
alias interactionC7Animations = interaction00Animations;
alias interactionD0Animations = interaction00Animations;
alias interactionD1Animations = interaction00Animations;
alias interactionD8Animations = interaction00Animations;
alias interactionD9Animations = interaction00Animations;
alias interactionDAAnimations = interaction00Animations;
alias interactionDBAnimations = interaction00Animations;
alias interactionDCAnimations = interaction00Animations;
alias interactionE4Animations = interaction00Animations;
immutable interaction00Animations = [
	interactionAnimation5A083,
];
immutable interaction02Animations = [
	interactionAnimation5A09E,
];
immutable interaction03Animations = [
	interactionAnimation5A0BC,
];
immutable interaction04Animations = [
	interactionAnimation5A0D1,
];
immutable interaction05Animations = [
	interactionAnimation5A0F2,
];
alias interaction09Animations = interaction06Animations;
alias interaction0CAnimations = interaction06Animations;
alias interaction82Animations = interaction06Animations;
immutable interaction06Animations = [
	interactionAnimation5A113,
	interactionAnimation5A3C3,
];
immutable interaction07Animations = [
	interactionAnimation5A0C8,
];
immutable interaction08Animations = [
	interactionAnimation5A122,
];
immutable interaction0AAnimations = [
	interactionAnimation5A397,
	interactionAnimation5A39D,
	interactionAnimation5A3A3,
	interactionAnimation5A3A9,
];
immutable interaction0BAnimations = [
	interactionAnimation5A13A,
	interactionAnimation5A143,
];
alias interaction1CAnimations = interaction14Animations;
alias interaction34Animations = interaction14Animations;
alias interaction9EAnimations = interaction14Animations;
alias interactionA3Animations = interaction14Animations;
alias interactionE5Animations = interaction14Animations;
immutable interaction14Animations = [
	interactionAnimation5A3AF,
	interactionAnimation5A3B4,
];
immutable interaction19Animations = [
	interactionAnimation5A3AF,
	interactionAnimation5A3B4,
	interactionAnimation5A3B9,
	interactionAnimation5A3BE,
	interactionAnimation5A3C3,
	interactionAnimation5A3CB,
	interactionAnimation5A14C,
	interactionAnimation5A158,
	interactionAnimation5A164,
	interactionAnimation5A170,
	interactionAnimation5A17C,
	interactionAnimation5A188,
	interactionAnimation5A194,
	interactionAnimation5A1A0,
	interactionAnimation5A1AC,
	interactionAnimation5A1B8,
	interactionAnimation5A1C4,
	interactionAnimation5A1D0,
	interactionAnimation5A1DC,
	interactionAnimation5A1E8,
	interactionAnimation5A1F4,
	interactionAnimation5A200,
	interactionAnimation5A20C,
	interactionAnimation5A218,
	interactionAnimation5A224,
	interactionAnimation5A230,
	interactionAnimation5A23C,
	interactionAnimation5A248,
	interactionAnimation5A254,
	interactionAnimation5A260,
];
immutable interaction1AAnimations = [
	interactionAnimation5A26C,
];
immutable interaction1BAnimations = [
	interactionAnimation5A27A,
	interactionAnimation5A283,
	interactionAnimation5A28C,
	interactionAnimation5A295,
];
alias interaction32Animations = interaction31Animations;
alias interaction4FAnimations = interaction31Animations;
immutable interaction31Animations = [
	interactionAnimation5A468,
	interactionAnimation5A5A6,
	interactionAnimation5A60C,
	interactionAnimation5A653,
	interactionAnimation5A66B,
	interactionAnimation5A679,
	interactionAnimation5A67F,
	interactionAnimation5A684,
	interactionAnimation5A692,
	interactionAnimation5A6A0,
];
immutable interaction28Animations = [
	interactionAnimation5A3AF,
	interactionAnimation5A3B4,
	interactionAnimation5A470,
	interactionAnimation5A5AE,
	interactionAnimation5A5F4,
	interactionAnimation5A638,
	interactionAnimation5A3DA,
	interactionAnimation5A3DF,
	interactionAnimation5A723,
	interactionAnimation5A743,
	interactionAnimation5A74B,
	interactionAnimation5A76B,
];
immutable interaction2BAnimations = [
	interactionAnimation5A478,
	interactionAnimation5A5B6,
	interactionAnimation5A480,
	interactionAnimation5A485,
	interactionAnimation5A492,
	interactionAnimation5A4A2,
];
immutable interaction2CAnimations = [
	interactionAnimation5A468,
	interactionAnimation5A29E,
];
immutable interaction35Animations = [
	interactionAnimation5A440,
	interactionAnimation5A586,
	interactionAnimation5A48A,
	interactionAnimation5A3C3,
	interactionAnimation5A3CB,
	interactionAnimation5A49A,
	interactionAnimation5A3D0,
	interactionAnimation5A3D5,
	interactionAnimation5A713,
	interactionAnimation5A3DA,
	interactionAnimation5A3DF,
	interactionAnimation5A733,
	interactionAnimation5A753,
	interactionAnimation5A3E4,
	interactionAnimation5A3E9,
	interactionAnimation5A3EE,
	interactionAnimation5A3F3,
	interactionAnimation5A40C,
	interactionAnimation5A411,
	interactionAnimation5A41B,
	interactionAnimation5A423,
	interactionAnimation5A42B,
	interactionAnimation5A433,
	interactionAnimation5A43B,
];
immutable interaction36Animations= [
	interactionAnimation5A468,
	interactionAnimation5A5A6,
	interactionAnimation5A60C,
	interactionAnimation5A653,
	interactionAnimation5A813,
	interactionAnimation5A796,
	interactionAnimation5A8DA,
	interactionAnimation5A8E8,
];
immutable interaction37Animations = [
	interactionAnimation5A468,
	interactionAnimation5A5A6,
	interactionAnimation5A60C,
	interactionAnimation5A653,
	interactionAnimation5A4AA,
	interactionAnimation5A4CC,
	interactionAnimation5A4BB,
	interactionAnimation5A4DD,
	interactionAnimation5A4EE,
	interactionAnimation5A3C3,
	interactionAnimation5A3B9,
	interactionAnimation5A50E,
	interactionAnimation5A40C,
];
immutable interaction39Animations = [
	interactionAnimation5A3B9,
	interactionAnimation5A3BE,
	interactionAnimation5A468,
	interactionAnimation5A826,
	interactionAnimation5A528,
	interactionAnimation5A653,
	interactionAnimation5A5BE,
	interactionAnimation5A5E4,
	interactionAnimation5A5EC,
];
alias interaction3AAnimations = interaction2EAnimations;
alias interaction3BAnimations = interaction2EAnimations;
alias interaction3CAnimations = interaction2EAnimations;
alias interaction3DAnimations = interaction2EAnimations;
alias interaction3FAnimations = interaction2EAnimations;
alias interaction40Animations = interaction2EAnimations;
alias interaction4DAnimations = interaction2EAnimations;
alias interaction4EAnimations = interaction2EAnimations;
alias interaction52Animations = interaction2EAnimations;
alias interaction53Animations = interaction2EAnimations;
alias interaction55Animations = interaction2EAnimations;
alias interaction58Animations = interaction2EAnimations;
alias interaction59Animations = interaction2EAnimations;
alias interaction69Animations = interaction2EAnimations;
alias interaction71Animations = interaction2EAnimations;
alias interaction8DAnimations = interaction2EAnimations;
alias interaction93Animations = interaction2EAnimations;
alias interaction9DAnimations = interaction2EAnimations;
alias interactionABAnimations = interaction2EAnimations;
alias interactionBFAnimations = interaction2EAnimations;
alias interactionC2Animations = interaction2EAnimations;
alias interactionC4Animations = interaction2EAnimations;
immutable interaction2EAnimations = [
	interactionAnimation5A468,
	interactionAnimation5A5A6,
	interactionAnimation5A60C,
	interactionAnimation5A653,
	interactionAnimation5A61C,
	interactionAnimation5A62A,
	interactionAnimation5A3EE,
	interactionAnimation5A71B,
	interactionAnimation5A743,
	interactionAnimation5A763,
	interactionAnimation5A3DA,
	interactionAnimation5A663,
	interactionAnimation5A3D5,
	interactionAnimation5A3BE,
];
immutable interaction3EAnimations = [
	interactionAnimation5A6AE,
];
alias interaction41Animations = interaction30Animations;
immutable interaction30Animations = [
	interactionAnimation5A5A6,
	interactionAnimation5A5A6,
	interactionAnimation5A468,
	interactionAnimation5A468,
	interactionAnimation5A60C,
	interactionAnimation5A458,
];
alias interaction42Animations = interaction38Animations;
alias interaction43Animations = interaction38Animations;
alias interaction44Animations = interaction38Animations;
alias interaction45Animations = interaction38Animations;
alias interactionC3Animations = interaction38Animations;
alias interactionCAAnimations = interaction38Animations;
alias interactionCCAnimations = interaction38Animations;
alias interactionCDAnimations = interaction38Animations;
immutable interaction38Animations = [
	interactionAnimation5A3B4,
	interactionAnimation5A3B4,
	interactionAnimation5A3AF,
	interactionAnimation5A3AF,
	interactionAnimation5A468,
];
immutable interaction48Animations = [
	interactionAnimation5A468,
	interactionAnimation5A5A6,
	interactionAnimation5A60C,
	interactionAnimation5A653,
	interactionAnimation5A71B,
	interactionAnimation5A73B,
	interactionAnimation5A75B,
	interactionAnimation5A79B,
	interactionAnimation5A7A9,
	interactionAnimation5A7A1,
];
immutable interaction4BAnimations = [
	interactionAnimation5A468,
	interactionAnimation5A5A6,
	interactionAnimation5A60C,
	interactionAnimation5A653,
	interactionAnimation5A82E,
	interactionAnimation5A648,
	interactionAnimation5A64E,
	interactionAnimation5A836,
	interactionAnimation5A3E4,
	interactionAnimation5A3E9,
];
alias interactionE3Animations = interaction4CAnimations;
immutable interaction4CAnimations = [
	interactionAnimation5A460,
	interactionAnimation5A596,
	interactionAnimation5A604,
	interactionAnimation5A640,
];
immutable interaction5DAnimations = [
	interactionAnimation5A468,
	interactionAnimation5A5A6,
	interactionAnimation5A60C,
];
alias interaction61Animations = interaction5EAnimations;
alias interactionBBAnimations = interaction5EAnimations;
immutable interaction5EAnimations = [
	interactionAnimation5A3AF,
	interactionAnimation5A3B4,
	interactionAnimation5A3B9,
	interactionAnimation5A3BE,
	interactionAnimation5A3C3,
	interactionAnimation5A3CB,
	interactionAnimation5A3D0,
	interactionAnimation5A3D5,
	interactionAnimation5A3DA,
	interactionAnimation5A3DF,
	interactionAnimation5A3E4,
	interactionAnimation5A3E9,
	interactionAnimation5A3EE,
	interactionAnimation5A3F3,
	interactionAnimation5A3F8,
	interactionAnimation5A3FD,
	interactionAnimation5A402,
	interactionAnimation5A407,
	interactionAnimation5A40C,
	interactionAnimation5A411,
	interactionAnimation5A416,
];
immutable interaction49Animations = [
	interactionAnimation5A448,
	interactionAnimation5A875,
];
immutable interaction51Animations = [
	interactionAnimation5A5C6,
	interactionAnimation5A614,
];
immutable interaction54Animations = [
	interactionAnimation5A448,
	interactionAnimation5A5D4,
	interactionAnimation5A450,
	interactionAnimation5A5DC,
];
alias interaction99Animations = interaction56Animations;
immutable interaction56Animations = [
	interactionAnimation5A902,
	interactionAnimation5A3CB,
];
immutable interaction57Animations = [
	interactionAnimation5A917,
	interactionAnimation5A922,
	interactionAnimation5A92D,
	interactionAnimation5A3C3,
	interactionAnimation5A65B,
	interactionAnimation5A72B,
	interactionAnimation5A73B,
	interactionAnimation5A75B,
];
alias interaction5AAnimations = interaction2DAnimations;
immutable interaction2DAnimations = [
	interactionAnimation5A470,
	interactionAnimation5A5AE,
	interactionAnimation5A60C,
	interactionAnimation5A653,
];
immutable interaction5BAnimations = [
	interactionAnimation5A953,
	interactionAnimation5A95F,
	interactionAnimation5A967,
];
immutable interaction5CAnimations = [
	interactionAnimation5A468,
	interactionAnimation5A5A6,
];
immutable interaction62Animations = [
	interactionAnimation5A3AF,
	interactionAnimation5A3B4,
];
immutable interaction65Animations = [
	interactionAnimation5A468,
	interactionAnimation5A5A6,
	interactionAnimation5A5A6,
	interactionAnimation5A468,
	interactionAnimation5A60C,
	interactionAnimation5A653,
	interactionAnimation5A653,
	interactionAnimation5A60C,
];
immutable interaction66Animations = [
	interactionAnimation5A468,
	interactionAnimation5A5A6,
	interactionAnimation5A60C,
	interactionAnimation5A653,
	interactionAnimation5A3DA,
	interactionAnimation5A3DF,
	interactionAnimation5A3E4,
	interactionAnimation5A3E9,
	interactionAnimation5A973,
];
immutable interactionC8Animations = [
	interactionAnimation5A3AF,
	interactionAnimation5A9A5,
	interactionAnimation5A3C8,
	interactionAnimation5A7B7,
];
immutable interaction68Animations = [
	interactionAnimation5A468,
	interactionAnimation5A5A6,
	interactionAnimation5A60C,
	interactionAnimation5A653,
	interactionAnimation5A71B,
	interactionAnimation5A73B,
	interactionAnimation5A75B,
	interactionAnimation5A773,
];
alias interaction6AAnimations = interaction2AAnimations;
immutable interaction2AAnimations = [
	interactionAnimation5A7C2,
];
immutable interaction6BAnimations = [
	interactionAnimation5A468,
	interactionAnimation5A3C3,
	interactionAnimation5A3CB,
	interactionAnimation5A3D0,
	interactionAnimation5A3D5,
	interactionAnimation5A3DA,
	interactionAnimation5A3DF,
	interactionAnimation5A5A6,
	interactionAnimation5A3E4,
	interactionAnimation5A3E9,
	interactionAnimation5A530,
];
immutable interaction7DAnimations = [
	interactionAnimation5A2B7,
	interactionAnimation5A2C9,
	interactionAnimation5A2DB,
	interactionAnimation5A2E9,
];
alias interaction79Animations = interactionE0Animations;
immutable interactionE0Animations = [
	interactionAnimation5A3AF,
	interactionAnimation5A3B4,
	interactionAnimation5A3B9,
	interactionAnimation5A3BE,
	interactionAnimation5A3C3,
	interactionAnimation5A3CB,
];
immutable interaction7AAnimations = [
	interactionAnimation5A2F7,
	interactionAnimation5A303,
	interactionAnimation5A30F,
	interactionAnimation5A31B,
	interactionAnimation5A327,
	interactionAnimation5A333,
];
alias interaction18Animations = interaction17Animations;
alias interaction47Animations = interaction17Animations;
alias interaction60Animations = interaction17Animations;
alias interaction63Animations = interaction17Animations;
alias interaction77Animations = interaction17Animations;
alias interaction81Animations = interaction17Animations;
alias interaction8CAnimations = interaction17Animations;
alias interaction8FAnimations = interaction17Animations;
alias interaction91Animations = interaction17Animations;
alias interactionA5Animations = interaction17Animations;
alias interactionB1Animations = interaction17Animations;
alias interactionB6Animations = interaction17Animations;
alias interactionD7Animations = interaction17Animations;
immutable interaction17Animations = [
	interactionAnimation5A3AF,
	interactionAnimation5A34D,
	interactionAnimation5A3BE,
	interactionAnimation5A3C3,
	interactionAnimation5A3CB,
	interactionAnimation5A448,
	interactionAnimation5A3D0,
	interactionAnimation5A3D5,
	interactionAnimation5AABF,
	interactionAnimation5A3F3,
	interactionAnimation5A3F8,
	interactionAnimation5ABCE,
	interactionAnimation5A3AF,
	interactionAnimation5A40C,
];
immutable interaction64Animations = [
	interactionAnimation5A3C3,
	interactionAnimation5A26C,
];
immutable interaction6FAnimations = [
	interactionAnimation5A448,
	interactionAnimation5A3B9,
];
immutable interaction7EAnimations = [
	interactionAnimation5A38F,
];
alias interactionA0Animations = interaction7FAnimations;
alias interactionA6Animations = interaction7FAnimations;
immutable interaction7FAnimations = [
	interactionAnimation5A3AF,
	interactionAnimation5A3B4,
	interactionAnimation5A3B9,
	interactionAnimation5A33F,
];
alias interaction7BAnimations = interaction16Animations;
immutable interaction16Animations = [
	interactionAnimation5A3AF,
	interactionAnimation5A3B4,
];
immutable interactionE2Animations = [
	interactionAnimation5A3AF,
	interactionAnimation5A3B4,
	interactionAnimation5A3B9,
	interactionAnimation5A3BE,
	interactionAnimation5A3C3,
	interactionAnimation5A3CB,
	interactionAnimation5A3D0,
	interactionAnimation5A3D5,
];
alias interaction29Animations = interaction10Animations;
alias interaction46Animations = interaction10Animations;
alias interaction96Animations = interaction10Animations;
immutable interaction10Animations = [
	interactionAnimation5A468,
	interactionAnimation5A5A6,
	interactionAnimation5A60C,
	interactionAnimation5A653,
	interactionAnimation5A60C,
	interactionAnimation5A3C8,
	interactionAnimation5A3C8,
	interactionAnimation5A71B,
	interactionAnimation5A73B,
	interactionAnimation5A75B,
	interactionAnimation5A773,
	interactionAnimation5AC1D,
	interactionAnimation5AC2E,
];
alias interaction9FAnimations = interaction50Animations;
alias interactionD5Animations = interaction50Animations;
immutable interaction50Animations = [
	interactionAnimation5A448,
	interactionAnimation5AC5B,
];
immutable interaction4AAnimations = [
	interactionAnimation5A87D,
	interactionAnimation5A87D,
	interactionAnimation5A88B,
	interactionAnimation5A899,
	interactionAnimation5A8AA,
	interactionAnimation5A8BB,
	interactionAnimation5A40C,
	interactionAnimation5A8C9,
];
immutable interaction0FAnimations = [
	interactionAnimation5A8CE,
	interactionAnimation5A0BC,
];
alias interaction6EAnimations = interaction6DAnimations;
immutable interaction6DAnimations = [
	interactionAnimation5A468,
	interactionAnimation5A5A6,
	interactionAnimation5A60C,
	interactionAnimation5A653,
	interactionAnimation5A71B,
	interactionAnimation5A73B,
	interactionAnimation5A75B,
	interactionAnimation5A773,
	interactionAnimation5A9AD,
	interactionAnimation5A9B0,
	interactionAnimation5A9BE,
	interactionAnimation5A9C3,
	interactionAnimation5A9C8,
	interactionAnimation5A9D0,
	interactionAnimation5A9D8,
	interactionAnimation5A9E0,
	interactionAnimation5A9E8,
	interactionAnimation5A9F0,
	interactionAnimation5A9F8,
	interactionAnimation5AA00,
];
immutable interaction80Animations = [
	interactionAnimation5AA90,
	interactionAnimation5AA9E,
	interactionAnimation5A3D5,
	interactionAnimation5A3F8,
	interactionAnimation5A3DA,
	interactionAnimation5A3DF,
	interactionAnimation5AAA9,
	interactionAnimation5AAB7,
];
immutable interactionE1Animations = [
	interactionAnimation5AA7C,
];
immutable interaction72Animations = [
	interactionAnimation5AB27,
	interactionAnimation5AB2F,
	interactionAnimation5AB37,
	interactionAnimation5A49A,
	interactionAnimation5A71B,
	interactionAnimation5A73B,
	interactionAnimation5A75B,
	interactionAnimation5A773,
];
immutable interaction73Animations = [
	interactionAnimation5A448,
];
immutable interaction75Animations = [
	interactionAnimation5AA13,
	interactionAnimation5AA27,
	interactionAnimation5AA38,
	interactionAnimation5AA52,
	interactionAnimation5AA5A,
	interactionAnimation5A3CB,
	interactionAnimation5AA6E,
];
immutable interaction83Animations = [
	interactionAnimation5A448,
	interactionAnimation5A3B9,
];
alias interaction84Animations = interaction11Animations;
alias interactionDEAnimations = interaction11Animations;
immutable interaction11Animations = [
	interactionAnimation5A6E1,
	interactionAnimation5A6F1,
	interactionAnimation5AAD3,
	interactionAnimation5A6D6,
	interactionAnimation5A6E9,
];
immutable interaction86Animations = [
	interactionAnimation5A3AF,
	interactionAnimation5A3B4,
	interactionAnimation5A3B9,
	interactionAnimation5A3BE,
];
immutable interaction87Animations = [
	interactionAnimation5AAE1,
	interactionAnimation5AAF5,
	interactionAnimation5AAFD,
	interactionAnimation5AB11,
	interactionAnimation5AB19,
];
immutable interaction88Animations = [
	interactionAnimation5AB27,
	interactionAnimation5AB2F,
	interactionAnimation5AB37,
];
immutable interaction89Animations = [
	interactionAnimation5AB3F,
	interactionAnimation5AB59,
	interactionAnimation5AB64,
	interactionAnimation5AB6F,
	interactionAnimation5AB78,
	interactionAnimation5AB86,
	interactionAnimation5AB8B,
	interactionAnimation5AB96,
	interactionAnimation5ABA1,
];
immutable interaction8BAnimations = [
	interactionAnimation5A468,
	interactionAnimation5A5A6,
	interactionAnimation5A60C,
	interactionAnimation5A653,
	interactionAnimation5A7D0,
];
immutable interaction8EAnimations = [
	interactionAnimation5ABAA,
	interactionAnimation5ABB3,
	interactionAnimation5ABBC,
	interactionAnimation5ABC5,
];
alias interactionE6Animations = interaction94Animations;
immutable interaction94Animations = [
	interactionAnimation5A468,
	interactionAnimation5A5A6,
	interactionAnimation5A60C,
	interactionAnimation5A653,
	interactionAnimation5A3DA,
	interactionAnimation5AC05,
	interactionAnimation5ABED,
	interactionAnimation5ABF5,
	interactionAnimation5ABFD,
	interactionAnimation5A3C3,
	interactionAnimation5A3FD,
	interactionAnimation5A402,
	interactionAnimation5A407,
];
immutable interaction9AAnimations = [
	interactionAnimation5A468,
	interactionAnimation5A5A6,
	interactionAnimation5A60C,
	interactionAnimation5A653,
	interactionAnimation5A71B,
	interactionAnimation5A3E4,
	interactionAnimation5A3E9,
];
immutable interaction9CAnimations = [
	interactionAnimation5AC3F,
	interactionAnimation5A3BE,
];
immutable interaction92Animations = [
	interactionAnimation5ABDC,
	interactionAnimation5A3CB,
	interactionAnimation5A702,
];
immutable interaction95Animations= [
	interactionAnimation5A3AF,
];
alias interactionB4Animations = interaction98Animations;
immutable interaction98Animations = [
	interactionAnimation5A3AF,
	interactionAnimation5A3B4,
	interactionAnimation5A3B9,
	interactionAnimation5A3BE,
];
alias interactionA4Animations = interactionA1Animations;
immutable interactionA1Animations = [
	interactionAnimation5AC69,
	interactionAnimation5AC6C,
	interactionAnimation5AC6F,
	interactionAnimation5AC72,
	interactionAnimation5AC75,
];
immutable interactionA2Animations = [
	interactionAnimation5AC78,
	interactionAnimation5AC86,
];
immutable interactionA7Animations = [
	interactionAnimation5A83E,
	interactionAnimation5A821,
	interactionAnimation5A86D,
	interactionAnimation5A85C,
	interactionAnimation5A71B,
];
immutable interactionA9Animations = [
	interactionAnimation5A358,
];
immutable interactionAAAnimations = [
	interactionAnimation5A468,
	interactionAnimation5A5A6,
	interactionAnimation5A60C,
	interactionAnimation5A653,
	interactionAnimation5A369,
	interactionAnimation5A71B,
];
immutable interactionADAnimations = [
	interactionAnimation5A468,
	interactionAnimation5A5A6,
	interactionAnimation5A60C,
	interactionAnimation5A653,
	interactionAnimation5A60C,
	interactionAnimation5A3DA,
	interactionAnimation5A556,
	interactionAnimation5A56D,
	interactionAnimation5A3F3,
];
alias interactionAFAnimations = interactionAEAnimations;
alias interactionC0Animations = interactionAEAnimations;
alias interactionD4Animations = interactionAEAnimations;
immutable interactionAEAnimations = [
	interactionAnimation5A3AF,
	interactionAnimation5A3B4,
	interactionAnimation5A3B9,
	interactionAnimation5A3BE,
	interactionAnimation5A3C3,
	interactionAnimation5A3CB,
	interactionAnimation5A3D0,
	interactionAnimation5A3D5,
	interactionAnimation5A6C8,
	interactionAnimation5A864,
	interactionAnimation5A793,
	interactionAnimation5A796,
	interactionAnimation5A7DE,
	interactionAnimation5A3F3,
	interactionAnimation5A8C9,
	interactionAnimation5AC0D,
	interactionAnimation5AC10,
	interactionAnimation5AC15,
	interactionAnimation5AC18,
	interactionAnimation5A411,
	interactionAnimation5A846,
	interactionAnimation5A849,
	interactionAnimation5A84E,
	interactionAnimation5A853,
	interactionAnimation5A856,
	interactionAnimation5A859,
	interactionAnimation5A84E,
];
immutable interactionB8Animations = [
	interactionAnimation5A468,
	interactionAnimation5A3B9,
];
immutable interactionB0Animations = [
	interactionAnimation5A470,
	interactionAnimation5A5AE,
];
immutable interactionB7Animations = [
	interactionAnimation5AC94,
	interactionAnimation5ACA5,
];
immutable interactionB9Animations = [
	interactionAnimation5A73B,
	interactionAnimation5A73B,
	interactionAnimation5A468,
	interactionAnimation5ACBC,
	interactionAnimation5A653,
	interactionAnimation5ACCA,
	interactionAnimation5A77B,
	interactionAnimation5A783,
	interactionAnimation5A75B,
	interactionAnimation5A80B,
	interactionAnimation5A75B,
	interactionAnimation5A80B,
	interactionAnimation5A75B,
	interactionAnimation5A80B,
	interactionAnimation5A78B,
	interactionAnimation5A78B,
];
immutable interactionBCAnimations = [
	interactionAnimation5A468,
	interactionAnimation5A5A6,
	interactionAnimation5A60C,
	interactionAnimation5A653,
	interactionAnimation5A71B,
];
immutable interactionC1Animations = [
	interactionAnimation5ACD8,
];
immutable interaction5FAnimations = [
	interactionAnimation5A2A9,
];
immutable interactionC9Animations = [
	interactionAnimation5A448,
	interactionAnimation5A58E,
];
alias interactionCBAnimations = interactionBAAnimations;
immutable interactionBAAnimations = [
	interactionAnimation5A468,
];
immutable interactionCEAnimations = [
	interactionAnimation5A3AF,
	interactionAnimation5ACE7,
	interactionAnimation5ACFA,
	interactionAnimation5ACF2,
	interactionAnimation5ACEA,
	interactionAnimation5A3D0,
];
immutable interactionCFAnimations = [
	interactionAnimation5AD05,
	interactionAnimation5AD08,
	interactionAnimation5AD0B,
];
immutable interactionD2Animations = [
	interactionAnimation5A3AF,
	interactionAnimation5A3B4,
	interactionAnimation5A3B9,
	interactionAnimation5A3BE,
];
immutable interactionD3Animations = [
	interactionAnimation5AD16,
	interactionAnimation5AD21,
];
immutable interactionD6Animations = [
	interactionAnimation5AD43,
	interactionAnimation5AD2C,
	interactionAnimation5AD35,
	interactionAnimation5AD3A,
	interactionAnimation5AD48,
];
immutable interactionDFAnimations = [
	interactionAnimation5A57E,
	interactionAnimation5A59E,
	interactionAnimation5A60C,
	interactionAnimation5A653,
	interactionAnimation5A468,
	interactionAnimation5A581,
];
immutable interactionDDAnimations = [
	interactionAnimation5AD5F,
	interactionAnimation5AD74,
	interactionAnimation5AD89,
	interactionAnimation5ADB2,
	interactionAnimation5ADCC,
	interactionAnimation5ADF0,
];

immutable AnimationData[] interactionAnimation5A083 = [
	AnimationData.frame(0x04, 0x00, 0x00),
	AnimationData.frame(0x04, 0x02, 0x00),
	AnimationData.frame(0x04, 0x04, 0x00),
	AnimationData.frame(0x04, 0x06, 0x00),
	AnimationData.frame(0x04, 0x08, 0x00),
	AnimationData.frame(0x04, 0x0a, 0x00),
	AnimationData.frame(0x04, 0x0c, 0x00),
	AnimationData.frame(0x04, 0x0e, 0x00),
	AnimationData.frame(0x7f, 0x0e, 0xff),
];
immutable AnimationData[] interactionAnimation5A09E = [
	AnimationData.frame(0x04, 0x00, 0x00),
	AnimationData.frame(0x04, 0x02, 0x00),
	AnimationData.frame(0x04, 0x04, 0x00),
	AnimationData.frame(0x04, 0x06, 0x00),
	AnimationData.frame(0x04, 0x08, 0x00),
	AnimationData.frame(0x04, 0x0a, 0x00),
	AnimationData.frame(0x04, 0x0c, 0x00),
	AnimationData.frame(0x04, 0x0e, 0x00),
	AnimationData.frame(0x04, 0x10, 0x00),
	AnimationData.frame(0x7f, 0x10, 0xff),
];
immutable AnimationData[] interactionAnimation5A0BC = [
	AnimationData.frame(0x04, 0x00, 0x00),
	AnimationData.frame(0x04, 0x02, 0x00),
	AnimationData.frame(0x04, 0x04, 0x00),
	AnimationData.frame(0x7f, 0x04, 0xff),
];
immutable AnimationData[] interactionAnimation5A0C8 = [
	AnimationData.frame(0x04, 0x00, 0x00),
	AnimationData.frame(0x04, 0x02, 0x00),
	AnimationData.frame(0x7f, 0x02, 0xff),
];
immutable AnimationData[] interactionAnimation5A0D1 = [
	AnimationData.frame(0x02, 0x00, 0x00),
	AnimationData.frame(0x02, 0x02, 0x00),
	AnimationData.frame(0x02, 0x04, 0x00),
	AnimationData.frame(0x02, 0x06, 0x00),
	AnimationData.frame(0x02, 0x08, 0x00),
	AnimationData.frame(0x02, 0x0a, 0x00),
	AnimationData.frame(0x02, 0x0c, 0x00),
	AnimationData.frame(0x02, 0x0e, 0x00),
	AnimationData.frame(0x02, 0x10, 0x00),
	AnimationData.frame(0x02, 0x12, 0x00),
	AnimationData.frame(0x7f, 0x12, 0xff),
];
immutable AnimationData[] interactionAnimation5A0F2 = [
	AnimationData.frame(0x06, 0x00, 0x00),
	AnimationData.frame(0x08, 0x02, 0x00),
	AnimationData.frame(0x04, 0x04, 0x00),
	AnimationData.frame(0x7f, 0x04, 0xff),
	AnimationData.frame(0x04, 0x06, 0x00),
	AnimationData.frame(0x04, 0x08, 0x00),
	AnimationData.frame(0x03, 0x06, 0x00),
	AnimationData.frame(0x07, 0x0a, 0x00),
	AnimationData.frame(0x08, 0x0c, 0x00),
	AnimationData.frame(0x08, 0x0e, 0x00),
	AnimationData.frame(0x80, 0x0e, 0xff),
];
immutable AnimationData[] interactionAnimation5A113 = [
	AnimationData.frame(0x04, 0x00, 0x00),
	AnimationData.frame(0x04, 0x02, 0x00),
	AnimationData.frame(0x04, 0x04, 0x00),
	AnimationData.frame(0x04, 0x06, 0x00),
	AnimationData.frame(0x7f, 0x06, 0xff),
];
immutable AnimationData[] interactionAnimation5A122 = [
	AnimationData.frame(0x02, 0x00, 0x00),
	AnimationData.frame(0x02, 0x02, 0x00),
	AnimationData.frame(0x02, 0x00, 0x00),
	AnimationData.frame(0x04, 0x04, 0x00),
	AnimationData.frame(0x04, 0x06, 0x00),
	AnimationData.frame(0x04, 0x08, 0x00),
	AnimationData.frame(0x02, 0x0a, 0x00),
	AnimationData.frame(0x7f, 0x0a, 0xff),
];
immutable AnimationData[] interactionAnimation5A13A = [
	AnimationData.frame(0x04, 0x00, 0x00),
	AnimationData.frame(0x04, 0x02, 0x00),
	AnimationData.frame(0x7f, 0x02, 0xff),
];
immutable AnimationData[] interactionAnimation5A143 = [
	AnimationData.frame(0x04, 0x02, 0x00),
	AnimationData.frame(0x02, 0x00, 0x00),
	AnimationData.frame(0x7f, 0x00, 0xff),
];
immutable AnimationData[] interactionAnimation5A14C = [
	AnimationData.frame(0x04, 0x0c, 0x08),
	AnimationData.frame(0x04, 0x0e, 0x08),
	AnimationData.frame(0x04, 0x10, 0x08),
	AnimationData.frame(0x7f, 0x06, 0x83),
];
immutable AnimationData[] interactionAnimation5A158 = [
	AnimationData.frame(0x04, 0x12, 0x04),
	AnimationData.frame(0x04, 0x14, 0x04),
	AnimationData.frame(0x04, 0x16, 0x04),
	AnimationData.frame(0x7f, 0x06, 0x83),
];
immutable AnimationData[] interactionAnimation5A164 = [
	AnimationData.frame(0x04, 0x16, 0x08),
	AnimationData.frame(0x04, 0x14, 0x08),
	AnimationData.frame(0x04, 0x12, 0x08),
	AnimationData.frame(0x7f, 0x00, 0x80),
];
immutable AnimationData[] interactionAnimation5A170 = [
	AnimationData.frame(0x04, 0x10, 0x04),
	AnimationData.frame(0x04, 0x0e, 0x04),
	AnimationData.frame(0x04, 0x0c, 0x04),
	AnimationData.frame(0x7f, 0x00, 0x80),
];
immutable AnimationData[] interactionAnimation5A17C = [
	AnimationData.frame(0x04, 0x18, 0x08),
	AnimationData.frame(0x04, 0x1a, 0x08),
	AnimationData.frame(0x04, 0x1c, 0x08),
	AnimationData.frame(0x7f, 0x0a, 0x85),
];
immutable AnimationData[] interactionAnimation5A188 = [
	AnimationData.frame(0x04, 0x1e, 0x04),
	AnimationData.frame(0x04, 0x20, 0x04),
	AnimationData.frame(0x04, 0x22, 0x04),
	AnimationData.frame(0x7f, 0x0a, 0x85),
];
immutable AnimationData[] interactionAnimation5A194 = [
	AnimationData.frame(0x04, 0x22, 0x08),
	AnimationData.frame(0x04, 0x20, 0x08),
	AnimationData.frame(0x04, 0x1e, 0x08),
	AnimationData.frame(0x7f, 0x04, 0x82),
];
immutable AnimationData[] interactionAnimation5A1A0 = [
	AnimationData.frame(0x04, 0x1c, 0x04),
	AnimationData.frame(0x04, 0x1a, 0x04),
	AnimationData.frame(0x04, 0x18, 0x04),
	AnimationData.frame(0x7f, 0x04, 0x82),
];
immutable AnimationData[] interactionAnimation5A1AC = [
	AnimationData.frame(0x04, 0x24, 0x08),
	AnimationData.frame(0x04, 0x26, 0x08),
	AnimationData.frame(0x04, 0x28, 0x08),
	AnimationData.frame(0x7f, 0x02, 0x81),
];
immutable AnimationData[] interactionAnimation5A1B8 = [
	AnimationData.frame(0x04, 0x2a, 0x04),
	AnimationData.frame(0x04, 0x2c, 0x04),
	AnimationData.frame(0x04, 0x2e, 0x04),
	AnimationData.frame(0x7f, 0x02, 0x81),
];
immutable AnimationData[] interactionAnimation5A1C4 = [
	AnimationData.frame(0x04, 0x2e, 0x08),
	AnimationData.frame(0x04, 0x2c, 0x08),
	AnimationData.frame(0x04, 0x2a, 0x08),
	AnimationData.frame(0x7f, 0x08, 0x84),
];
immutable AnimationData[] interactionAnimation5A1D0 = [
	AnimationData.frame(0x04, 0x28, 0x04),
	AnimationData.frame(0x04, 0x26, 0x04),
	AnimationData.frame(0x04, 0x24, 0x04),
	AnimationData.frame(0x7f, 0x08, 0x84),
];
immutable AnimationData[] interactionAnimation5A1DC = [
	AnimationData.frame(0x04, 0x30, 0x02),
	AnimationData.frame(0x04, 0x32, 0x02),
	AnimationData.frame(0x04, 0x34, 0x02),
	AnimationData.frame(0x7f, 0x02, 0x81),
];
immutable AnimationData[] interactionAnimation5A1E8 = [
	AnimationData.frame(0x04, 0x3a, 0x06),
	AnimationData.frame(0x04, 0x38, 0x06),
	AnimationData.frame(0x04, 0x36, 0x06),
	AnimationData.frame(0x7f, 0x02, 0x81),
];
immutable AnimationData[] interactionAnimation5A1F4 = [
	AnimationData.frame(0x04, 0x36, 0x02),
	AnimationData.frame(0x04, 0x38, 0x02),
	AnimationData.frame(0x04, 0x3a, 0x02),
	AnimationData.frame(0x7f, 0x00, 0x80),
];
immutable AnimationData[] interactionAnimation5A200 = [
	AnimationData.frame(0x04, 0x34, 0x06),
	AnimationData.frame(0x04, 0x32, 0x06),
	AnimationData.frame(0x04, 0x30, 0x06),
	AnimationData.frame(0x7f, 0x00, 0x80),
];
immutable AnimationData[] interactionAnimation5A20C = [
	AnimationData.frame(0x04, 0x3c, 0x02),
	AnimationData.frame(0x04, 0x3e, 0x02),
	AnimationData.frame(0x04, 0x40, 0x02),
	AnimationData.frame(0x7f, 0x06, 0x83),
];
immutable AnimationData[] interactionAnimation5A218 = [
	AnimationData.frame(0x04, 0x44, 0x06),
	AnimationData.frame(0x04, 0x32, 0x06),
	AnimationData.frame(0x04, 0x42, 0x06),
	AnimationData.frame(0x7f, 0x06, 0x83),
];
immutable AnimationData[] interactionAnimation5A224 = [
	AnimationData.frame(0x04, 0x42, 0x02),
	AnimationData.frame(0x04, 0x32, 0x02),
	AnimationData.frame(0x04, 0x44, 0x02),
	AnimationData.frame(0x7f, 0x04, 0x82),
];
immutable AnimationData[] interactionAnimation5A230 = [
	AnimationData.frame(0x04, 0x40, 0x06),
	AnimationData.frame(0x04, 0x3e, 0x06),
	AnimationData.frame(0x04, 0x3c, 0x06),
	AnimationData.frame(0x7f, 0x04, 0x82),
];
immutable AnimationData[] interactionAnimation5A23C = [
	AnimationData.frame(0x04, 0x46, 0x02),
	AnimationData.frame(0x04, 0x38, 0x02),
	AnimationData.frame(0x04, 0x48, 0x02),
	AnimationData.frame(0x7f, 0x0a, 0x85),
];
immutable AnimationData[] interactionAnimation5A248 = [
	AnimationData.frame(0x04, 0x4c, 0x06),
	AnimationData.frame(0x04, 0x3e, 0x06),
	AnimationData.frame(0x04, 0x4a, 0x06),
	AnimationData.frame(0x7f, 0x0a, 0x85),
];
immutable AnimationData[] interactionAnimation5A254 = [
	AnimationData.frame(0x04, 0x4a, 0x02),
	AnimationData.frame(0x04, 0x3e, 0x02),
	AnimationData.frame(0x04, 0x4c, 0x02),
	AnimationData.frame(0x7f, 0x08, 0x84),
];
immutable AnimationData[] interactionAnimation5A260 = [
	AnimationData.frame(0x04, 0x48, 0x06),
	AnimationData.frame(0x04, 0x38, 0x06),
	AnimationData.frame(0x04, 0x46, 0x06),
	AnimationData.frame(0x7f, 0x08, 0x84),
];
immutable AnimationData[] interactionAnimation5A26C = [
	AnimationData.frame(0x08, 0x00, 0x00),
	AnimationData.frame(0x08, 0x02, 0x00),
	AnimationData.frame(0x08, 0x04, 0x00),
	AnimationData.frame(0x08, 0x06, 0x00),
	AnimationData.loop(-4),
];

immutable AnimationData[] interactionAnimation5A27A = [
	AnimationData.frame(0x08, 0x00, 0x00),
	AnimationData.frame(0x08, 0x02, 0x00),
	AnimationData.frame(0x08, 0x04, 0xff),
];
immutable AnimationData[] interactionAnimation5A283 = [
	AnimationData.frame(0x08, 0x04, 0x00),
	AnimationData.frame(0x08, 0x02, 0x00),
	AnimationData.frame(0x08, 0x00, 0xff),
];
immutable AnimationData[] interactionAnimation5A28C = [
	AnimationData.frame(0x08, 0x06, 0x00),
	AnimationData.frame(0x08, 0x08, 0x00),
	AnimationData.frame(0x08, 0x0a, 0xff),
];
immutable AnimationData[] interactionAnimation5A295 = [
	AnimationData.frame(0x08, 0x0a, 0x00),
	AnimationData.frame(0x08, 0x08, 0x00),
	AnimationData.frame(0x08, 0x06, 0xff),
];
immutable AnimationData[] interactionAnimation5A29E = [
	AnimationData.frame(0x02, 0x00, 0x00),
	AnimationData.frame(0x10, 0x04, 0x01),
	// Loop:
	AnimationData.frame(0x7f, 0x04, 0xff),
	AnimationData.loop(-1),
];

immutable AnimationData[] interactionAnimation5A2A9 = [
	AnimationData.frame(0x0f, 0x00, 0x00),
	AnimationData.frame(0x0f, 0x02, 0x00),
	AnimationData.frame(0x0f, 0x04, 0x00),
	AnimationData.frame(0x0f, 0x02, 0x00),
	AnimationData.loop(-4),
];

immutable AnimationData[] interactionAnimation5A2B7 = [
	AnimationData.frame(0x0f, 0x00, 0x00),
	AnimationData.frame(0x04, 0x06, 0x01),
	AnimationData.frame(0x04, 0x04, 0x02),
	AnimationData.frame(0x04, 0x02, 0x03),
	AnimationData.frame(0x04, 0x00, 0x04),
	AnimationData.frame(0x7f, 0x00, 0xff),
];
immutable AnimationData[] interactionAnimation5A2C9 = [
	AnimationData.frame(0x0f, 0x00, 0x00),
	AnimationData.frame(0x04, 0x02, 0x0f),
	AnimationData.frame(0x04, 0x04, 0x0e),
	AnimationData.frame(0x04, 0x06, 0x0d),
	AnimationData.frame(0x04, 0x00, 0x0c),
	AnimationData.frame(0x7f, 0x00, 0xff),
];
immutable AnimationData[] interactionAnimation5A2DB = [
	AnimationData.frame(0x0c, 0x08, 0x00),
	AnimationData.frame(0x0c, 0x0a, 0x00),
	AnimationData.frame(0x0c, 0x0c, 0x00),
	AnimationData.frame(0x0c, 0x0e, 0x00),
	AnimationData.loop(-4),
];

immutable AnimationData[] interactionAnimation5A2E9 = [
	AnimationData.frame(0x0c, 0x10, 0x00),
	AnimationData.frame(0x0c, 0x12, 0x00),
	AnimationData.frame(0x0c, 0x14, 0x00),
	AnimationData.frame(0x0c, 0x16, 0x00),
	AnimationData.loop(-4),
];

immutable AnimationData[] interactionAnimation5A2F7 = [
	AnimationData.frame(0x0a, 0x00, 0x00),
	AnimationData.frame(0x0c, 0x02, 0x00),
	AnimationData.frame(0x0a, 0x04, 0x00),
	AnimationData.frame(0x7f, 0x00, 0xff),
];
immutable AnimationData[] interactionAnimation5A303 = [
	AnimationData.frame(0x0a, 0x00, 0x00),
	AnimationData.frame(0x0c, 0x04, 0x00),
	AnimationData.frame(0x0a, 0x02, 0x00),
	AnimationData.frame(0x7f, 0x00, 0xff),
];
immutable AnimationData[] interactionAnimation5A30F = [
	AnimationData.frame(0x0a, 0x06, 0x00),
	AnimationData.frame(0x0c, 0x08, 0x00),
	AnimationData.frame(0x0a, 0x0a, 0x00),
	AnimationData.frame(0x7f, 0x06, 0xff),
];
immutable AnimationData[] interactionAnimation5A31B = [
	AnimationData.frame(0x0a, 0x06, 0x00),
	AnimationData.frame(0x0c, 0x0a, 0x00),
	AnimationData.frame(0x0a, 0x08, 0x00),
	AnimationData.frame(0x7f, 0x06, 0xff),
];
immutable AnimationData[] interactionAnimation5A327 = [
	AnimationData.frame(0x0a, 0x0c, 0x00),
	AnimationData.frame(0x0c, 0x0e, 0x00),
	AnimationData.frame(0x0a, 0x10, 0x00),
	AnimationData.frame(0x7f, 0x0c, 0xff),
];
immutable AnimationData[] interactionAnimation5A333 = [
	AnimationData.frame(0x0a, 0x0c, 0x00),
	AnimationData.frame(0x0c, 0x10, 0x00),
	AnimationData.frame(0x0a, 0x0e, 0x00),
	AnimationData.frame(0x7f, 0x0c, 0xff),
];
immutable AnimationData[] interactionAnimation5A33F = [
	AnimationData.frame(0x02, 0x06, 0x00),
	AnimationData.frame(0x02, 0x08, 0x01),
	AnimationData.frame(0x02, 0x06, 0x00),
	AnimationData.frame(0x02, 0x08, 0x01),
	AnimationData.loop(-4),
];

immutable AnimationData[] interactionAnimation5A34D = [
	AnimationData.frame(0x10, 0x00, 0x00),
	AnimationData.frame(0x10, 0x02, 0x00),
	AnimationData.frame(0x10, 0x04, 0x00),
	AnimationData.loop(-4),
];

immutable AnimationData[] interactionAnimation5A358 = [
	AnimationData.frame(0x06, 0x00, 0x00),
	AnimationData.frame(0x06, 0x02, 0x00),
	AnimationData.frame(0x06, 0x04, 0x00),
	AnimationData.frame(0x06, 0x06, 0x00),
	AnimationData.frame(0x06, 0x08, 0x00),
	AnimationData.loop(-5),
];

immutable AnimationData[] interactionAnimation5A369 = [
	AnimationData.frame(0x14, 0x14, 0x00),
	AnimationData.frame(0x08, 0x16, 0x00),
	AnimationData.frame(0x08, 0x18, 0x00),
	AnimationData.frame(0x08, 0x1a, 0x00),
	AnimationData.frame(0x08, 0x1c, 0x00),
	AnimationData.frame(0x08, 0x16, 0x00),
	AnimationData.frame(0x14, 0x18, 0x00),
	AnimationData.frame(0x08, 0x16, 0x00),
	AnimationData.frame(0x08, 0x1c, 0x00),
	AnimationData.frame(0x08, 0x1a, 0x00),
	AnimationData.frame(0x08, 0x18, 0x00),
	AnimationData.frame(0x08, 0x16, 0x00),
	AnimationData.loop(-12),
];

immutable AnimationData[] interactionAnimation5A38F = [
	AnimationData.frame(0x09, 0x00, 0x00),
	AnimationData.frame(0x09, 0x02, 0x00),
	AnimationData.loop(-2),
];

immutable AnimationData[] interactionAnimation5A397 = [
	AnimationData.frame(0x0e, 0x00, 0x00),
	AnimationData.frame(0x7f, 0x00, 0xff),
];
immutable AnimationData[] interactionAnimation5A39D = [
	AnimationData.frame(0x0e, 0x02, 0x00),
	AnimationData.frame(0x7f, 0x02, 0xff),
];
immutable AnimationData[] interactionAnimation5A3A3 = [
	AnimationData.frame(0x0e, 0x04, 0x00),
	AnimationData.frame(0x7f, 0x04, 0xff),
];
immutable AnimationData[] interactionAnimation5A3A9 = [
	AnimationData.frame(0x0e, 0x06, 0x00),
	AnimationData.frame(0x7f, 0x06, 0xff),
];
immutable AnimationData[] interactionAnimation5A3AF = [
	AnimationData.frame(0x7f, 0x00, 0x00),
	AnimationData.loop(-1),
];

immutable AnimationData[] interactionAnimation5A3B4 = [
	AnimationData.frame(0x7f, 0x02, 0x00),
	AnimationData.loop(-1),
];

immutable AnimationData[] interactionAnimation5A3B9 = [
	AnimationData.frame(0x7f, 0x04, 0x00),
	AnimationData.loop(-1),
];

immutable AnimationData[] interactionAnimation5A3BE = [
	AnimationData.frame(0x7f, 0x06, 0x00),
	AnimationData.loop(-1),
];

immutable AnimationData[] interactionAnimation5A3C3 = [
	AnimationData.frame(0x7f, 0x08, 0x00),
	AnimationData.loop(-1),
];

immutable AnimationData[] interactionAnimation5A3C8 = [
	AnimationData.frame(0x7f, 0x08, 0xff),
];
immutable AnimationData[] interactionAnimation5A3CB = [
	AnimationData.frame(0x7f, 0x0a, 0x00),
	AnimationData.loop(-1),
];

immutable AnimationData[] interactionAnimation5A3D0 = [
	AnimationData.frame(0x7f, 0x0c, 0x00),
	AnimationData.loop(-1),
];

immutable AnimationData[] interactionAnimation5A3D5 = [
	AnimationData.frame(0x7f, 0x0e, 0x00),
	AnimationData.loop(-1),
];

immutable AnimationData[] interactionAnimation5A3DA = [
	AnimationData.frame(0x7f, 0x10, 0x00),
	AnimationData.loop(-1),
];

immutable AnimationData[] interactionAnimation5A3DF = [
	AnimationData.frame(0x7f, 0x12, 0x00),
	AnimationData.loop(-1),
];

immutable AnimationData[] interactionAnimation5A3E4 = [
	AnimationData.frame(0x7f, 0x14, 0x00),
	AnimationData.loop(-1),
];

immutable AnimationData[] interactionAnimation5A3E9 = [
	AnimationData.frame(0x7f, 0x16, 0x00),
	AnimationData.loop(-1),
];

immutable AnimationData[] interactionAnimation5A3EE = [
	AnimationData.frame(0x7f, 0x18, 0x00),
	AnimationData.loop(-1),
];

immutable AnimationData[] interactionAnimation5A3F3 = [
	AnimationData.frame(0x7f, 0x1a, 0x00),
	AnimationData.loop(-1),
];

immutable AnimationData[] interactionAnimation5A3F8 = [
	AnimationData.frame(0x7f, 0x1c, 0x00),
	AnimationData.loop(-1),
];

immutable AnimationData[] interactionAnimation5A3FD = [
	AnimationData.frame(0x7f, 0x1e, 0x00),
	AnimationData.loop(-1),
];

immutable AnimationData[] interactionAnimation5A402 = [
	AnimationData.frame(0x7f, 0x20, 0x00),
	AnimationData.loop(-1),
];

immutable AnimationData[] interactionAnimation5A407 = [
	AnimationData.frame(0x7f, 0x22, 0x00),
	AnimationData.loop(-1),
];

immutable AnimationData[] interactionAnimation5A40C = [
	AnimationData.frame(0x7f, 0x24, 0x00),
	AnimationData.loop(-1),
];

immutable AnimationData[] interactionAnimation5A411 = [
	AnimationData.frame(0x7f, 0x26, 0x00),
	AnimationData.loop(-1),
];

immutable AnimationData[] interactionAnimation5A416 = [
	AnimationData.frame(0x7f, 0x28, 0x00),
	AnimationData.loop(-1),
];

immutable AnimationData[] interactionAnimation5A41B = [
	AnimationData.frame(0x18, 0x24, 0x00),
	AnimationData.frame(0x18, 0x26, 0x00),
	AnimationData.loop(-2),
];

immutable AnimationData[] interactionAnimation5A423 = [
	AnimationData.frame(0x18, 0x28, 0x00),
	AnimationData.frame(0x18, 0x2a, 0x00),
	AnimationData.loop(-2),
];

immutable AnimationData[] interactionAnimation5A42B = [
	AnimationData.frame(0x0c, 0x1c, 0x00),
	AnimationData.frame(0x0c, 0x1e, 0x01),
	AnimationData.loop(-2),
];

immutable AnimationData[] interactionAnimation5A433 = [
	AnimationData.frame(0x0c, 0x20, 0x00),
	AnimationData.frame(0x0c, 0x22, 0x01),
	AnimationData.loop(-2),
];

immutable AnimationData[] interactionAnimation5A43B = [
	AnimationData.frame(0x7f, 0x2c, 0x00),
	AnimationData.loop(-1),
];

immutable AnimationData[] interactionAnimation5A440 = [
	AnimationData.frame(0x06, 0x00, 0x00),
	AnimationData.frame(0x06, 0x02, 0x00),
	AnimationData.loop(-2),
];

immutable AnimationData[] interactionAnimation5A448 = [
	AnimationData.frame(0x08, 0x00, 0x00),
	AnimationData.frame(0x08, 0x02, 0x00),
	AnimationData.loop(-2),
];

immutable AnimationData[] interactionAnimation5A450 = [
	AnimationData.frame(0x08, 0x00, 0x00),
	AnimationData.frame(0x08, 0x04, 0x00),
	AnimationData.loop(-2),
];

immutable AnimationData[] interactionAnimation5A458 = [
	AnimationData.frame(0x10, 0x00, 0x00),
	AnimationData.frame(0x10, 0x04, 0x00),
	AnimationData.loop(-2),
];

immutable AnimationData[] interactionAnimation5A460 = [
	AnimationData.frame(0x0a, 0x00, 0x00),
	AnimationData.frame(0x0a, 0x02, 0x00),
	AnimationData.loop(-2),
];

immutable AnimationData[] interactionAnimation5A468 = [
	AnimationData.frame(0x10, 0x00, 0x00),
	AnimationData.frame(0x10, 0x02, 0x00),
	AnimationData.loop(-2),
];

immutable AnimationData[] interactionAnimation5A470 = [
	AnimationData.frame(0x18, 0x00, 0x00),
	AnimationData.frame(0x18, 0x02, 0x00),
	AnimationData.loop(-2),
];

immutable AnimationData[] interactionAnimation5A478 = [
	AnimationData.frame(0x20, 0x00, 0x00),
	AnimationData.frame(0x20, 0x02, 0x00),
	AnimationData.loop(-2),
];

immutable AnimationData[] interactionAnimation5A480 = [
	AnimationData.frame(0x20, 0x08, 0x00),
	AnimationData.loop(-1),
];

immutable AnimationData[] interactionAnimation5A485 = [
	AnimationData.frame(0x20, 0x0a, 0x00),
	AnimationData.loop(-1),
];

immutable AnimationData[] interactionAnimation5A48A = [
	AnimationData.frame(0x0c, 0x08, 0x00),
	AnimationData.frame(0x0c, 0x0a, 0x00),
	AnimationData.loop(-2),
];

immutable AnimationData[] interactionAnimation5A492 = [
	AnimationData.frame(0x20, 0x08, 0x00),
	AnimationData.frame(0x20, 0x0a, 0x00),
	AnimationData.loop(-2),
];

immutable AnimationData[] interactionAnimation5A49A = [
	AnimationData.frame(0x0c, 0x0c, 0x00),
	AnimationData.frame(0x0c, 0x0e, 0x00),
	AnimationData.loop(-2),
];

immutable AnimationData[] interactionAnimation5A4A2 = [
	AnimationData.frame(0x20, 0x0c, 0x00),
	AnimationData.frame(0x20, 0x0e, 0x00),
	AnimationData.loop(-2),
];

immutable AnimationData[] interactionAnimation5A4AA = [
	AnimationData.frame(0x08, 0x1a, 0x80),
	AnimationData.frame(0x05, 0x18, 0x81),
	AnimationData.frame(0x05, 0x1c, 0x82),
	AnimationData.frame(0x05, 0x18, 0x83),
	// Loop:
	AnimationData.frame(0x7f, 0x00, 0x84),
	AnimationData.loop(-1),
];

immutable AnimationData[] interactionAnimation5A4BB = [
	AnimationData.frame(0x08, 0x26, 0x8f),
	AnimationData.frame(0x05, 0x28, 0x90),
	AnimationData.frame(0x05, 0x2a, 0x91),
	AnimationData.frame(0x05, 0x28, 0x92),
	// Loop:
	AnimationData.frame(0x7f, 0x08, 0x93),
	AnimationData.loop(-1),
];

immutable AnimationData[] interactionAnimation5A4CC = [
	AnimationData.frame(0x08, 0x18, 0x85),
	AnimationData.frame(0x05, 0x16, 0x86),
	AnimationData.frame(0x05, 0x1e, 0x87),
	AnimationData.frame(0x05, 0x18, 0x88),
	// Loop:
	AnimationData.frame(0x7f, 0x04, 0x89),
	AnimationData.loop(-1),
];

immutable AnimationData[] interactionAnimation5A4DD = [
	AnimationData.frame(0x08, 0x12, 0x8a),
	AnimationData.frame(0x05, 0x10, 0x8b),
	AnimationData.frame(0x05, 0x22, 0x8c),
	AnimationData.frame(0x05, 0x10, 0x8d),
	// Loop:
	AnimationData.frame(0x7f, 0x0c, 0x8e),
	AnimationData.loop(-1),
];

immutable AnimationData[] interactionAnimation5A4EE = [
	AnimationData.frame(0x05, 0x08, 0x00),
	AnimationData.frame(0x05, 0x04, 0x00),
	AnimationData.frame(0x05, 0x00, 0x00),
	AnimationData.frame(0x05, 0x0c, 0x00),
	AnimationData.frame(0x05, 0x08, 0x00),
	AnimationData.frame(0x05, 0x04, 0x00),
	AnimationData.frame(0x05, 0x00, 0x00),
	AnimationData.frame(0x05, 0x0c, 0x00),
	AnimationData.frame(0x0a, 0x08, 0x00),
	// Loop:
	AnimationData.frame(0x7f, 0x24, 0x00),
	AnimationData.loop(-1),
];

immutable AnimationData[] interactionAnimation5A50E = [
	AnimationData.frame(0x03, 0x2a, 0x91),
	AnimationData.frame(0x03, 0x2a, 0x90),
	AnimationData.frame(0x03, 0x1e, 0x87),
	AnimationData.frame(0x03, 0x1e, 0x86),
	AnimationData.frame(0x03, 0x1c, 0x82),
	AnimationData.frame(0x03, 0x1c, 0x81),
	AnimationData.frame(0x03, 0x22, 0x8c),
	AnimationData.frame(0x03, 0x22, 0x94),
	AnimationData.loop(-8),
];

immutable AnimationData[] interactionAnimation5A528 = [
	AnimationData.frame(0x04, 0x0c, 0x00),
	// Loop:
	AnimationData.frame(0x7f, 0x0e, 0x00),
	AnimationData.loop(-1),
];

immutable AnimationData[] interactionAnimation5A530 = [
	AnimationData.frame(0x0a, 0x1a, 0x00),
	AnimationData.frame(0x0a, 0x1c, 0x00),
	AnimationData.frame(0x0a, 0x1a, 0x00),
	AnimationData.frame(0x0a, 0x1c, 0x00),
	AnimationData.frame(0x0a, 0x1a, 0x00),
	AnimationData.frame(0x0a, 0x1c, 0x00),
	AnimationData.frame(0x0a, 0x1a, 0x00),
	AnimationData.frame(0x0a, 0x1c, 0x00),
	AnimationData.frame(0x0a, 0x1a, 0x00),
	AnimationData.frame(0x0a, 0x18, 0x00),
	AnimationData.frame(0x0a, 0x1a, 0x00),
	AnimationData.frame(0x0a, 0x18, 0x00),
	AnimationData.loop(-12),
];

immutable AnimationData[] interactionAnimation5A556 = [
	AnimationData.frame(0x50, 0x10, 0x00),
	AnimationData.frame(0x08, 0x12, 0x00),
	AnimationData.frame(0x08, 0x10, 0x00),
	AnimationData.frame(0x08, 0x12, 0x00),
	AnimationData.frame(0x08, 0x10, 0x00),
	AnimationData.frame(0x32, 0x12, 0x00),
	// Loop:
	AnimationData.frame(0x7f, 0x14, 0xff),
	AnimationData.loop(-1),
];

immutable AnimationData[] interactionAnimation5A56D = [
	AnimationData.frame(0x94, 0x0c, 0x00),
	AnimationData.frame(0x0f, 0x16, 0x00),
	AnimationData.frame(0x1e, 0x0c, 0x00),
	AnimationData.frame(0x06, 0x04, 0x00),
	// Loop:
	AnimationData.frame(0x7f, 0x18, 0xff),
	AnimationData.loop(-1),
];

immutable AnimationData[] interactionAnimation5A57E = [
	AnimationData.frame(0x0a, 0x04, 0x00),
	// Loop:
	AnimationData.frame(0x80, 0x00, 0x00),
	AnimationData.loop(-1),
];

immutable AnimationData[] interactionAnimation5A581 = [
	AnimationData.frame(0x80, 0x00, 0x00),
	AnimationData.loop(-1),
];

immutable AnimationData[] interactionAnimation5A586 = [
	AnimationData.frame(0x06, 0x04, 0x00),
	AnimationData.frame(0x06, 0x06, 0x00),
	AnimationData.loop(-2),
];

immutable AnimationData[] interactionAnimation5A58E = [
	AnimationData.frame(0x08, 0x04, 0x00),
	AnimationData.frame(0x08, 0x06, 0x00),
	AnimationData.loop(-2),
];

immutable AnimationData[] interactionAnimation5A596 = [
	AnimationData.frame(0x0a, 0x04, 0x00),
	AnimationData.frame(0x0a, 0x06, 0x00),
	AnimationData.loop(-2),
];

immutable AnimationData[] interactionAnimation5A59E = [
	AnimationData.frame(0x0a, 0x04, 0x00),
	// Loop:
	AnimationData.frame(0x80, 0x06, 0x00),
	AnimationData.loop(-1),
];

immutable AnimationData[] interactionAnimation5A5A6 = [
	AnimationData.frame(0x10, 0x04, 0x00),
	AnimationData.frame(0x10, 0x06, 0x00),
	AnimationData.loop(-2),
];

immutable AnimationData[] interactionAnimation5A5AE = [
	AnimationData.frame(0x18, 0x04, 0x00),
	AnimationData.frame(0x18, 0x06, 0x00),
	AnimationData.loop(-2),
];

immutable AnimationData[] interactionAnimation5A5B6 = [
	AnimationData.frame(0x20, 0x04, 0x00),
	AnimationData.frame(0x20, 0x06, 0x00),
	AnimationData.loop(-2),
];

immutable AnimationData[] interactionAnimation5A5BE = [
	AnimationData.frame(0x20, 0x04, 0x05),
	AnimationData.frame(0x20, 0x06, 0x06),
	AnimationData.loop(-2),
];

immutable AnimationData[] interactionAnimation5A5C6 = [
	AnimationData.frame(0x12, 0x00, 0x00),
	AnimationData.frame(0x12, 0x02, 0x00),
	AnimationData.frame(0x12, 0x04, 0x00),
	AnimationData.frame(0x12, 0x06, 0x00),
	AnimationData.loop(-4),
];

immutable AnimationData[] interactionAnimation5A5D4 = [
	AnimationData.frame(0x08, 0x06, 0x00),
	AnimationData.frame(0x08, 0x08, 0x00),
	AnimationData.loop(-2),
];

immutable AnimationData[] interactionAnimation5A5DC = [
	AnimationData.frame(0x08, 0x06, 0x00),
	AnimationData.frame(0x08, 0x0a, 0x00),
	AnimationData.loop(-2),
];

immutable AnimationData[] interactionAnimation5A5E4 = [
	AnimationData.frame(0x20, 0x06, 0x06),
	AnimationData.frame(0x20, 0x04, 0x05),
	AnimationData.loop(-2),
];

immutable AnimationData[] interactionAnimation5A5EC = [
	AnimationData.frame(0x04, 0x06, 0x00),
	AnimationData.frame(0x0e, 0x0a, 0x00),
	AnimationData.loop(-2),
];

immutable AnimationData[] interactionAnimation5A5F4 = [
	AnimationData.frame(0x04, 0x08, 0x00),
	AnimationData.frame(0x04, 0x0a, 0x00),
	AnimationData.loop(-2),
];

immutable AnimationData[] interactionAnimation5A5FC = [
	AnimationData.frame(0x08, 0x08, 0x00),
	AnimationData.frame(0x08, 0x0a, 0x00),
	AnimationData.loop(-2),
];

immutable AnimationData[] interactionAnimation5A604 = [
	AnimationData.frame(0x0a, 0x08, 0x00),
	AnimationData.frame(0x0a, 0x0a, 0x00),
	AnimationData.loop(-2),
];

immutable AnimationData[] interactionAnimation5A60C = [
	AnimationData.frame(0x10, 0x08, 0x00),
	AnimationData.frame(0x10, 0x0a, 0x00),
	AnimationData.loop(-2),
];

immutable AnimationData[] interactionAnimation5A614 = [
	AnimationData.frame(0x18, 0x08, 0x00),
	AnimationData.frame(0x18, 0x0a, 0x00),
	AnimationData.loop(-2),
];

immutable AnimationData[] interactionAnimation5A61C = [
	AnimationData.frame(0x14, 0x10, 0x00),
	AnimationData.frame(0x14, 0x12, 0x00),
	AnimationData.frame(0x14, 0x10, 0x00),
	AnimationData.frame(0x64, 0x12, 0x00),
	AnimationData.loop(-4),
];

immutable AnimationData[] interactionAnimation5A62A = [
	AnimationData.frame(0x14, 0x14, 0x00),
	AnimationData.frame(0x14, 0x16, 0x00),
	AnimationData.frame(0x14, 0x14, 0x00),
	AnimationData.frame(0x64, 0x16, 0x00),
	AnimationData.loop(-4),
];

immutable AnimationData[] interactionAnimation5A638 = [
	AnimationData.frame(0x04, 0x0c, 0x00),
	AnimationData.frame(0x04, 0x0e, 0x00),
	AnimationData.loop(-2),
];

immutable AnimationData[] interactionAnimation5A640 = [
	AnimationData.frame(0x0a, 0x0c, 0x00),
	AnimationData.frame(0x0a, 0x0e, 0x00),
	AnimationData.loop(-2),
];

immutable AnimationData[] interactionAnimation5A648 = [
	AnimationData.frame(0x05, 0x0c, 0x00),
	AnimationData.frame(0x05, 0x0e, 0x00),
	// Loop:
	AnimationData.frame(0x7f, 0x12, 0x01),
	AnimationData.loop(-1),
];

immutable AnimationData[] interactionAnimation5A64E = [
	AnimationData.frame(0x7f, 0x12, 0x01),
	AnimationData.loop(-1),
];

immutable AnimationData[] interactionAnimation5A653 = [
	AnimationData.frame(0x10, 0x0c, 0x00),
	AnimationData.frame(0x10, 0x0e, 0x00),
	AnimationData.loop(-2),
];

immutable AnimationData[] interactionAnimation5A65B = [
	AnimationData.frame(0x10, 0x0c, 0x00),
	AnimationData.frame(0x10, 0x0e, 0x01),
	AnimationData.loop(-2),
];

immutable AnimationData[] interactionAnimation5A663 = [
	AnimationData.frame(0x10, 0x04, 0x07),
	AnimationData.frame(0x10, 0x06, 0x08),
	AnimationData.loop(-2),
];

immutable AnimationData[] interactionAnimation5A66B = [
	AnimationData.frame(0x3c, 0x10, 0x00),
	AnimationData.frame(0x04, 0x12, 0x00),
	AnimationData.frame(0x04, 0x10, 0x00),
	AnimationData.frame(0x04, 0x12, 0x00),
	AnimationData.loop(-4),
];

immutable AnimationData[] interactionAnimation5A679 = [
	AnimationData.frame(0x8c, 0x08, 0x00),
	AnimationData.frame(0x0a, 0x14, 0x00),
	// Loop:
	AnimationData.frame(0x7f, 0x16, 0x01),
	AnimationData.loop(-1),
];

immutable AnimationData[] interactionAnimation5A67F = [
	AnimationData.frame(0x7f, 0x16, 0x01),
	AnimationData.loop(-1),
];

immutable AnimationData[] interactionAnimation5A684 = [
	AnimationData.frame(0x04, 0x08, 0x00),
	AnimationData.frame(0x04, 0x0c, 0x00),
	AnimationData.frame(0x04, 0x00, 0x00),
	AnimationData.frame(0x04, 0x04, 0x00),
	AnimationData.loop(-4),
];

immutable AnimationData[] interactionAnimation5A692 = [
	AnimationData.frame(0x08, 0x08, 0x00),
	AnimationData.frame(0x50, 0x0e, 0x00),
	AnimationData.frame(0x0a, 0x18, 0x00),
	// Loop:
	AnimationData.frame(0x7f, 0x10, 0x01),
	AnimationData.loop(-1),
];

immutable AnimationData[] interactionAnimation5A6A0 = [
	AnimationData.frame(0x10, 0x04, 0x00),
	AnimationData.frame(0x10, 0x06, 0x00),
	AnimationData.frame(0x10, 0x0c, 0x00),
	AnimationData.frame(0x10, 0x0e, 0x00),
	AnimationData.loop(-4),
];

immutable AnimationData[] interactionAnimation5A6AE = [
	AnimationData.frame(0x02, 0x00, 0x00),
	AnimationData.frame(0x02, 0x08, 0x00),
	AnimationData.frame(0x02, 0x02, 0x00),
	AnimationData.frame(0x02, 0x08, 0x00),
	AnimationData.frame(0x02, 0x04, 0x00),
	AnimationData.frame(0x02, 0x08, 0x00),
	AnimationData.frame(0x02, 0x06, 0x00),
	AnimationData.frame(0x02, 0x08, 0x00),
	AnimationData.loop(-8),
];

immutable AnimationData[] interactionAnimation5A6C8 = [
	AnimationData.frame(0x7f, 0x10, 0x00),
	AnimationData.frame(0x03, 0x12, 0x00),
	AnimationData.frame(0x14, 0x14, 0x00),
	AnimationData.frame(0x01, 0x14, 0x01),
	AnimationData.loop(-4),
];

immutable AnimationData[] interactionAnimation5A6D6 = [
	AnimationData.frame(0x06, 0x04, 0x00),
	AnimationData.frame(0x06, 0x06, 0x00),
	AnimationData.frame(0x06, 0x08, 0x00),
	AnimationData.loop(-3),
];

immutable AnimationData[] interactionAnimation5A6E1 = [
	AnimationData.frame(0x04, 0x00, 0x00),
	AnimationData.frame(0x04, 0x02, 0x00),
	AnimationData.loop(-2),
];

immutable AnimationData[] interactionAnimation5A6E9 = [
	AnimationData.frame(0x04, 0x14, 0x00),
	AnimationData.frame(0x04, 0x02, 0x00),
	AnimationData.loop(-2),
];

immutable AnimationData[] interactionAnimation5A6F1 = [
	AnimationData.frame(0x09, 0x04, 0x00),
	AnimationData.frame(0x09, 0x06, 0x00),
	AnimationData.frame(0x09, 0x08, 0x00),
	AnimationData.frame(0x08, 0x0a, 0x00),
	// Loop:
	AnimationData.frame(0x01, 0x0a, 0xff),
	AnimationData.loop(-1),
];

immutable AnimationData[] interactionAnimation5A702 = [
	AnimationData.frame(0x03, 0x0c, 0x00),
	AnimationData.frame(0x03, 0x0e, 0x00),
	AnimationData.frame(0x03, 0x10, 0x00),
	AnimationData.frame(0x02, 0x12, 0x00),
	// Loop:
	AnimationData.frame(0x01, 0x12, 0xff),
	AnimationData.loop(-1),
];

immutable AnimationData[] interactionAnimation5A713 = [
	AnimationData.frame(0x0c, 0x10, 0x00),
	AnimationData.frame(0x0c, 0x12, 0x01),
	AnimationData.loop(-2),
];

immutable AnimationData[] interactionAnimation5A71B = [
	AnimationData.frame(0x10, 0x10, 0x00),
	AnimationData.frame(0x10, 0x12, 0x00),
	AnimationData.loop(-2),
];

immutable AnimationData[] interactionAnimation5A723 = [
	AnimationData.frame(0x18, 0x10, 0x00),
	AnimationData.frame(0x18, 0x12, 0x00),
	AnimationData.loop(-2),
];

immutable AnimationData[] interactionAnimation5A72B = [
	AnimationData.frame(0x10, 0x10, 0x00),
	AnimationData.frame(0x10, 0x12, 0x01),
	AnimationData.loop(-2),
];

immutable AnimationData[] interactionAnimation5A733 = [
	AnimationData.frame(0x0c, 0x14, 0x00),
	AnimationData.frame(0x0c, 0x16, 0x00),
	AnimationData.loop(-2),
];

immutable AnimationData[] interactionAnimation5A73B = [
	AnimationData.frame(0x10, 0x14, 0x00),
	AnimationData.frame(0x10, 0x16, 0x00),
	AnimationData.loop(-2),
];

immutable AnimationData[] interactionAnimation5A743 = [
	AnimationData.frame(0x18, 0x14, 0x00),
	AnimationData.frame(0x18, 0x16, 0x00),
	AnimationData.loop(-2),
];

immutable AnimationData[] interactionAnimation5A74B = [
	AnimationData.frame(0x04, 0x18, 0x00),
	AnimationData.frame(0x04, 0x1a, 0x00),
	AnimationData.loop(-2),
];

immutable AnimationData[] interactionAnimation5A753 = [
	AnimationData.frame(0x0c, 0x18, 0x00),
	AnimationData.frame(0x0c, 0x1a, 0x00),
	AnimationData.loop(-2),
];

immutable AnimationData[] interactionAnimation5A75B = [
	AnimationData.frame(0x10, 0x18, 0x00),
	AnimationData.frame(0x10, 0x1a, 0x00),
	AnimationData.loop(-2),
];

immutable AnimationData[] interactionAnimation5A763 = [
	AnimationData.frame(0x18, 0x18, 0x00),
	AnimationData.frame(0x18, 0x1a, 0x00),
	AnimationData.loop(-2),
];

immutable AnimationData[] interactionAnimation5A76B = [
	AnimationData.frame(0x04, 0x1c, 0x00),
	AnimationData.frame(0x04, 0x1e, 0x00),
	AnimationData.loop(-2),
];

immutable AnimationData[] interactionAnimation5A773 = [
	AnimationData.frame(0x10, 0x1c, 0x00),
	AnimationData.frame(0x10, 0x1e, 0x00),
	AnimationData.loop(-2),
];

immutable AnimationData[] interactionAnimation5A77B = [
	AnimationData.frame(0x10, 0x20, 0x00),
	AnimationData.frame(0x10, 0x22, 0x00),
	AnimationData.loop(-2),
];

immutable AnimationData[] interactionAnimation5A783 = [
	AnimationData.frame(0x10, 0x24, 0x00),
	AnimationData.frame(0x10, 0x26, 0x00),
	AnimationData.loop(-2),
];

immutable AnimationData[] interactionAnimation5A78B = [
	AnimationData.frame(0x10, 0x28, 0x00),
	AnimationData.frame(0x10, 0x2a, 0x00),
	AnimationData.loop(-2),
];

immutable AnimationData[] interactionAnimation5A793 = [
	AnimationData.frame(0x7f, 0x14, 0x00),
	// Loop:
	AnimationData.frame(0x7f, 0x16, 0x00),
	AnimationData.loop(-1),
];

immutable AnimationData[] interactionAnimation5A796 = [
	AnimationData.frame(0x7f, 0x16, 0x00),
	AnimationData.loop(-1),
];

immutable AnimationData[] interactionAnimation5A79B = [
	AnimationData.frame(0x04, 0x0c, 0x00),
	AnimationData.frame(0x04, 0x10, 0x01),
	// Loop:
	AnimationData.frame(0x10, 0x18, 0x03),
	AnimationData.frame(0x10, 0x1a, 0x04),
	AnimationData.loop(-2),
];

immutable AnimationData[] interactionAnimation5A7A1 = [
	AnimationData.frame(0x10, 0x18, 0x03),
	AnimationData.frame(0x10, 0x1a, 0x04),
	AnimationData.loop(-2),
];

immutable AnimationData[] interactionAnimation5A7A9 = [
	AnimationData.frame(0x04, 0x04, 0x02),
	AnimationData.frame(0x04, 0x14, 0x01),
	// Loop:
	AnimationData.frame(0x10, 0x18, 0x03),
	AnimationData.frame(0x10, 0x1a, 0x04),
	AnimationData.loop(-2),
];

immutable AnimationData[] interactionAnimation5A7B7 = [
	AnimationData.frame(0x3c, 0x06, 0x00),
	AnimationData.frame(0x01, 0x08, 0x01),
	// Loop:
	AnimationData.frame(0x7f, 0x08, 0x80),
	AnimationData.loop(-1),
];

immutable AnimationData[] interactionAnimation5A7C2 = [
	AnimationData.frame(0x1e, 0x00, 0x00),
	AnimationData.frame(0x1e, 0x02, 0x00),
	AnimationData.frame(0x1e, 0x00, 0x00),
	AnimationData.frame(0x3c, 0x02, 0x00),
	AnimationData.loop(-4),
];

immutable AnimationData[] interactionAnimation5A7D0 = [
	AnimationData.frame(0x18, 0x08, 0x00),
	AnimationData.frame(0x04, 0x10, 0x00),
	AnimationData.frame(0x22, 0x12, 0x00),
	// Loop:
	AnimationData.frame(0x01, 0x12, 0xff),
	AnimationData.loop(-1),
];

immutable AnimationData[] interactionAnimation5A7DE = [
	AnimationData.frame(0x7f, 0x18, 0x00),
	// Loop:
	AnimationData.frame(0x1e, 0x0c, 0x00),
	AnimationData.frame(0x10, 0x0e, 0x00),
	AnimationData.frame(0x10, 0x0c, 0x00),
	AnimationData.frame(0x32, 0x0e, 0x00),
	AnimationData.loop(-4),
];

immutable AnimationData[] interactionAnimation5A7EF = [ // Unused
	AnimationData.frame(0x32, 0x10, 0x00),
	AnimationData.frame(0x0a, 0x12, 0x00),
	AnimationData.frame(0x0a, 0x10, 0x00),
	AnimationData.frame(0x0a, 0x12, 0x00),
	AnimationData.frame(0x0a, 0x10, 0x00),
	AnimationData.frame(0x1e, 0x12, 0x00),
	AnimationData.loop(-6),
];

immutable AnimationData[] interactionAnimation5A803 = [
	AnimationData.frame(0x10, 0x18, 0x00),
	AnimationData.frame(0x10, 0x1a, 0x00),
	AnimationData.loop(-2),
];

immutable AnimationData[] interactionAnimation5A80B = [
	AnimationData.frame(0x10, 0x1c, 0x00),
	AnimationData.frame(0x10, 0x1e, 0x00),
	AnimationData.loop(-2),
];

immutable AnimationData[] interactionAnimation5A813 = [
	AnimationData.frame(0x1e, 0x10, 0x01),
	AnimationData.frame(0x0f, 0x12, 0x00),
	AnimationData.frame(0x1e, 0x14, 0x02),
	AnimationData.frame(0x0f, 0x12, 0x00),
	AnimationData.loop(-4),
];

immutable AnimationData[] interactionAnimation5A821 = [
	AnimationData.frame(0x7f, 0x04, 0x00),
	AnimationData.loop(-1),
];

immutable AnimationData[] interactionAnimation5A826 = [
	AnimationData.frame(0x04, 0x04, 0x00),
	AnimationData.frame(0x0e, 0x08, 0x00),
	AnimationData.loop(-2),
];

immutable AnimationData[] interactionAnimation5A82E = [
	AnimationData.frame(0x08, 0x0c, 0x00),
	// Loop:
	AnimationData.frame(0x7f, 0x10, 0x00),
	AnimationData.loop(-1),
];

immutable AnimationData[] interactionAnimation5A836 = [
	AnimationData.frame(0x06, 0x04, 0x00),
	// Loop:
	AnimationData.frame(0x7f, 0x06, 0x01),
	AnimationData.loop(-1),
];

immutable AnimationData[] interactionAnimation5A83E = [
	AnimationData.frame(0x20, 0x00, 0x00),
	AnimationData.frame(0x20, 0x02, 0x00),
	AnimationData.loop(-2),
];

immutable AnimationData[] interactionAnimation5A846 = [
	AnimationData.frame(0x18, 0x28, 0x00),
	// Loop:
	AnimationData.frame(0x18, 0x2a, 0x00),
	AnimationData.loop(-1),
];

immutable AnimationData[] interactionAnimation5A849 = [
	AnimationData.frame(0x18, 0x2a, 0x00),
	AnimationData.loop(-1),
];

immutable AnimationData[] interactionAnimation5A84E = [
	AnimationData.frame(0x7f, 0x2c, 0x00),
	AnimationData.loop(-1),
];

immutable AnimationData[] interactionAnimation5A853 = [
	AnimationData.frame(0x7f, 0x2e, 0x00),
	AnimationData.frame(0x7f, 0x30, 0x00),
	AnimationData.frame(0x7f, 0x32, 0x00),
// Loop:
	AnimationData.frame(0x18, 0x0c, 0x00),
	AnimationData.frame(0x18, 0x0e, 0x00),
	AnimationData.loop(-2),
];

immutable AnimationData[] interactionAnimation5A856 = [
	AnimationData.frame(0x7f, 0x30, 0x00),
	AnimationData.frame(0x7f, 0x32, 0x00),
// Loop:
	AnimationData.frame(0x18, 0x0c, 0x00),
	AnimationData.frame(0x18, 0x0e, 0x00),
	AnimationData.loop(-2),
];

immutable AnimationData[] interactionAnimation5A859 = [
	AnimationData.frame(0x7f, 0x32, 0x00),
// Loop:
	AnimationData.frame(0x18, 0x0c, 0x00),
	AnimationData.frame(0x18, 0x0e, 0x00),
	AnimationData.loop(-2),
];

immutable AnimationData[] interactionAnimation5A85C = [
	AnimationData.frame(0x18, 0x0c, 0x00),
	AnimationData.frame(0x18, 0x0e, 0x00),
	AnimationData.loop(-2),
];

immutable AnimationData[] interactionAnimation5A864 = [
	AnimationData.frame(0x10, 0x12, 0x00),
	AnimationData.frame(0x0e, 0x06, 0x00),
	AnimationData.frame(0x7f, 0x06, 0xff),
	// Loop:
	AnimationData.frame(0x20, 0x06, 0x00),
	AnimationData.frame(0x20, 0x08, 0x00),
	AnimationData.loop(-2),
];

immutable AnimationData[] interactionAnimation5A86D = [
	AnimationData.frame(0x20, 0x06, 0x00),
	AnimationData.frame(0x20, 0x08, 0x00),
	AnimationData.loop(-2),
];

immutable AnimationData[] interactionAnimation5A875 = [
	AnimationData.frame(0x08, 0x04, 0x00),
	AnimationData.frame(0x08, 0x06, 0x00),
	AnimationData.loop(-2),
];

immutable AnimationData[] interactionAnimation5A87D = [
	AnimationData.frame(0x06, 0x00, 0x00),
	AnimationData.frame(0x06, 0x02, 0x00),
	AnimationData.frame(0x06, 0x04, 0x00),
	AnimationData.frame(0x06, 0x06, 0x00),
	AnimationData.loop(-4),
];

immutable AnimationData[] interactionAnimation5A88B = [
	AnimationData.frame(0x0a, 0x08, 0x00),
	AnimationData.frame(0x0a, 0x0a, 0x00),
	AnimationData.frame(0x0a, 0x0c, 0x00),
	AnimationData.frame(0x0a, 0x0e, 0x00),
	AnimationData.loop(-4),
];

immutable AnimationData[] interactionAnimation5A899 = [
	AnimationData.frame(0x09, 0x10, 0x00),
	AnimationData.frame(0x09, 0x12, 0x00),
	AnimationData.frame(0x09, 0x14, 0x00),
	AnimationData.frame(0x08, 0x16, 0x00),
	AnimationData.frame(0x01, 0x16, 0xff),
	AnimationData.loop(-5),
];

immutable AnimationData[] interactionAnimation5A8AA = [
	AnimationData.frame(0x09, 0x18, 0x00),
	AnimationData.frame(0x08, 0x1a, 0x00),
	AnimationData.frame(0x08, 0x1c, 0x00),
	AnimationData.frame(0x07, 0x1e, 0x00),
	AnimationData.frame(0x01, 0x1e, 0xff),
	AnimationData.loop(-5),
];

immutable AnimationData[] interactionAnimation5A8BB = [
	AnimationData.frame(0x03, 0x20, 0x00),
	AnimationData.frame(0x03, 0x22, 0x00),
	AnimationData.frame(0x03, 0x20, 0x00),
	AnimationData.frame(0x03, 0x22, 0x00),
	AnimationData.loop(-4),
];

immutable AnimationData[] interactionAnimation5A8C9 = [
	AnimationData.frame(0x7f, 0x1c, 0x00),
	AnimationData.loop(-1),
];

immutable AnimationData[] interactionAnimation5A8CE = [
	AnimationData.frame(0x08, 0x00, 0x00),
	AnimationData.frame(0x0c, 0x02, 0x00),
	AnimationData.frame(0x0c, 0x04, 0x00),
	AnimationData.frame(0x7f, 0x04, 0xff),
];
immutable AnimationData[] interactionAnimation5A8DA = [
	AnimationData.frame(0x3c, 0x08, 0x00),
	AnimationData.frame(0x04, 0x18, 0x00),
	AnimationData.frame(0x04, 0x08, 0x00),
	AnimationData.frame(0x04, 0x18, 0x00),
	AnimationData.loop(-4),
];

immutable AnimationData[] interactionAnimation5A8E8 = [
	AnimationData.frame(0x0c, 0x1a, 0x00),
	AnimationData.frame(0x0c, 0x1c, 0x01),
	AnimationData.frame(0x0c, 0x1a, 0x00),
	AnimationData.frame(0x1e, 0x1c, 0x00),
	AnimationData.frame(0x0c, 0x1e, 0x00),
	AnimationData.frame(0x0c, 0x20, 0x02),
	AnimationData.frame(0x0c, 0x1e, 0x00),
	AnimationData.frame(0x1e, 0x20, 0x00),
	AnimationData.loop(-8),
];

immutable AnimationData[] interactionAnimation5A902 = [
	AnimationData.frame(0x04, 0x00, 0x00),
	AnimationData.frame(0x04, 0x02, 0x00),
	AnimationData.frame(0x03, 0x00, 0x00),
	AnimationData.frame(0x07, 0x04, 0x00),
	AnimationData.frame(0x08, 0x06, 0x01),
	AnimationData.frame(0x08, 0x08, 0x00),
	AnimationData.frame(0x7f, 0x08, 0xff),
];
immutable AnimationData[] interactionAnimation5A917 = [
	AnimationData.frame(0x1a, 0x00, 0x00),
	AnimationData.frame(0x01, 0x02, 0x01),
	AnimationData.frame(0x19, 0x02, 0x00),
	AnimationData.loop(-3),
];

immutable AnimationData[] interactionAnimation5A922 = [
	AnimationData.frame(0x1a, 0x04, 0x00),
	AnimationData.frame(0x01, 0x06, 0x02),
	AnimationData.frame(0x19, 0x06, 0x00),
	AnimationData.loop(-3),
];

immutable AnimationData[] interactionAnimation5A92D = [
	AnimationData.frame(0x1a, 0x00, 0x00),
	AnimationData.frame(0x01, 0x02, 0x01),
	AnimationData.frame(0x19, 0x02, 0x00),
	AnimationData.frame(0x1a, 0x00, 0x00),
	AnimationData.frame(0x01, 0x02, 0x01),
	AnimationData.frame(0x19, 0x02, 0x00),
	AnimationData.frame(0x1a, 0x04, 0x00),
	AnimationData.frame(0x01, 0x06, 0x02),
	AnimationData.frame(0x19, 0x06, 0x00),
	AnimationData.frame(0x1a, 0x04, 0x00),
	AnimationData.frame(0x01, 0x06, 0x02),
	AnimationData.frame(0x19, 0x06, 0x00),
	AnimationData.loop(-12),
];

immutable AnimationData[] interactionAnimation5A953 = [
	AnimationData.frame(0x05, 0x00, 0x00),
	AnimationData.frame(0x05, 0x02, 0x00),
	AnimationData.frame(0x05, 0x04, 0x00),
	AnimationData.frame(0x7f, 0x04, 0xff),
];
immutable AnimationData[] interactionAnimation5A95F = [
	AnimationData.frame(0x0a, 0x06, 0x00),
	AnimationData.frame(0x0a, 0x04, 0x00),
	AnimationData.loop(-2),
];

immutable AnimationData[] interactionAnimation5A967 = [
	AnimationData.frame(0x05, 0x04, 0x00),
	AnimationData.frame(0x05, 0x02, 0x00),
	AnimationData.frame(0x05, 0x00, 0x00),
	AnimationData.frame(0x7f, 0x00, 0xff),
];
immutable AnimationData[] interactionAnimation5A973 = [
	AnimationData.frame(0x04, 0x18, 0x00),
	AnimationData.frame(0x18, 0x1a, 0x00),
	AnimationData.frame(0x03, 0x1c, 0x00),
	AnimationData.frame(0x01, 0x1c, 0x01),
	AnimationData.frame(0x04, 0x1e, 0x00),
	AnimationData.frame(0x04, 0x1c, 0x00),
	AnimationData.frame(0x04, 0x1e, 0x00),
	AnimationData.frame(0x04, 0x1c, 0x00),
	AnimationData.frame(0x04, 0x18, 0x00),
	AnimationData.frame(0x18, 0x20, 0x00),
	AnimationData.frame(0x03, 0x22, 0x00),
	AnimationData.frame(0x01, 0x22, 0x02),
	AnimationData.frame(0x04, 0x24, 0x00),
	AnimationData.frame(0x04, 0x22, 0x00),
	AnimationData.frame(0x04, 0x24, 0x00),
	AnimationData.frame(0x04, 0x22, 0x00),
	AnimationData.loop(-16),
];

immutable AnimationData[] interactionAnimation5A9A5 = [
	AnimationData.frame(0x14, 0x04, 0x00),
	AnimationData.frame(0x14, 0x02, 0x00),
	AnimationData.loop(-2),
];

immutable AnimationData[] interactionAnimation5A9AD = [
	AnimationData.frame(0x7f, 0x20, 0x00),
	// Loop:
	AnimationData.frame(0x04, 0x22, 0x00),
	AnimationData.frame(0x04, 0x24, 0x00),
	AnimationData.frame(0x04, 0x26, 0x00),
	AnimationData.frame(0x04, 0x28, 0x00),
	AnimationData.loop(-4),
];

immutable AnimationData[] interactionAnimation5A9B0 = [
	AnimationData.frame(0x04, 0x22, 0x00),
	AnimationData.frame(0x04, 0x24, 0x00),
	AnimationData.frame(0x04, 0x26, 0x00),
	AnimationData.frame(0x04, 0x28, 0x00),
	AnimationData.loop(-4),
];

immutable AnimationData[] interactionAnimation5A9BE = [
	AnimationData.frame(0x7f, 0x2a, 0x00),
	AnimationData.loop(-1),
];

immutable AnimationData[] interactionAnimation5A9C3 = [
	AnimationData.frame(0x7f, 0x2c, 0x00),
	AnimationData.loop(-1),
];

immutable AnimationData[] interactionAnimation5A9C8 = [
	AnimationData.frame(0x10, 0x2e, 0x00),
	AnimationData.frame(0x10, 0x30, 0x00),
	AnimationData.loop(-2),
];

immutable AnimationData[] interactionAnimation5A9D0 = [
	AnimationData.frame(0x10, 0x32, 0x00),
	AnimationData.frame(0x10, 0x34, 0x00),
	AnimationData.loop(-2),
];

immutable AnimationData[] interactionAnimation5A9D8 = [
	AnimationData.frame(0x10, 0x36, 0x00),
	AnimationData.frame(0x10, 0x38, 0x00),
	AnimationData.loop(-2),
];

immutable AnimationData[] interactionAnimation5A9E0 = [
	AnimationData.frame(0x10, 0x3a, 0x00),
	AnimationData.frame(0x10, 0x3c, 0x00),
	AnimationData.loop(-2),
];

immutable AnimationData[] interactionAnimation5A9E8 = [
	AnimationData.frame(0x10, 0x3e, 0x00),
	AnimationData.frame(0x10, 0x40, 0x00),
	AnimationData.loop(-2),
];

immutable AnimationData[] interactionAnimation5A9F0 = [
	AnimationData.frame(0x10, 0x42, 0x00),
	AnimationData.frame(0x10, 0x44, 0x00),
	AnimationData.loop(-2),
];

immutable AnimationData[] interactionAnimation5A9F8 = [
	AnimationData.frame(0x10, 0x46, 0x00),
	AnimationData.frame(0x10, 0x48, 0x00),
	AnimationData.loop(-2),
];

immutable AnimationData[] interactionAnimation5AA00 = [
	AnimationData.frame(0x10, 0x4a, 0x00),
	AnimationData.frame(0x10, 0x4c, 0x00),
	AnimationData.loop(-2),
];

immutable AnimationData[] interactionAnimation5AA08 = [
	AnimationData.frame(0x08, 0x10, 0x00),
	AnimationData.frame(0x08, 0x12, 0x00),
	AnimationData.frame(0x08, 0x14, 0x00),
	AnimationData.loop(-3),
];

immutable AnimationData[] interactionAnimation5AA13 = [
	AnimationData.frame(0x07, 0x0c, 0x00),
	AnimationData.frame(0x07, 0x0e, 0x00),
	AnimationData.frame(0x07, 0x10, 0x00),
	AnimationData.frame(0x07, 0x12, 0x00),
	AnimationData.frame(0x07, 0x14, 0x00),
	AnimationData.frame(0x07, 0x16, 0x00),
	AnimationData.loop(-6),
];

immutable AnimationData[] interactionAnimation5AA27 = [
	AnimationData.frame(0x09, 0x18, 0x00),
	AnimationData.frame(0x09, 0x1a, 0x00),
	AnimationData.frame(0x09, 0x1c, 0x00),
	AnimationData.frame(0x09, 0x1e, 0x00),
	AnimationData.frame(0x09, 0x20, 0x00),
	AnimationData.loop(-5),
];

immutable AnimationData[] interactionAnimation5AA38 = [
	AnimationData.frame(0x02, 0x22, 0x00),
	AnimationData.frame(0x02, 0x24, 0x00),
	AnimationData.frame(0x02, 0x26, 0x00),
	AnimationData.frame(0x02, 0x28, 0x00),
	AnimationData.frame(0x02, 0x2a, 0x00),
	AnimationData.frame(0x02, 0x2c, 0x00),
	AnimationData.frame(0x06, 0x2e, 0x00),
	// Loop:
	AnimationData.frame(0x7f, 0x30, 0x00),
	AnimationData.loop(-1),
];

immutable AnimationData[] interactionAnimation5AA52 = [
	AnimationData.frame(0x02, 0x32, 0x00),
	AnimationData.frame(0x02, 0x34, 0x00),
	AnimationData.loop(-2),
];

immutable AnimationData[] interactionAnimation5AA5A = [
	AnimationData.frame(0x0a, 0x08, 0x00),
	// Loop:
	AnimationData.frame(0x07, 0x00, 0x00),
	AnimationData.frame(0x07, 0x02, 0x00),
	AnimationData.frame(0x07, 0x04, 0x00),
	AnimationData.frame(0x06, 0x06, 0x00),
	AnimationData.frame(0x01, 0x06, 0xff),
	AnimationData.loop(-5),
];

immutable AnimationData[] interactionAnimation5AA6E = [
	AnimationData.frame(0x10, 0x36, 0x00),
	AnimationData.frame(0x10, 0x38, 0x00),
	AnimationData.frame(0x10, 0x3a, 0x00),
	AnimationData.frame(0x10, 0x3c, 0x00),
	AnimationData.loop(-4),
];

immutable AnimationData[] interactionAnimation5AA7C = [
	AnimationData.frame(0x02, 0x00, 0x00),
	AnimationData.frame(0x02, 0x02, 0x00),
	AnimationData.frame(0x02, 0x04, 0x00),
	// Loop:
	AnimationData.frame(0x02, 0x06, 0x00),
	AnimationData.frame(0x02, 0x08, 0x00),
	AnimationData.frame(0x02, 0x0a, 0x00),
	AnimationData.loop(-3),
];

immutable AnimationData[] interactionAnimation5AA90 = [
	AnimationData.frame(0x04, 0x00, 0x00),
	AnimationData.frame(0x04, 0x02, 0x00),
	AnimationData.frame(0x04, 0x04, 0x00),
	AnimationData.frame(0x04, 0x06, 0x00),
	AnimationData.loop(-4),
];

immutable AnimationData[] interactionAnimation5AA9E = [
	AnimationData.frame(0x08, 0x08, 0x00),
	AnimationData.frame(0x08, 0x0a, 0x00),
	AnimationData.frame(0x08, 0x0c, 0x00),
	AnimationData.loop(-3),
];

immutable AnimationData[] interactionAnimation5AAA9 = [
	AnimationData.frame(0x0c, 0x14, 0x00),
	AnimationData.frame(0x0c, 0x16, 0x00),
	AnimationData.frame(0x0c, 0x18, 0x00),
	AnimationData.frame(0x0c, 0x1a, 0x00),
	AnimationData.loop(-4),
];

immutable AnimationData[] interactionAnimation5AAB7 = [
	AnimationData.frame(0x06, 0x1c, 0x00),
	AnimationData.frame(0x06, 0x1e, 0x00),
	AnimationData.loop(-2),
];

immutable AnimationData[] interactionAnimation5AABF = [
	AnimationData.frame(0x04, 0x10, 0x00),
	AnimationData.frame(0x04, 0x12, 0x00),
	AnimationData.frame(0x03, 0x10, 0x00),
	AnimationData.frame(0x07, 0x14, 0x00),
	AnimationData.frame(0x08, 0x16, 0x00),
	// Loop:
	AnimationData.frame(0x08, 0x18, 0x00),
	AnimationData.loop(-1),
];

immutable AnimationData[] interactionAnimation5AAD3 = [
	AnimationData.frame(0x1e, 0x0c, 0x00),
	AnimationData.frame(0x12, 0x0e, 0x00),
	// Loop:
	AnimationData.frame(0x01, 0x10, 0x00),
	AnimationData.frame(0x01, 0x12, 0x00),
	AnimationData.loop(-2),
];

immutable AnimationData[] interactionAnimation5AAE1 = [
	AnimationData.frame(0xb4, 0x00, 0x00),
	AnimationData.frame(0x04, 0x02, 0x00),
	AnimationData.frame(0x04, 0x04, 0x00),
	AnimationData.frame(0x04, 0x00, 0x00),
	AnimationData.frame(0x04, 0x02, 0x00),
	AnimationData.frame(0x04, 0x04, 0x00),
	AnimationData.loop(-6),
];

immutable AnimationData[] interactionAnimation5AAF5 = [
	AnimationData.frame(0x08, 0x06, 0x00),
	AnimationData.frame(0x08, 0x08, 0x00),
	AnimationData.loop(-2),
];

immutable AnimationData[] interactionAnimation5AAFD = [
	AnimationData.frame(0x04, 0x0a, 0x00),
	AnimationData.frame(0x04, 0x0c, 0x00),
	AnimationData.frame(0x04, 0x0a, 0x00),
	AnimationData.frame(0x04, 0x0c, 0x00),
	AnimationData.frame(0x04, 0x0a, 0x00),
	AnimationData.frame(0x14, 0x0c, 0x00),
	AnimationData.loop(-6),
];

immutable AnimationData[] interactionAnimation5AB11 = [
	AnimationData.frame(0x08, 0x0e, 0x00),
	AnimationData.frame(0x08, 0x10, 0x00),
	AnimationData.loop(-2),
];

immutable AnimationData[] interactionAnimation5AB19 = [
	AnimationData.frame(0x04, 0x12, 0x00),
	AnimationData.frame(0x04, 0x14, 0x00),
	// Loop:
	AnimationData.frame(0x04, 0x12, 0x00),
	AnimationData.frame(0x14, 0x14, 0x00),
	AnimationData.loop(-2),
];

immutable AnimationData[] interactionAnimation5AB27 = [
	AnimationData.frame(0x0c, 0x00, 0x00),
	AnimationData.frame(0x0c, 0x02, 0x00),
	AnimationData.loop(-2),
];

immutable AnimationData[] interactionAnimation5AB2F = [
	AnimationData.frame(0x0c, 0x04, 0x00),
	AnimationData.frame(0x0c, 0x06, 0x00),
	AnimationData.loop(-2),
];

immutable AnimationData[] interactionAnimation5AB37 = [
	AnimationData.frame(0x0c, 0x08, 0x00),
	AnimationData.frame(0x0c, 0x0a, 0x00),
	AnimationData.loop(-2),
];

immutable AnimationData[] interactionAnimation5AB3F = [
	AnimationData.frame(0x10, 0x00, 0x01),
	AnimationData.frame(0x10, 0x02, 0x00),
	AnimationData.frame(0x10, 0x00, 0x00),
	AnimationData.frame(0x10, 0x02, 0x00),
	AnimationData.frame(0x10, 0x04, 0x00),
	AnimationData.frame(0x10, 0x06, 0x00),
	AnimationData.frame(0x10, 0x04, 0x00),
	AnimationData.frame(0x10, 0x06, 0x00),
	AnimationData.loop(-8),
];

immutable AnimationData[] interactionAnimation5AB59 = [
	AnimationData.frame(0x01, 0x08, 0x00),
	// Loop:
	AnimationData.frame(0x10, 0x0a, 0x00),
	AnimationData.frame(0x10, 0x0c, 0x00),
	AnimationData.loop(-2),
];

immutable AnimationData[] interactionAnimation5AB64 = [
	AnimationData.frame(0x08, 0x0e, 0x00),
	// Loop:
	AnimationData.frame(0x08, 0x10, 0x00),
	AnimationData.frame(0x08, 0x12, 0x00),
	AnimationData.loop(-2),
];

immutable AnimationData[] interactionAnimation5AB6F = [
	AnimationData.frame(0x08, 0x10, 0x00),
	AnimationData.frame(0x08, 0x0e, 0x00),
	AnimationData.frame(0x10, 0x0a, 0x01),
	AnimationData.frame(0x08, 0x10, 0x00),
	AnimationData.frame(0x08, 0x0e, 0x00),
	AnimationData.frame(0x08, 0x0a, 0x00),
	// Loop:
	AnimationData.frame(0x01, 0x08, 0x00),
	AnimationData.loop(-1),
];

immutable AnimationData[] interactionAnimation5AB78 = [
	AnimationData.frame(0x08, 0x10, 0x00),
	AnimationData.frame(0x08, 0x0e, 0x00),
	AnimationData.frame(0x08, 0x0a, 0x00),
	// Loop:
	AnimationData.frame(0x01, 0x08, 0x00),
	AnimationData.loop(-1),
];

immutable AnimationData[] interactionAnimation5AB86 = [
	AnimationData.frame(0x7f, 0x04, 0x00),
	AnimationData.loop(-1),
];

immutable AnimationData[] interactionAnimation5AB8B = [
	AnimationData.frame(0x01, 0x14, 0x00),
	// Loop:
	AnimationData.frame(0x10, 0x16, 0x00),
	AnimationData.frame(0x10, 0x18, 0x00),
	AnimationData.loop(-2),
];

immutable AnimationData[] interactionAnimation5AB96 = [
	AnimationData.frame(0x08, 0x1a, 0x00),
	// Loop:
	AnimationData.frame(0x08, 0x1c, 0x00),
	AnimationData.frame(0x08, 0x1e, 0x00),
	AnimationData.loop(-2),
];

immutable AnimationData[] interactionAnimation5ABA1 = [
	AnimationData.frame(0x08, 0x1c, 0x00),
	AnimationData.frame(0x08, 0x1a, 0x00),
	AnimationData.frame(0x10, 0x16, 0x01),
	AnimationData.frame(0x04, 0x00, 0x00),
	AnimationData.frame(0x04, 0x02, 0x00),
	AnimationData.frame(0x7f, 0x02, 0xff),
	AnimationData.frame(0x04, 0x04, 0x00),
	AnimationData.frame(0x04, 0x06, 0x00),
	AnimationData.frame(0x7f, 0x06, 0xff),
	AnimationData.frame(0x04, 0x08, 0x00),
	AnimationData.frame(0x04, 0x0a, 0x00),
	AnimationData.frame(0x7f, 0x0a, 0xff),
	AnimationData.frame(0x04, 0x0c, 0x00),
	AnimationData.frame(0x04, 0x0e, 0x00),
	AnimationData.frame(0x7f, 0x0e, 0xff),
	AnimationData.frame(0x02, 0x00, 0x00),
// Loop:
	AnimationData.frame(0x02, 0x1e, 0x00),
	AnimationData.frame(0x02, 0x20, 0x00),
	AnimationData.frame(0x02, 0x22, 0x00),
	AnimationData.loop(-3),
];
immutable(AnimationData)[] interactionAnimation5ABAA() => interactionAnimation5ABA1[3 .. $];
immutable(AnimationData)[] interactionAnimation5ABB3() => interactionAnimation5ABA1[6 .. $];
immutable(AnimationData)[] interactionAnimation5ABBC() => interactionAnimation5ABA1[9 .. $];
immutable(AnimationData)[] interactionAnimation5ABC5() => interactionAnimation5ABA1[12 .. $];
immutable(AnimationData)[] interactionAnimation5ABCE() => interactionAnimation5ABA1[15 .. $];

immutable AnimationData[] interactionAnimation5ABDC = [
	AnimationData.frame(0x04, 0x00, 0x00),
	AnimationData.frame(0x04, 0x02, 0x00),
	AnimationData.frame(0x04, 0x04, 0x00),
	AnimationData.frame(0x04, 0x06, 0x00),
	AnimationData.frame(0x04, 0x08, 0x00),
	AnimationData.loop(-5),
];

immutable AnimationData[] interactionAnimation5ABED = [
	AnimationData.frame(0x12, 0x16, 0x00),
	AnimationData.frame(0x12, 0x18, 0x00),
	AnimationData.loop(-2),
];

immutable AnimationData[] interactionAnimation5ABF5 = [
	AnimationData.frame(0x04, 0x08, 0x00),
	AnimationData.frame(0x04, 0x0a, 0x00),
	AnimationData.loop(-2),
];

immutable AnimationData[] interactionAnimation5ABFD = [
	AnimationData.frame(0x04, 0x1a, 0x00),
	AnimationData.frame(0x04, 0x1c, 0x00),
	AnimationData.loop(-2),
];

immutable AnimationData[] interactionAnimation5AC05 = [
	AnimationData.frame(0x0c, 0x12, 0x00),
	AnimationData.frame(0x0c, 0x14, 0x70),
	AnimationData.loop(-2),
];

immutable AnimationData[] interactionAnimation5AC0D = [
	AnimationData.frame(0x0c, 0x1e, 0x00),
	AnimationData.frame(0x0c, 0x20, 0x00),
	AnimationData.loop(-2),
];
immutable(AnimationData)[] interactionAnimation5AC10() => interactionAnimation5AC0D[1 .. $];

immutable AnimationData[] interactionAnimation5AC15 = [
	AnimationData.frame(0x0c, 0x22, 0x00),
	AnimationData.frame(0x0c, 0x24, 0x00),
	AnimationData.loop(-2),
];
immutable(AnimationData)[] interactionAnimation5AC18() => interactionAnimation5AC15[1 .. $];

immutable AnimationData[] interactionAnimation5AC1D = [
	AnimationData.frame(0x14, 0x04, 0x00),
	AnimationData.frame(0x28, 0x08, 0x00),
	AnimationData.frame(0x08, 0x04, 0x00),
	AnimationData.frame(0x78, 0x00, 0x00),
	// Loop:
	AnimationData.frame(0x7f, 0x00, 0xff),
	AnimationData.loop(-1),
];

immutable AnimationData[] interactionAnimation5AC2E = [
	AnimationData.frame(0x14, 0x0c, 0x00),
	AnimationData.frame(0x28, 0x08, 0x00),
	AnimationData.frame(0x08, 0x0c, 0x00),
	AnimationData.frame(0x78, 0x00, 0x00),
	// Loop:
	AnimationData.frame(0x7f, 0x00, 0xff),
	AnimationData.loop(-1),
];

immutable AnimationData[] interactionAnimation5AC3F = [
	AnimationData.frame(0x18, 0x00, 0x00),
	AnimationData.frame(0x18, 0x02, 0x00),
	AnimationData.frame(0x0e, 0x00, 0x00),
	AnimationData.frame(0x0e, 0x04, 0x00),
	AnimationData.loop(-4),
];

immutable AnimationData[] interactionAnimation5AC4D = [ // Unused
	AnimationData.frame(0x08, 0x06, 0x00),
	AnimationData.frame(0x14, 0x10, 0x00),
	AnimationData.frame(0x08, 0x12, 0x01),
	// Loop:
	AnimationData.frame(0x7f, 0x14, 0x00),
	AnimationData.loop(-1),
];

immutable AnimationData[] interactionAnimation5AC5B = [
	AnimationData.frame(0x02, 0x08, 0x00),
	AnimationData.frame(0x02, 0x06, 0x00),
	AnimationData.frame(0x02, 0x08, 0x00),
	AnimationData.frame(0x02, 0x04, 0x00),
	AnimationData.loop(-4),
];

immutable AnimationData[] interactionAnimation5AC69 = [
	AnimationData.frame(0x7f, 0x00, 0x00),
	AnimationData.frame(0x7f, 0x02, 0x00),
	AnimationData.frame(0x7f, 0x04, 0x00),
	AnimationData.frame(0x7f, 0x06, 0x00),
	AnimationData.frame(0x7f, 0x08, 0x00),
	// Loop:
	AnimationData.frame(0x08, 0x00, 0x00),
	AnimationData.frame(0x08, 0x02, 0x00),
	AnimationData.frame(0x08, 0x04, 0x00),
	AnimationData.frame(0x08, 0x06, 0x00),
	AnimationData.loop(-4),
];

immutable AnimationData[] interactionAnimation5AC6C = [
	AnimationData.frame(0x7f, 0x02, 0x00),
	AnimationData.frame(0x7f, 0x04, 0x00),
	AnimationData.frame(0x7f, 0x06, 0x00),
	AnimationData.frame(0x7f, 0x08, 0x00),
	// Loop:
	AnimationData.frame(0x08, 0x00, 0x00),
	AnimationData.frame(0x08, 0x02, 0x00),
	AnimationData.frame(0x08, 0x04, 0x00),
	AnimationData.frame(0x08, 0x06, 0x00),
	AnimationData.loop(-4),
];

immutable AnimationData[] interactionAnimation5AC6F = [
	AnimationData.frame(0x7f, 0x04, 0x00),
	AnimationData.frame(0x7f, 0x06, 0x00),
	AnimationData.frame(0x7f, 0x08, 0x00),
	// Loop:
	AnimationData.frame(0x08, 0x00, 0x00),
	AnimationData.frame(0x08, 0x02, 0x00),
	AnimationData.frame(0x08, 0x04, 0x00),
	AnimationData.frame(0x08, 0x06, 0x00),
	AnimationData.loop(-4),
];

immutable AnimationData[] interactionAnimation5AC72 = [
	AnimationData.frame(0x7f, 0x06, 0x00),
	AnimationData.frame(0x7f, 0x08, 0x00),
	// Loop:
	AnimationData.frame(0x08, 0x00, 0x00),
	AnimationData.frame(0x08, 0x02, 0x00),
	AnimationData.frame(0x08, 0x04, 0x00),
	AnimationData.frame(0x08, 0x06, 0x00),
	AnimationData.loop(-4),
];

immutable AnimationData[] interactionAnimation5AC75 = [
	AnimationData.frame(0x7f, 0x08, 0x00),
	// Loop:
	AnimationData.frame(0x08, 0x00, 0x00),
	AnimationData.frame(0x08, 0x02, 0x00),
	AnimationData.frame(0x08, 0x04, 0x00),
	AnimationData.frame(0x08, 0x06, 0x00),
	AnimationData.loop(-4),
];
immutable AnimationData[] interactionAnimation5AC78 = [
	AnimationData.frame(0x08, 0x00, 0x00),
	AnimationData.frame(0x08, 0x02, 0x00),
	AnimationData.frame(0x08, 0x04, 0x00),
	AnimationData.frame(0x08, 0x06, 0x00),
	AnimationData.loop(-4),
];

immutable AnimationData[] interactionAnimation5AC86 = [
	AnimationData.frame(0x08, 0x06, 0x00),
	AnimationData.frame(0x08, 0x04, 0x00),
	AnimationData.frame(0x08, 0x02, 0x00),
	AnimationData.frame(0x08, 0x00, 0x00),
	AnimationData.loop(-4),
];

immutable AnimationData[] interactionAnimation5AC94 = [
	AnimationData.frame(0xc8, 0x0c, 0x00),
	// Loop:
	AnimationData.frame(0x0a, 0x00, 0x00),
	AnimationData.frame(0x14, 0x0c, 0x00),
	AnimationData.frame(0x0a, 0x02, 0x00),
	AnimationData.frame(0x14, 0x0c, 0x00),
	AnimationData.loop(-4),
];

immutable AnimationData[] interactionAnimation5ACA5 = [
	AnimationData.frame(0xc8, 0x0c, 0x00),
	// Loop:
	AnimationData.frame(0x0a, 0x0c, 0x00),
	AnimationData.frame(0x0a, 0x04, 0x00),
	AnimationData.frame(0x0a, 0x06, 0x00),
	AnimationData.frame(0x0a, 0x0c, 0x00),
	AnimationData.frame(0x0a, 0x08, 0x00),
	AnimationData.frame(0x0a, 0x0a, 0x00),
	AnimationData.loop(-6),
];

immutable AnimationData[] interactionAnimation5ACBC = [
	AnimationData.frame(0x20, 0x04, 0x00),
	AnimationData.frame(0x08, 0x06, 0x00),
	AnimationData.frame(0x08, 0x08, 0x00),
	AnimationData.frame(0x08, 0x00, 0x00),
	AnimationData.loop(-4),
];

immutable AnimationData[] interactionAnimation5ACCA = [
	AnimationData.frame(0x20, 0x0a, 0x00),
	AnimationData.frame(0x08, 0x0c, 0x00),
	AnimationData.frame(0x08, 0x10, 0x00),
	AnimationData.frame(0x08, 0x12, 0x00),
	AnimationData.loop(-4),
];

immutable AnimationData[] interactionAnimation5ACD8 = [
	AnimationData.frame(0x7f, 0x02, 0x00),
	AnimationData.frame(0x06, 0x02, 0x00),
	AnimationData.frame(0x06, 0x04, 0x00),
	AnimationData.frame(0x05, 0x06, 0x00),
	AnimationData.frame(0x01, 0x06, 0xff),
	AnimationData.frame(0x28, 0x02, 0x01),
	// Loop:
	AnimationData.frame(0x14, 0x04, 0x01),
	AnimationData.frame(0x14, 0x02, 0x01),
	AnimationData.loop(-2),
];

immutable AnimationData[] interactionAnimation5ACE7 = [
	AnimationData.frame(0x28, 0x02, 0x01),
	// Loop:
	AnimationData.frame(0x14, 0x04, 0x01),
	AnimationData.frame(0x14, 0x02, 0x01),
	AnimationData.loop(-2),
];

immutable AnimationData[] interactionAnimation5ACEA = [
	AnimationData.frame(0x14, 0x04, 0x01),
	AnimationData.frame(0x14, 0x02, 0x01),
	AnimationData.loop(-2),
];

immutable AnimationData[] interactionAnimation5ACF2 = [
	AnimationData.frame(0x14, 0x02, 0x01),
	// Loop:
	AnimationData.frame(0x7f, 0x00, 0x00),
	AnimationData.loop(-1),
];

immutable AnimationData[] interactionAnimation5ACFA = [
	AnimationData.frame(0x10, 0x06, 0x02),
	AnimationData.frame(0x10, 0x08, 0x02),
	AnimationData.loop(-2),
];

immutable AnimationData[] interactionAnimation5AD02 = [
	AnimationData.frame(0x24, 0x00, 0x00),
	AnimationData.frame(0x08, 0x02, 0x00),
	AnimationData.frame(0x08, 0x00, 0x00),
	AnimationData.frame(0x08, 0x04, 0x00),
	AnimationData.frame(0x08, 0x02, 0x00),
	AnimationData.frame(0x08, 0x04, 0x00),
	AnimationData.loop(-6),
];
immutable(AnimationData)[] interactionAnimation5AD05() => interactionAnimation5AD02[1 .. $];
immutable(AnimationData)[] interactionAnimation5AD08() => interactionAnimation5AD02[2 .. $];
immutable(AnimationData)[] interactionAnimation5AD0B() => interactionAnimation5AD02[3 .. $];

immutable AnimationData[] interactionAnimation5AD16 = [
	AnimationData.frame(0x04, 0x00, 0x00),
	AnimationData.frame(0x04, 0x02, 0x00),
	AnimationData.frame(0x04, 0x04, 0x00),
	AnimationData.loop(-3),
];

immutable AnimationData[] interactionAnimation5AD21 = [
	AnimationData.frame(0x04, 0x06, 0x00),
	AnimationData.frame(0x04, 0x08, 0x00),
	AnimationData.frame(0x04, 0x0a, 0x00),
	AnimationData.loop(-3),
];

immutable AnimationData[] interactionAnimation5AD2C = [
	AnimationData.frame(0x05, 0x02, 0x00),
	AnimationData.frame(0x04, 0x04, 0x00),
	AnimationData.frame(0x01, 0x04, 0xff),
	// Loop:
	AnimationData.frame(0x7f, 0x06, 0x00),
	AnimationData.loop(-1),
];

immutable AnimationData[] interactionAnimation5AD35 = [
	AnimationData.frame(0x7f, 0x06, 0x00),
	AnimationData.loop(-1),
];

immutable AnimationData[] interactionAnimation5AD3A = [
	AnimationData.frame(0x05, 0x04, 0x00),
	AnimationData.frame(0x04, 0x02, 0x00),
	AnimationData.frame(0x01, 0x02, 0xff),
	// Loop:
	AnimationData.frame(0x7f, 0x00, 0x00),
	AnimationData.loop(-1),
];

immutable AnimationData[] interactionAnimation5AD43 = [
	AnimationData.frame(0x7f, 0x00, 0x00),
	AnimationData.loop(-1),
];

immutable AnimationData[] interactionAnimation5AD48 = [
	AnimationData.frame(0x0c, 0x06, 0x00),
	AnimationData.frame(0x04, 0x08, 0x00),
	AnimationData.frame(0x04, 0x0a, 0x00),
	AnimationData.frame(0x04, 0x0c, 0x00),
	AnimationData.frame(0x04, 0x0e, 0x00),
	AnimationData.frame(0x03, 0x10, 0x00),
	AnimationData.frame(0x01, 0x10, 0xff),
	AnimationData.loop(-7),
];

immutable AnimationData[] interactionAnimation5AD5F = [
	AnimationData.frame(0x04, 0x00, 0x00),
	AnimationData.frame(0x04, 0x02, 0x01),
	AnimationData.frame(0x04, 0x04, 0x00),
	AnimationData.frame(0x04, 0x06, 0x00),
	AnimationData.frame(0x04, 0x08, 0x00),
	AnimationData.frame(0x04, 0x0a, 0x00),
	AnimationData.frame(0x7f, 0x0a, 0xff),
];
immutable AnimationData[] interactionAnimation5AD74 = [
	AnimationData.frame(0x04, 0x0a, 0x00),
	AnimationData.frame(0x04, 0x08, 0x00),
	AnimationData.frame(0x04, 0x06, 0x00),
	AnimationData.frame(0x04, 0x04, 0x00),
	AnimationData.frame(0x04, 0x02, 0x00),
	AnimationData.frame(0x04, 0x00, 0x00),
	AnimationData.frame(0x7f, 0x00, 0xff),
];
immutable AnimationData[] interactionAnimation5AD89 = [
	AnimationData.frame(0x01, 0x0c, 0x00),
	AnimationData.frame(0x01, 0x1c, 0x00),
	AnimationData.frame(0x01, 0x0c, 0x00),
	AnimationData.frame(0x01, 0x1c, 0x00),
	AnimationData.frame(0x01, 0x0e, 0x00),
	AnimationData.frame(0x01, 0x1c, 0x00),
	AnimationData.frame(0x01, 0x0e, 0x00),
	AnimationData.frame(0x01, 0x1c, 0x00),
	AnimationData.frame(0x01, 0x10, 0x00),
	AnimationData.frame(0x01, 0x12, 0x00),
	AnimationData.frame(0x01, 0x10, 0x00),
	// Loop:
	AnimationData.frame(0x01, 0x12, 0x00),
	AnimationData.frame(0x01, 0x10, 0xff),
	AnimationData.loop(-2),
];

immutable AnimationData[] interactionAnimation5ADB2 = [
	AnimationData.frame(0x01, 0x14, 0x00),
	AnimationData.frame(0x01, 0x16, 0x01),
	AnimationData.frame(0x01, 0x14, 0x00),
	AnimationData.frame(0x01, 0x16, 0x01),
	AnimationData.frame(0x01, 0x18, 0x00),
	AnimationData.frame(0x01, 0x1a, 0x01),
	AnimationData.frame(0x01, 0x18, 0x00),
	AnimationData.frame(0x01, 0x1a, 0x01),
	AnimationData.loop(-8),
];

immutable AnimationData[] interactionAnimation5ADCC = [
	AnimationData.frame(0x01, 0x10, 0x00),
	AnimationData.frame(0x01, 0x12, 0x00),
	AnimationData.frame(0x01, 0x10, 0x00),
	AnimationData.frame(0x01, 0x12, 0x00),
	AnimationData.frame(0x01, 0x0e, 0x00),
	AnimationData.frame(0x01, 0x1c, 0x00),
	AnimationData.frame(0x01, 0x0e, 0x00),
	AnimationData.frame(0x01, 0x1c, 0x00),
	AnimationData.frame(0x01, 0x0c, 0x00),
	AnimationData.frame(0x01, 0x1c, 0x00),
	AnimationData.frame(0x01, 0x0c, 0x00),
	AnimationData.frame(0x7f, 0x0c, 0xff),
];
immutable AnimationData[] interactionAnimation5ADF0 = [
	AnimationData.frame(0x02, 0x1e, 0x00),
	AnimationData.frame(0x02, 0x20, 0x00),
	AnimationData.frame(0x02, 0x02, 0x00),
	AnimationData.frame(0x7f, 0x22, 0xff),
];



alias interaction0DOAMDataPointers = interaction00OAMDataPointers;
alias interaction0EOAMDataPointers = interaction00OAMDataPointers;
alias interaction12OAMDataPointers = interaction00OAMDataPointers;
alias interaction13OAMDataPointers = interaction00OAMDataPointers;
alias interaction15OAMDataPointers = interaction00OAMDataPointers;
alias interaction1DOAMDataPointers = interaction00OAMDataPointers;
alias interaction1EOAMDataPointers = interaction00OAMDataPointers;
alias interaction1FOAMDataPointers = interaction00OAMDataPointers;
alias interaction20OAMDataPointers = interaction00OAMDataPointers;
alias interaction21OAMDataPointers = interaction00OAMDataPointers;
alias interaction22OAMDataPointers = interaction00OAMDataPointers;
alias interaction23OAMDataPointers = interaction00OAMDataPointers;
alias interaction24OAMDataPointers = interaction00OAMDataPointers;
alias interaction25OAMDataPointers = interaction00OAMDataPointers;
alias interaction26OAMDataPointers = interaction00OAMDataPointers;
alias interaction27OAMDataPointers = interaction00OAMDataPointers;
alias interaction2FOAMDataPointers = interaction00OAMDataPointers;
alias interaction33OAMDataPointers = interaction00OAMDataPointers;
alias interaction67OAMDataPointers = interaction00OAMDataPointers;
alias interaction6COAMDataPointers = interaction00OAMDataPointers;
alias interaction70OAMDataPointers = interaction00OAMDataPointers;
alias interaction74OAMDataPointers = interaction00OAMDataPointers;
alias interaction76OAMDataPointers = interaction00OAMDataPointers;
alias interaction78OAMDataPointers = interaction00OAMDataPointers;
alias interaction7COAMDataPointers = interaction00OAMDataPointers;
alias interaction85OAMDataPointers = interaction00OAMDataPointers;
alias interaction8AOAMDataPointers = interaction00OAMDataPointers;
alias interaction90OAMDataPointers = interaction00OAMDataPointers;
alias interaction97OAMDataPointers = interaction00OAMDataPointers;
alias interaction9BOAMDataPointers = interaction00OAMDataPointers;
alias interactionA8OAMDataPointers = interaction00OAMDataPointers;
alias interactionACOAMDataPointers = interaction00OAMDataPointers;
alias interactionAFOAMDataPointers = interaction00OAMDataPointers;
alias interactionB2OAMDataPointers = interaction00OAMDataPointers;
alias interactionB3OAMDataPointers = interaction00OAMDataPointers;
alias interactionB5OAMDataPointers = interaction00OAMDataPointers;
alias interactionBDOAMDataPointers = interaction00OAMDataPointers;
alias interactionBEOAMDataPointers = interaction00OAMDataPointers;
alias interactionC5OAMDataPointers = interaction00OAMDataPointers;
alias interactionC6OAMDataPointers = interaction00OAMDataPointers;
alias interactionC7OAMDataPointers = interaction00OAMDataPointers;
alias interactionD0OAMDataPointers = interaction00OAMDataPointers;
alias interactionD1OAMDataPointers = interaction00OAMDataPointers;
alias interactionD8OAMDataPointers = interaction00OAMDataPointers;
alias interactionD9OAMDataPointers = interaction00OAMDataPointers;
alias interactionDAOAMDataPointers = interaction00OAMDataPointers;
alias interactionDBOAMDataPointers = interaction00OAMDataPointers;
alias interactionDCOAMDataPointers = interaction00OAMDataPointers;
alias interactionE4OAMDataPointers = interaction00OAMDataPointers;
immutable interaction00OAMDataPointers = [
	interactionOAMData51077,
	interactionOAMData51088,
	interactionOAMData51099,
	interactionOAMData510AA,
	interactionOAMData510BB,
	interactionOAMData510CC,
	interactionOAMData510DD,
	interactionOAMData510EE,
];
immutable interaction01OAMDataPointers = [
	interactionOAMData510FF,
	interactionOAMData51110,
	interactionOAMData51121,
	interactionOAMData51132,
	interactionOAMData51143,
	interactionOAMData51154,
	interactionOAMData51165,
	interactionOAMData51176,
];
immutable interaction02OAMDataPointers = [
	interactionOAMData5054A,
	interactionOAMData51E5C,
	interactionOAMData523FF,
	interactionOAMData52420,
	interactionOAMData52441,
	interactionOAMData5120F,
	interactionOAMData50090,
	interactionOAMData50553,
	interactionOAMData5055C,
];
immutable interaction03OAMDataPointers = [
	interactionOAMData5013F,
	interactionOAMData50148,
	interactionOAMData50151,
];
immutable interaction04OAMDataPointers = [
	interactionOAMData5015A,
	interactionOAMData50163,
	interactionOAMData5016C,
	interactionOAMData50175,
	interactionOAMData5017E,
	interactionOAMData50187,
	interactionOAMData50190,
	interactionOAMData50199,
	interactionOAMData501A2,
	interactionOAMData501AB,
];
immutable interaction05OAMDataPointers = [
	interactionOAMData502B9,
	interactionOAMData502E6,
	interactionOAMData5009A,
];
alias interaction09OAMDataPointers = interaction06OAMDataPointers;
alias interaction0COAMDataPointers = interaction06OAMDataPointers;
alias interaction82OAMDataPointers = interaction06OAMDataPointers;
immutable interaction06OAMDataPointers = [
	interactionOAMData51187,
	interactionOAMData51198,
	interactionOAMData511A9,
	interactionOAMData511BA,
	interactionOAMData513EB,
];
immutable interaction07OAMDataPointers = [
	interactionOAMData50205,
	interactionOAMData502B9,
];
immutable interaction08OAMDataPointers = [
	interactionOAMData511CB,
	interactionOAMData511DC,
	interactionOAMData511ED,
	interactionOAMData511FE,
	interactionOAMData50205,
	interactionOAMData502B9,
];
immutable interaction0AOAMDataPointers = [
	interactionOAMData501CF,
	interactionOAMData501D8,
	interactionOAMData501E1,
	interactionOAMData501EA,
];
immutable interaction7DOAMDataPointers = [
	interactionOAMData5237B,
	interactionOAMData52A75,
	interactionOAMData51DAD,
	interactionOAMData52AA6,
	interactionOAMData50068,
	interactionOAMData5006D,
	interactionOAMData50072,
	interactionOAMData50077,
	interactionOAMData5007C,
	interactionOAMData50081,
	interactionOAMData50086,
	interactionOAMData5008B,
];
immutable interaction14OAMDataPointers = [
	interactionOAMData50220,
	interactionOAMData50229,
];
immutable interaction19OAMDataPointers = [
	interactionOAMData50205,
	interactionOAMData50460,
	interactionOAMData501F3,
	interactionOAMData50469,
	interactionOAMData501FC,
	interactionOAMData50472,
	interactionOAMData50B15,
	interactionOAMData50B22,
	interactionOAMData50B2F,
	interactionOAMData50B3C,
	interactionOAMData50B49,
	interactionOAMData50B56,
	interactionOAMData50B63,
	interactionOAMData50B70,
	interactionOAMData50B7D,
	interactionOAMData50B8A,
	interactionOAMData50B97,
	interactionOAMData50BA4,
	interactionOAMData50BB1,
	interactionOAMData50BBE,
	interactionOAMData50BCB,
	interactionOAMData50BD8,
	interactionOAMData50BE5,
	interactionOAMData50BF2,
	interactionOAMData5047B,
	interactionOAMData504CC,
	interactionOAMData5049F,
	interactionOAMData50502,
	interactionOAMData50541,
	interactionOAMData5050B,
	interactionOAMData50484,
	interactionOAMData504D5,
	interactionOAMData504A8,
	interactionOAMData50514,
	interactionOAMData5051D,
	interactionOAMData504B1,
	interactionOAMData504BA,
	interactionOAMData50526,
	interactionOAMData5052F,
];
immutable interaction1AOAMDataPointers = [
	interactionOAMData5009A,
	interactionOAMData500A9,
	interactionOAMData500AE,
	interactionOAMData500B3,
];
immutable interaction1BOAMDataPointers = [
	interactionOAMData53188,
	interactionOAMData53199,
	interactionOAMData531AA,
	interactionOAMData531B3,
	interactionOAMData531C4,
	interactionOAMData531D5,
];
immutable interaction7AOAMDataPointers = [
	interactionOAMData530A7,
	interactionOAMData530B8,
	interactionOAMData530C9,
	interactionOAMData530DA,
	interactionOAMData530F3,
	interactionOAMData5310C,
	interactionOAMData53125,
	interactionOAMData53146,
	interactionOAMData53167,
];
immutable interaction7BOAMDataPointers = [
	interactionOAMData51919,
	interactionOAMData5192A,
];
alias interaction17OAMDataPointers = interaction0BOAMDataPointers;
alias interaction18OAMDataPointers = interaction0BOAMDataPointers;
alias interaction47OAMDataPointers = interaction0BOAMDataPointers;
alias interaction60OAMDataPointers = interaction0BOAMDataPointers;
alias interaction63OAMDataPointers = interaction0BOAMDataPointers;
alias interaction77OAMDataPointers = interaction0BOAMDataPointers;
alias interaction81OAMDataPointers = interaction0BOAMDataPointers;
alias interaction8COAMDataPointers = interaction0BOAMDataPointers;
alias interaction8FOAMDataPointers = interaction0BOAMDataPointers;
alias interaction91OAMDataPointers = interaction0BOAMDataPointers;
alias interaction95OAMDataPointers = interaction0BOAMDataPointers;
alias interactionA0OAMDataPointers = interaction0BOAMDataPointers;
alias interactionB1OAMDataPointers = interaction0BOAMDataPointers;
alias interactionB6OAMDataPointers = interaction0BOAMDataPointers;
alias interactionD7OAMDataPointers = interaction0BOAMDataPointers;
immutable interaction0BOAMDataPointers = [
	interactionOAMData5009A,
	interactionOAMData500A9,
	interactionOAMData500AE,
	interactionOAMData50205,
];
alias interaction71OAMDataPointers = interaction1COAMDataPointers;
alias interactionA5OAMDataPointers = interaction1COAMDataPointers;
alias interactionE5OAMDataPointers = interaction1COAMDataPointers;
immutable interaction1COAMDataPointers = [
	interactionOAMData5020E,
	interactionOAMData51396,
	interactionOAMData501B4,
	interactionOAMData50968,
	interactionOAMData503A3,
	interactionOAMData503AC,
	interactionOAMData52462,
	interactionOAMData523BD,
	interactionOAMData52483,
	interactionOAMData50968,
	interactionOAMData502A7,
	interactionOAMData502B9,
	interactionOAMData502E6,
	interactionOAMData502EF,
	interactionOAMData519C3,
];
immutable interaction28OAMDataPointers = [
	interactionOAMData50613,
	interactionOAMData50620,
	interactionOAMData5062D,
	interactionOAMData5063A,
	interactionOAMData5064B,
	interactionOAMData50658,
	interactionOAMData50665,
	interactionOAMData50672,
	interactionOAMData5067F,
	interactionOAMData5068C,
	interactionOAMData50699,
	interactionOAMData506A6,
	interactionOAMData506B7,
	interactionOAMData506C4,
	interactionOAMData506D1,
	interactionOAMData506DE,
];
immutable interaction29OAMDataPointers = [
	interactionOAMData505EC,
	interactionOAMData505F9,
];
immutable interaction2BOAMDataPointers = [
	interactionOAMData507BB,
	interactionOAMData507C8,
	interactionOAMData50606,
	interactionOAMData507D5,
	interactionOAMData503B5,
	interactionOAMData503C7,
	interactionOAMData503F4,
	interactionOAMData50433,
];
immutable interaction2COAMDataPointers = [
	interactionOAMData5037F,
	interactionOAMData5048D,
	interactionOAMData503B5,
];
immutable interaction2DOAMDataPointers = [
	interactionOAMData5048D,
	interactionOAMData50538,
];
immutable interaction30OAMDataPointers = [
	interactionOAMData50217,
	interactionOAMData50301,
	interactionOAMData502B0,
	interactionOAMData5032E,
	interactionOAMData5037F,
	interactionOAMData503B5,
];
alias interaction4FOAMDataPointers = interaction31OAMDataPointers;
immutable interaction31OAMDataPointers = [
	interactionOAMData502F8,
	interactionOAMData50325,
	interactionOAMData50388,
	interactionOAMData503D0,
	interactionOAMData5020E,
	interactionOAMData502A7,
	interactionOAMData5037F,
	interactionOAMData503B5,
	interactionOAMData50418,
	interactionOAMData50421,
	interactionOAMData50BFF,
	interactionOAMData5020E,
	interactionOAMData50975,
];
immutable interaction32OAMDataPointers = [
	interactionOAMData501B4,
	interactionOAMData502C2,
	interactionOAMData50325,
	interactionOAMData50388,
	interactionOAMData50205,
	interactionOAMData502B9,
	interactionOAMData502F8,
	interactionOAMData5037F,
];
immutable interaction34OAMDataPointers = [
	interactionOAMData50982,
];
immutable interaction35OAMDataPointers = [
	interactionOAMData5020E,
	interactionOAMData50313,
	interactionOAMData502A7,
	interactionOAMData5031C,
	interactionOAMData5037F,
	interactionOAMData50388,
	interactionOAMData503B5,
	interactionOAMData503D0,
	interactionOAMData506EB,
	interactionOAMData506F8,
	interactionOAMData51BF4,
	interactionOAMData51C09,
	interactionOAMData51C1E,
	interactionOAMData51C33,
	interactionOAMData51286,
	interactionOAMData51297,
	interactionOAMData512A8,
	interactionOAMData512B9,
	interactionOAMData50705,
	interactionOAMData50712,
	interactionOAMData5071F,
	interactionOAMData512CA,
	interactionOAMData50496,
];
immutable interaction36OAMDataPointers = [
	interactionOAMData502F8,
	interactionOAMData50325,
	interactionOAMData50388,
	interactionOAMData503D0,
	interactionOAMData5020E,
	interactionOAMData502A7,
	interactionOAMData5037F,
	interactionOAMData503B5,
	interactionOAMData50565,
	interactionOAMData50577,
	interactionOAMData5056E,
	interactionOAMData503F4,
	interactionOAMData5028C,
	interactionOAMData5099C,
	interactionOAMData509A9,
	interactionOAMData509B6,
	interactionOAMData509C3,
];
immutable interaction5DOAMDataPointers = [
	interactionOAMData502A7,
	interactionOAMData50325,
	interactionOAMData5037F,
	interactionOAMData50388,
	interactionOAMData503B5,
	interactionOAMData503D0,
];
immutable interaction39OAMDataPointers = [
	interactionOAMData5020E,
	interactionOAMData5030A,
	interactionOAMData5037F,
	interactionOAMData50388,
	interactionOAMData503B5,
	interactionOAMData503D0,
	interactionOAMData502A7,
	interactionOAMData50325,
];
immutable interaction4BOAMDataPointers = [
	interactionOAMData502F8,
	interactionOAMData50325,
	interactionOAMData50388,
	interactionOAMData503D0,
	interactionOAMData5020E,
	interactionOAMData502A7,
	interactionOAMData5037F,
	interactionOAMData503B5,
	interactionOAMData5040F,
	interactionOAMData503F4,
	interactionOAMData50589,
	interactionOAMData50592,
];
alias interactionE3OAMDataPointers = interaction4COAMDataPointers;
immutable interaction4COAMDataPointers = [
	interactionOAMData5020E,
	interactionOAMData502F8,
	interactionOAMData502A7,
	interactionOAMData50325,
	interactionOAMData5020E,
	interactionOAMData5037F,
	interactionOAMData502A7,
	interactionOAMData50388,
];
alias interaction3AOAMDataPointers = interaction2EOAMDataPointers;
alias interaction3BOAMDataPointers = interaction2EOAMDataPointers;
alias interaction3COAMDataPointers = interaction2EOAMDataPointers;
alias interaction3DOAMDataPointers = interaction2EOAMDataPointers;
alias interaction3FOAMDataPointers = interaction2EOAMDataPointers;
alias interaction4EOAMDataPointers = interaction2EOAMDataPointers;
alias interaction52OAMDataPointers = interaction2EOAMDataPointers;
alias interaction55OAMDataPointers = interaction2EOAMDataPointers;
alias interaction58OAMDataPointers = interaction2EOAMDataPointers;
alias interactionBFOAMDataPointers = interaction2EOAMDataPointers;
immutable interaction2EOAMDataPointers = [
	interactionOAMData502F8,
	interactionOAMData50325,
	interactionOAMData50388,
	interactionOAMData503D0,
	interactionOAMData5020E,
	interactionOAMData502A7,
	interactionOAMData5037F,
	interactionOAMData503B5,
	interactionOAMData503F4,
	interactionOAMData50433,
	interactionOAMData5040F,
	interactionOAMData50445,
	interactionOAMData50538,
];
immutable interaction48OAMDataPointers = [
	interactionOAMData50DFA,
	interactionOAMData50E07,
	interactionOAMData503D0,
	interactionOAMData5040F,
	interactionOAMData5020E,
	interactionOAMData502A7,
	interactionOAMData503B5,
	interactionOAMData503F4,
	interactionOAMData50433,
	interactionOAMData5048D,
	interactionOAMData50445,
	interactionOAMData504C3,
	interactionOAMData502F8,
	interactionOAMData50325,
];
immutable interaction4DOAMDataPointers = [
	interactionOAMData51792,
	interactionOAMData517A3,
	interactionOAMData50D9F,
	interactionOAMData50DAC,
	interactionOAMData517B4,
	interactionOAMData517C5,
	interactionOAMData50DB9,
	interactionOAMData50DC6,
	interactionOAMData517D6,
];
immutable interaction3EOAMDataPointers = [
	interactionOAMData51682,
	interactionOAMData51693,
	interactionOAMData516A4,
	interactionOAMData516B5,
	interactionOAMData50067,
];
alias interaction65OAMDataPointers = interaction41OAMDataPointers;
immutable interaction41OAMDataPointers = [
	interactionOAMData5020E,
	interactionOAMData502F8,
	interactionOAMData502A7,
	interactionOAMData50325,
	interactionOAMData5100F,
	interactionOAMData5101C,
	interactionOAMData51029,
	interactionOAMData51036,
];
alias interaction42OAMDataPointers = interaction38OAMDataPointers;
alias interaction43OAMDataPointers = interaction38OAMDataPointers;
alias interaction44OAMDataPointers = interaction38OAMDataPointers;
alias interaction45OAMDataPointers = interaction38OAMDataPointers;
alias interactionCAOAMDataPointers = interaction38OAMDataPointers;
alias interactionCCOAMDataPointers = interaction38OAMDataPointers;
immutable interaction38OAMDataPointers = [
	interactionOAMData5020E,
	interactionOAMData502A7,
];
immutable interaction5EOAMDataPointers = [
	interactionOAMData50232,
	interactionOAMData5035B,
	interactionOAMData50121,
	interactionOAMData50126,
	interactionOAMData50126,
	interactionOAMData5012B,
	interactionOAMData50364,
	interactionOAMData5023B,
	interactionOAMData50244,
	interactionOAMData50256,
	interactionOAMData50130,
	interactionOAMData5036D,
	interactionOAMData5025F,
	interactionOAMData50268,
	interactionOAMData50271,
	interactionOAMData5027A,
	interactionOAMData50283,
	interactionOAMData50135,
	interactionOAMData5013A,
	interactionOAMData5013A,
	interactionOAMData50376,
];
immutable interaction51OAMDataPointers = [
	interactionOAMData5170A,
	interactionOAMData5171B,
	interactionOAMData5172C,
	interactionOAMData5173D,
	interactionOAMData5174E,
	interactionOAMData5175F,
];
immutable interaction53OAMDataPointers = [
	interactionOAMData50C5A,
	interactionOAMData50C67,
	interactionOAMData50C74,
	interactionOAMData50C81,
	interactionOAMData50C8E,
	interactionOAMData50C9B,
	interactionOAMData50CA8,
	interactionOAMData50CB5,
];
immutable interaction54OAMDataPointers = [
	interactionOAMData5020E,
	interactionOAMData50295,
	interactionOAMData502F8,
	interactionOAMData502A7,
	interactionOAMData5029E,
	interactionOAMData50325,
];
immutable interaction57OAMDataPointers = [
	interactionOAMData51770,
	interactionOAMData50CC2,
	interactionOAMData51781,
	interactionOAMData50CCF,
	interactionOAMData50CDC,
	interactionOAMData50CE9,
	interactionOAMData50CE9,
	interactionOAMData50CF6,
	interactionOAMData50D03,
	interactionOAMData50D10,
	interactionOAMData50D1D,
	interactionOAMData50D2A,
	interactionOAMData5059B,
	interactionOAMData505A4,
];
immutable interaction59OAMDataPointers = [
	interactionOAMData50D37,
	interactionOAMData50D44,
	interactionOAMData50D51,
	interactionOAMData50D5E,
	interactionOAMData50D6B,
	interactionOAMData50D78,
	interactionOAMData50D85,
	interactionOAMData50D92,
];
immutable interaction5AOAMDataPointers = [
	interactionOAMData517E7,
	interactionOAMData517F8,
	interactionOAMData51809,
	interactionOAMData5181A,
	interactionOAMData5182B,
	interactionOAMData5183C,
	interactionOAMData5184D,
	interactionOAMData5185E,
];
immutable interaction5BOAMDataPointers = [
	interactionOAMData500BD,
	interactionOAMData5024D,
	interactionOAMData50DD3,
	interactionOAMData50DE0,
];
immutable interaction5COAMDataPointers = [
	interactionOAMData5186F,
	interactionOAMData51880,
	interactionOAMData51891,
	interactionOAMData518A2,
];
immutable interaction61OAMDataPointers = [
	interactionOAMData50205,
	interactionOAMData501B4,
	interactionOAMData500A9,
	interactionOAMData505AD,
	interactionOAMData50DED,
	interactionOAMData518B3,
	interactionOAMData51D6E,
];
immutable interaction62OAMDataPointers = [
	interactionOAMData5020E,
	interactionOAMData502A7,
];
immutable interaction64OAMDataPointers = [
	interactionOAMData5037F,
	interactionOAMData50388,
	interactionOAMData50391,
	interactionOAMData5039A,
	interactionOAMData5009A,
];
immutable interaction72OAMDataPointers = [
	interactionOAMData524A4,
	interactionOAMData524C5,
	interactionOAMData524E6,
	interactionOAMData52507,
	interactionOAMData5020E,
	interactionOAMData502A7,
	interactionOAMData502F8,
	interactionOAMData50325,
];
immutable interaction66OAMDataPointers = [
	interactionOAMData502F8,
	interactionOAMData50325,
	interactionOAMData50388,
	interactionOAMData503D0,
	interactionOAMData5020E,
	interactionOAMData502A7,
	interactionOAMData5037F,
	interactionOAMData503B5,
	interactionOAMData503F4,
	interactionOAMData5040F,
	interactionOAMData50565,
	interactionOAMData5056E,
	interactionOAMData50325,
	interactionOAMData50433,
	interactionOAMData50E21,
	interactionOAMData50E2E,
	interactionOAMData50445,
	interactionOAMData50E3B,
	interactionOAMData50E48,
];
immutable interactionC8OAMDataPointers = [
	interactionOAMData512DB,
	interactionOAMData512EC,
	interactionOAMData512FD,
	interactionOAMData507E2,
	interactionOAMData5130E,
];
immutable interaction68OAMDataPointers = [
	interactionOAMData51C48,
	interactionOAMData51C5D,
	interactionOAMData518C4,
	interactionOAMData518D5,
	interactionOAMData51C72,
	interactionOAMData51C87,
	interactionOAMData51C9C,
	interactionOAMData51CB1,
	interactionOAMData5195D,
	interactionOAMData5196E,
	interactionOAMData518C4,
	interactionOAMData518D5,
	interactionOAMData5197F,
	interactionOAMData51990,
	interactionOAMData519A1,
	interactionOAMData519B2,
];
alias interaction9DOAMDataPointers = interaction69OAMDataPointers;
immutable interaction69OAMDataPointers = [
	interactionOAMData5020E,
	interactionOAMData502A7,
	interactionOAMData50325,
	interactionOAMData50388,
	interactionOAMData5020E,
	interactionOAMData502A7,
	interactionOAMData502F8,
	interactionOAMData5037F,
];
alias interaction6AOAMDataPointers = interaction2AOAMDataPointers;
immutable interaction2AOAMDataPointers = [
	interactionOAMData5131F,
	interactionOAMData51330,
];
immutable interaction6BOAMDataPointers = [
	interactionOAMData51AC2,
	interactionOAMData51AD3,
	interactionOAMData5094E,
	interactionOAMData5095B,
	interactionOAMData5009A,
	interactionOAMData5020E,
	interactionOAMData50205,
	interactionOAMData52823,
	interactionOAMData52848,
	interactionOAMData5286D,
	interactionOAMData5020E,
	interactionOAMData502A7,
	interactionOAMData500DB,
	interactionOAMData502B9,
	interactionOAMData502E6,
];
alias interactionA3OAMDataPointers = interaction79OAMDataPointers;
alias interactionA4OAMDataPointers = interaction79OAMDataPointers;
immutable interaction79OAMDataPointers = [
	interactionOAMData50205,
	interactionOAMData513C9,
	interactionOAMData51E75,
	interactionOAMData513DA,
	interactionOAMData51E8E,
	interactionOAMData5239C,
];
immutable interaction7EOAMDataPointers = [
	interactionOAMData51DC6,
	interactionOAMData51DDF,
];
immutable interaction7FOAMDataPointers = [
	interactionOAMData51DF8,
	interactionOAMData5020E,
	interactionOAMData50205,
	interactionOAMData523BD,
	interactionOAMData523DE,
];
immutable interaction8DOAMDataPointers = [
	interactionOAMData50EBD,
	interactionOAMData50ECA,
	interactionOAMData50ED7,
	interactionOAMData50EE4,
	interactionOAMData50EBD,
	interactionOAMData50ECA,
	interactionOAMData50EF1,
	interactionOAMData50EFE,
];
alias interaction9EOAMDataPointers = interaction16OAMDataPointers;
immutable interaction16OAMDataPointers = [
	interactionOAMData5020E,
	interactionOAMData502E6,
];
immutable interactionBBOAMDataPointers = [
	interactionOAMData520D4,
	interactionOAMData520ED,
];
immutable interactionE2OAMDataPointers = [
	interactionOAMData500C7,
	interactionOAMData500CC,
	interactionOAMData500D1,
	interactionOAMData500D6,
	interactionOAMData500DB,
	interactionOAMData500E0,
	interactionOAMData500E5,
	interactionOAMData500EA,
];
alias interaction96OAMDataPointers = interaction10OAMDataPointers;
immutable interaction10OAMDataPointers = [
	interactionOAMData502F8,
	interactionOAMData50325,
	interactionOAMData50388,
	interactionOAMData503D0,
	interactionOAMData5020E,
	interactionOAMData502A7,
	interactionOAMData5037F,
	interactionOAMData503B5,
	interactionOAMData50A86,
	interactionOAMData50A93,
	interactionOAMData5163E,
	interactionOAMData5164F,
	interactionOAMData50AA0,
	interactionOAMData50AAD,
	interactionOAMData51660,
	interactionOAMData51671,
];
immutable interactionE0OAMDataPointers = [
	interactionOAMData51231,
];
immutable interaction46OAMDataPointers = [
	interactionOAMData5084A,
	interactionOAMData50857,
	interactionOAMData5087E,
	interactionOAMData5088B,
	interactionOAMData50830,
	interactionOAMData5083D,
	interactionOAMData50864,
	interactionOAMData50871,
];
immutable interaction49OAMDataPointers = [
	interactionOAMData516C6,
	interactionOAMData516D7,
	interactionOAMData516E8,
	interactionOAMData516F9,
];
immutable interaction50OAMDataPointers = [
	interactionOAMData50205,
	interactionOAMData502B9,
	interactionOAMData50067,
];
alias interaction99OAMDataPointers = interaction56OAMDataPointers;
immutable interaction56OAMDataPointers = [
	interactionOAMData503A3,
	interactionOAMData503AC,
	interactionOAMData52462,
	interactionOAMData523BD,
	interactionOAMData52483,
	interactionOAMData5009A,
];
alias interaction73OAMDataPointers = interaction4AOAMDataPointers;
immutable interaction4AOAMDataPointers = [
	interactionOAMData5020E,
	interactionOAMData502F8,
	interactionOAMData500B8,
	interactionOAMData50325,
	interactionOAMData51DC6,
	interactionOAMData51682,
	interactionOAMData503E2,
	interactionOAMData51682,
	interactionOAMData5009A,
	interactionOAMData500A9,
	interactionOAMData500AE,
	interactionOAMData500B3,
	interactionOAMData5009A,
	interactionOAMData502B9,
	interactionOAMData502E6,
	interactionOAMData503E2,
	interactionOAMData523BD,
	interactionOAMData523DE,
	interactionOAMData52B08,
	interactionOAMData51682,
	interactionOAMData51C48,
	interactionOAMData51682,
	interactionOAMData51DC6,
];
immutable interaction0FOAMDataPointers = [
	interactionOAMData50337,
	interactionOAMData500B8,
	interactionOAMData5009A,
];
immutable interaction75OAMDataPointers = [
	interactionOAMData52C11,
	interactionOAMData52C4A,
	interactionOAMData52D67,
	interactionOAMData52C83,
	interactionOAMData52936,
	interactionOAMData52CBC,
	interactionOAMData52717,
	interactionOAMData52738,
	interactionOAMData52759,
	interactionOAMData5277A,
	interactionOAMData5279B,
	interactionOAMData527BC,
	interactionOAMData52EA8,
	interactionOAMData52EF1,
	interactionOAMData52F3A,
	interactionOAMData52F83,
	interactionOAMData52FCC,
	interactionOAMData505DA,
	interactionOAMData51BB0,
	interactionOAMData52106,
	interactionOAMData51BC1,
	interactionOAMData5211F,
	interactionOAMData505E3,
	interactionOAMData527DD,
	interactionOAMData50067,
	interactionOAMData51BD2,
	interactionOAMData51BE3,
	interactionOAMData52307,
	interactionOAMData52324,
	interactionOAMData52341,
	interactionOAMData5235E,
];
immutable interactionDEOAMDataPointers = [
	interactionOAMData501BD,
	interactionOAMData501C6,
];
immutable interactionE1OAMDataPointers = [
	interactionOAMData501BD,
	interactionOAMData502CB,
	interactionOAMData502DD,
	interactionOAMData50337,
	interactionOAMData50340,
	interactionOAMData50349,
];
alias interaction6EOAMDataPointers = interaction6DOAMDataPointers;
immutable interaction6DOAMDataPointers = [
	interactionOAMData502F8,
	interactionOAMData50325,
	interactionOAMData50388,
	interactionOAMData503D0,
	interactionOAMData5020E,
	interactionOAMData502A7,
	interactionOAMData5037F,
	interactionOAMData503B5,
	interactionOAMData51792,
	interactionOAMData517A3,
	interactionOAMData50D9F,
	interactionOAMData50DAC,
	interactionOAMData517B4,
	interactionOAMData517C5,
	interactionOAMData50DB9,
	interactionOAMData50DC6,
	interactionOAMData518E6,
	interactionOAMData51682,
	interactionOAMData51693,
	interactionOAMData516A4,
	interactionOAMData516B5,
	interactionOAMData50E14,
	interactionOAMData503F4,
];
immutable interaction40OAMDataPointers = [
	interactionOAMData503B5,
	interactionOAMData5037F,
	interactionOAMData50C0C,
	interactionOAMData50C19,
	interactionOAMData50C26,
	interactionOAMData50C33,
	interactionOAMData50C40,
	interactionOAMData50C4D,
];
immutable interaction37OAMDataPointers = [
	interactionOAMData509D0,
	interactionOAMData509DD,
	interactionOAMData509EA,
	interactionOAMData509F7,
	interactionOAMData50A04,
	interactionOAMData50A11,
	interactionOAMData50A1E,
	interactionOAMData50A2B,
	interactionOAMData503F4,
	interactionOAMData50433,
	interactionOAMData5048D,
	interactionOAMData5040F,
	interactionOAMData50445,
	interactionOAMData504C3,
	interactionOAMData5043C,
	interactionOAMData503FD,
	interactionOAMData5043C,
	interactionOAMData50406,
	interactionOAMData50565,
	interactionOAMData50580,
	interactionOAMData50A38,
	interactionOAMData50A45,
];
immutable interaction6FOAMDataPointers = [
	interactionOAMData51396,
	interactionOAMData513A7,
	interactionOAMData513B8,
];
immutable interaction80OAMDataPointers = [
	interactionOAMData501BD,
	interactionOAMData502CB,
	interactionOAMData502DD,
	interactionOAMData50337,
	interactionOAMData500C2,
	interactionOAMData504DE,
	interactionOAMData504E7,
	interactionOAMData50205,
	interactionOAMData5020E,
	interactionOAMData5009F,
	interactionOAMData51043,
	interactionOAMData51050,
	interactionOAMData5105D,
	interactionOAMData5106A,
	interactionOAMData5009A,
	interactionOAMData500A9,
];
immutable interaction83OAMDataPointers = [
	interactionOAMData50205,
	interactionOAMData502B9,
	interactionOAMData5009A,
];
alias interaction84OAMDataPointers = interaction11OAMDataPointers;
immutable interaction11OAMDataPointers = [
	interactionOAMData53015,
	interactionOAMData52CF5,
	interactionOAMData5009A,
	interactionOAMData500A9,
	interactionOAMData500AE,
	interactionOAMData500B3,
	interactionOAMData51E11,
	interactionOAMData502E6,
	interactionOAMData50337,
	interactionOAMData50352,
	interactionOAMData5305E,
];
immutable interaction86OAMDataPointers = [
	interactionOAMData51D44,
	interactionOAMData51D59,
	interactionOAMData500A4,
	interactionOAMData526D5,
];
immutable interaction87OAMDataPointers = [
	interactionOAMData521B0,
	interactionOAMData521CD,
	interactionOAMData521EA,
	interactionOAMData52207,
	interactionOAMData5222C,
	interactionOAMData52251,
	interactionOAMData5226E,
	interactionOAMData5228B,
	interactionOAMData522AC,
	interactionOAMData522CD,
	interactionOAMData522EA,
];
immutable interaction88OAMDataPointers = [
	interactionOAMData51FA8,
	interactionOAMData51FC1,
	interactionOAMData51FDA,
	interactionOAMData51FF3,
	interactionOAMData5200C,
	interactionOAMData52025,
];
immutable interaction89OAMDataPointers = [
	interactionOAMData51CC6,
	interactionOAMData51CDB,
	interactionOAMData51CF0,
	interactionOAMData51D05,
	interactionOAMData504F0,
	interactionOAMData513FC,
	interactionOAMData5140D,
	interactionOAMData5141E,
	interactionOAMData5142F,
	interactionOAMData51440,
	interactionOAMData504F9,
	interactionOAMData51451,
	interactionOAMData51462,
	interactionOAMData51473,
	interactionOAMData51484,
	interactionOAMData51495,
];
immutable interaction8BOAMDataPointers = [
	interactionOAMData50E55,
	interactionOAMData50E62,
	interactionOAMData50E6F,
	interactionOAMData50E7C,
	interactionOAMData50E89,
	interactionOAMData50E96,
	interactionOAMData50EA3,
	interactionOAMData50EB0,
	interactionOAMData518F7,
	interactionOAMData51908,
];
immutable interaction8EOAMDataPointers = [
	interactionOAMData514A6,
	interactionOAMData514B7,
	interactionOAMData514C8,
	interactionOAMData514D9,
	interactionOAMData514EA,
	interactionOAMData514FB,
	interactionOAMData5150C,
	interactionOAMData5151D,
];
immutable interaction92OAMDataPointers = [
	interactionOAMData5020E,
	interactionOAMData502F8,
	interactionOAMData5037F,
	interactionOAMData503B5,
	interactionOAMData503F4,
	interactionOAMData5009A,
	interactionOAMData5009A,
	interactionOAMData500A9,
	interactionOAMData500AE,
	interactionOAMData500B3,
];
immutable interaction93OAMDataPointers = [
	interactionOAMData5161C,
	interactionOAMData5162D,
	interactionOAMData515D8,
	interactionOAMData515E9,
	interactionOAMData515FA,
	interactionOAMData5160B,
	interactionOAMData515B6,
	interactionOAMData515C7,
];
immutable interaction94OAMDataPointers = [
	interactionOAMData502F8,
	interactionOAMData50325,
	interactionOAMData50388,
	interactionOAMData503D0,
	interactionOAMData5020E,
	interactionOAMData502A7,
	interactionOAMData5037F,
	interactionOAMData503B5,
	interactionOAMData503F4,
	interactionOAMData50433,
	interactionOAMData505B6,
	interactionOAMData50F0B,
	interactionOAMData50F18,
	interactionOAMData502E6,
	interactionOAMData505BF,
	interactionOAMData50205,
	interactionOAMData5009A,
	interactionOAMData500A9,
];
immutable interaction98OAMDataPointers = [
	interactionOAMData50982,
	interactionOAMData5098F,
	interactionOAMData51583,
	interactionOAMData51594,
];
immutable interaction9AOAMDataPointers = [
	interactionOAMData502F8,
	interactionOAMData50325,
	interactionOAMData50388,
	interactionOAMData503D0,
	interactionOAMData5020E,
	interactionOAMData502A7,
	interactionOAMData5037F,
	interactionOAMData503B5,
	interactionOAMData503F4,
	interactionOAMData5040F,
	interactionOAMData50445,
	interactionOAMData507EF,
];
immutable interaction9COAMDataPointers = [
	interactionOAMData52B72,
	interactionOAMData52BA7,
	interactionOAMData52BDC,
	interactionOAMData5020E,
];
immutable interaction9FOAMDataPointers = [
	interactionOAMData50205,
	interactionOAMData502B9,
	interactionOAMData51220,
	interactionOAMData51ED9,
	interactionOAMData50067,
];
immutable interactionA1OAMDataPointers = [
	interactionOAMData5152E,
	interactionOAMData51EA7,
	interactionOAMData51EC0,
	interactionOAMData52AD7,
	interactionOAMData5020E,
];
immutable interactionA2OAMDataPointers = [
	interactionOAMData5153F,
	interactionOAMData51550,
	interactionOAMData51561,
	interactionOAMData51572,
];
immutable interactionA6OAMDataPointers = [
	interactionOAMData519C3,
];
immutable interactionA7OAMDataPointers = [
	interactionOAMData51E2A,
	interactionOAMData51E43,
	interactionOAMData50809,
	interactionOAMData507BB,
	interactionOAMData507C8,
	interactionOAMData507C8,
	interactionOAMData5042A,
	interactionOAMData5042A,
	interactionOAMData503B5,
	interactionOAMData503D0,
];
immutable interactionA9OAMDataPointers = [
	interactionOAMData50A52,
	interactionOAMData50A5F,
	interactionOAMData51341,
	interactionOAMData50A6C,
	interactionOAMData50A79,
];
immutable interactionAAOAMDataPointers = [
	interactionOAMData5072C,
	interactionOAMData50739,
	interactionOAMData50746,
	interactionOAMData50753,
	interactionOAMData50760,
	interactionOAMData5076D,
	interactionOAMData5077A,
	interactionOAMData50787,
	interactionOAMData50794,
	interactionOAMData507A1,
	interactionOAMData507AE,
	interactionOAMData51A7E,
	interactionOAMData51A8F,
	interactionOAMData51AA0,
	interactionOAMData51AB1,
];
immutable interactionABOAMDataPointers = [
	interactionOAMData50418,
	interactionOAMData505C8,
	interactionOAMData50F25,
	interactionOAMData50F32,
	interactionOAMData50F3F,
	interactionOAMData50F4C,
	interactionOAMData50F59,
	interactionOAMData50F66,
];
immutable interactionADOAMDataPointers = [
	interactionOAMData50898,
	interactionOAMData508A5,
	interactionOAMData508B2,
	interactionOAMData508BF,
	interactionOAMData508CC,
	interactionOAMData508D9,
	interactionOAMData508E6,
	interactionOAMData508F3,
	interactionOAMData50900,
	interactionOAMData5090D,
	interactionOAMData5091A,
	interactionOAMData50927,
	interactionOAMData50934,
	interactionOAMData50941,
];
immutable interactionAEOAMDataPointers = [
	interactionOAMData52138,
	interactionOAMData52892,
	interactionOAMData52528,
	interactionOAMData528BB,
	interactionOAMData528E4,
	interactionOAMData52549,
	interactionOAMData5256A,
	interactionOAMData5290D,
	interactionOAMData5258B,
	interactionOAMData52963,
	interactionOAMData52990,
	interactionOAMData51F24,
	interactionOAMData525AC,
	interactionOAMData51EF2,
	interactionOAMData52B3D,
	interactionOAMData51F4D,
	interactionOAMData527FE,
	interactionOAMData51F0B,
	interactionOAMData52D2E,
	interactionOAMData51D1A,
	interactionOAMData51D2F,
	interactionOAMData525CD,
	interactionOAMData529BD,
	interactionOAMData529EA,
	interactionOAMData51F76,
	interactionOAMData51F8F,
];
immutable interactionB0OAMDataPointers = [
	interactionOAMData51352,
	interactionOAMData51363,
	interactionOAMData51374,
	interactionOAMData51385,
];
immutable interactionB4OAMDataPointers = [
	interactionOAMData5020E,
	interactionOAMData502F8,
];
immutable interactionB7OAMDataPointers = [
	interactionOAMData5044E,
	interactionOAMData50457,
	interactionOAMData500EF,
	interactionOAMData500F4,
	interactionOAMData500F9,
	interactionOAMData500FE,
	interactionOAMData50067,
];
immutable interactionB8OAMDataPointers = [
	interactionOAMData50ABA,
	interactionOAMData50AC7,
	interactionOAMData50AD4,
];
immutable interactionB9OAMDataPointers = [
	interactionOAMData50388,
	interactionOAMData503D0,
	interactionOAMData5020E,
	interactionOAMData503B5,
	interactionOAMData502F8,
	interactionOAMData5020E,
	interactionOAMData5037F,
	interactionOAMData503B5,
	interactionOAMData502F8,
	interactionOAMData50388,
	interactionOAMData502A7,
	interactionOAMData502D4,
	interactionOAMData50388,
	interactionOAMData50325,
	interactionOAMData502A7,
	interactionOAMData50325,
	interactionOAMData5020E,
	interactionOAMData5020E,
	interactionOAMData502F8,
	interactionOAMData5037F,
	interactionOAMData5037F,
	interactionOAMData503B5,
];
immutable interactionBCOAMDataPointers = [
	interactionOAMData51B28,
	interactionOAMData51B39,
	interactionOAMData51B4A,
	interactionOAMData51B5B,
	interactionOAMData51B6C,
	interactionOAMData51B7D,
	interactionOAMData51B8E,
	interactionOAMData51B9F,
	interactionOAMData52159,
	interactionOAMData52176,
];
immutable interactionC0OAMDataPointers = [
	interactionOAMData502A7,
	interactionOAMData5020E,
	interactionOAMData5020E,
	interactionOAMData502A7,
];
immutable interactionC1OAMDataPointers = [
	interactionOAMData500B8,
	interactionOAMData500AE,
	interactionOAMData500A9,
	interactionOAMData5009A,
];
immutable interactionC2OAMDataPointers = [
	interactionOAMData51AE4,
	interactionOAMData51AF5,
	interactionOAMData52070,
	interactionOAMData52089,
	interactionOAMData51B06,
	interactionOAMData51B17,
	interactionOAMData520A2,
	interactionOAMData520BB,
];
immutable interactionC3OAMDataPointers = [
	interactionOAMData51D83,
	interactionOAMData51D98,
];
immutable interactionC4OAMDataPointers = [
	interactionOAMData50FA7,
	interactionOAMData50FB4,
	interactionOAMData50FC1,
	interactionOAMData50FCE,
	interactionOAMData50FDB,
	interactionOAMData50FE8,
	interactionOAMData50FF5,
	interactionOAMData51002,
];
immutable interaction5FOAMDataPointers = [
	interactionOAMData519D4,
	interactionOAMData519E5,
	interactionOAMData519F6,
];
immutable interactionBAOAMDataPointers = [
	interactionOAMData525EE,
	interactionOAMData5260F,
];
immutable interactionC9OAMDataPointers = [
	interactionOAMData5020E,
	interactionOAMData502F8,
	interactionOAMData502A7,
	interactionOAMData50325,
];
immutable interactionCBOAMDataPointers = [
	interactionOAMData5020E,
	interactionOAMData502F8,
];
immutable interactionCDOAMDataPointers = [
	interactionOAMData50F73,
	interactionOAMData50F80,
];
immutable interactionCEOAMDataPointers = [
	interactionOAMData50067,
	interactionOAMData5020E,
	interactionOAMData502A7,
	interactionOAMData502F8,
	interactionOAMData50325,
	interactionOAMData503EB,
	interactionOAMData5020E,
];
immutable interactionCFOAMDataPointers = [
	interactionOAMData507BB,
	interactionOAMData507C8,
	interactionOAMData507FC,
];
immutable interactionD2OAMDataPointers = [
	interactionOAMData50816,
	interactionOAMData50823,
	interactionOAMData52A1B,
	interactionOAMData52A48,
];
immutable interactionD3OAMDataPointers = [
	interactionOAMData50103,
	interactionOAMData50108,
	interactionOAMData5010D,
	interactionOAMData50112,
	interactionOAMData50117,
	interactionOAMData5011C,
];
immutable interactionD4OAMDataPointers = [
	interactionOAMData52193,
	interactionOAMData5009A,
	interactionOAMData52630,
];
immutable interactionD5OAMDataPointers = [
	interactionOAMData5203E,
	interactionOAMData52057,
];
immutable interactionD6OAMDataPointers = [
	interactionOAMData505D1,
	interactionOAMData51A07,
	interactionOAMData51A18,
	interactionOAMData51A29,
	interactionOAMData51A3A,
	interactionOAMData51A4B,
	interactionOAMData526F6,
	interactionOAMData51A5C,
	interactionOAMData51A6D,
];
immutable interactionDFOAMDataPointers = [
	interactionOAMData50AE1,
	interactionOAMData50AEE,
	interactionOAMData50AFB,
	interactionOAMData50B08,
	interactionOAMData50A1E,
	interactionOAMData50A2B,
	interactionOAMData509EA,
	interactionOAMData509F7,
];
immutable interactionDDOAMDataPointers = [
	interactionOAMData5009A,
	interactionOAMData502B9,
	interactionOAMData50F8D,
	interactionOAMData5193B,
	interactionOAMData50F9A,
	interactionOAMData5194C,
	interactionOAMData52651,
	interactionOAMData52672,
	interactionOAMData52693,
	interactionOAMData526B4,
	interactionOAMData52DA4,
	interactionOAMData52DE5,
	interactionOAMData52E26,
	interactionOAMData52E67,
	interactionOAMData50067,
	interactionOAMData502E6,
	interactionOAMData50205,
	interactionOAMData500B3,
];
immutable interactionE6OAMDataPointers = [
	interactionOAMData50205,
	interactionOAMData502B9,
	interactionOAMData502E6,
	interactionOAMData505BF,
];
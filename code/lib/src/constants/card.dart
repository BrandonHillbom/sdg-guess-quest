import 'package:sdg_guess_quest/src/constants/image_strings.dart';

class SDGExplanation {
  final String title;
  final String details;

  SDGExplanation({
    required this.title,
    required this.details,
  });
}

class SDGCard {
  final String imageUrl;
  final String name;
  final String description;
  List<SDGExplanation>? appliedSDGs;

  SDGCard({
    required this.imageUrl,
    required this.name,
    required this.description,
    this.appliedSDGs,
  });
}

SDGExplanation s1 = SDGExplanation(title: '1', details: '1');
SDGExplanation s2 = SDGExplanation(title: '1', details: '1');
SDGExplanation s3 = SDGExplanation(title: '1', details: '1');
SDGExplanation s4 = SDGExplanation(title: '1', details: '1');
SDGExplanation s5 = SDGExplanation(title: '1', details: '1');
SDGExplanation s6 = SDGExplanation(title: '1', details: '1');
SDGExplanation s7 = SDGExplanation(title: '1', details: '1');
SDGExplanation s8 = SDGExplanation(title: '1', details: '1');
SDGExplanation s9 = SDGExplanation(title: '1', details: '1');
SDGExplanation s10 = SDGExplanation(title: '1', details: '1');
SDGExplanation s11 = SDGExplanation(title: '1', details: '1');
SDGExplanation s12 = SDGExplanation(title: '1', details: '1');
SDGExplanation s13 = SDGExplanation(title: '1', details: '1');
SDGExplanation s14 = SDGExplanation(title: '1', details: '1');
SDGExplanation s15 = SDGExplanation(title: '1', details: '1');
SDGExplanation s16 = SDGExplanation(title: '1', details: '1');
SDGExplanation s17 = SDGExplanation(title: '1', details: '1');

List<SDGCard> allSDGCards = [
  SDGCard(
    imageUrl: sdgCafeteria,
    name: 'Eco Eater',
    description: 'x is dishing up some nutritious food from the cafeteria.',
    appliedSDGs: [s1, s2, s3],
  ),
  SDGCard(
    imageUrl: sdgWaterPlant,
    name: 'Aqua Builder',
    description: 'x is dishing up some nutritious food from the cafeteria.',
    appliedSDGs: [s1, s6, s8, s9],
  ),
  SDGCard(
    imageUrl: sdgWashingHands,
    name: 'Hygiene',
    description: 'x is dishing up some nutritious food from the cafeteria.',
    appliedSDGs: [s1, s6],
  ),
  SDGCard(
    imageUrl: sdgHouse,
    name: 'Ford Abel',
    description: 'x is dishing up some nutritious food from the cafeteria.',
    appliedSDGs: [s1, s11],
  ),
  SDGCard(
    imageUrl: sdgSkyscraper,
    name: 'Sky Designer',
    description: 'x is dishing up some nutritious food from the cafeteria.',
    appliedSDGs: [s2, s8],
  ),
  SDGCard(
    imageUrl: sdgSharingFood,
    name: 'Nourish Us',
    description: 'x is dishing up some nutritious food from the cafeteria.',
    appliedSDGs: [s2, s17],
  ),
  SDGCard(
    imageUrl: sdgTreadmill,
    name: 'Motion',
    description: 'x is dishing up some nutritious food from the cafeteria.',
    appliedSDGs: [s3, s7],
  ),
  SDGCard(
    imageUrl: sdgBike,
    name: 'Recycle Biker',
    description: 'x is dishing up some nutritious food from the cafeteria.',
    appliedSDGs: [s3, s11, s12],
  ),
  SDGCard(
    imageUrl: sdgFlood,
    name: 'Floody Mary',
    description: 'x is dishing up some nutritious food from the cafeteria.',
    appliedSDGs: [s3, s13, s14, s15],
  ),
  SDGCard(
    imageUrl: sdgSolar,
    name: 'Electro-sun',
    description: 'x is dishing up some nutritious food from the cafeteria.',
    appliedSDGs: [s4, s5, s7],
  ),
  SDGCard(
    imageUrl: sdgClassroom,
    name: 'Education Al',
    description: 'x is dishing up some nutritious food from the cafeteria.',
    appliedSDGs: [s4, s10, s17],
  ),
  SDGCard(
    imageUrl: sdgHospital,
    name: 'Medi-care',
    description: 'x is dishing up some nutritious food from the cafeteria.',
    appliedSDGs: [s4, s10],
  ),
  SDGCard(
    imageUrl: sdgScience,
    name: 'Sci-guys',
    description: 'x is dishing up some nutritious food from the cafeteria.',
    appliedSDGs: [s5, s8, s9],
  ),
  SDGCard(
    imageUrl: sdgWindTurbine,
    name: 'Winergy',
    description: 'x is dishing up some nutritious food from the cafeteria.',
    appliedSDGs: [s7, s11],
  ),
  SDGCard(
    imageUrl: sdgRoboticLegs,
    name: 'Robotify',
    description: 'x is dishing up some nutritious food from the cafeteria.',
    appliedSDGs: [s9, s10],
  ),
  SDGCard(
    imageUrl: sdgWheelchairs,
    name: 'Equality',
    description: 'x is dishing up some nutritious food from the cafeteria.',
    appliedSDGs: [s10, s17],
  ),
  SDGCard(
    imageUrl: sdgProtest,
    name: 'Unity',
    description: 'x is dishing up some nutritious food from the cafeteria.',
    appliedSDGs: [s12, s13, s17],
  ),
  SDGCard(
    imageUrl: sdgPlantingTree,
    name: 'Mr. Beast',
    description: 'x is dishing up some nutritious food from the cafeteria.',
    appliedSDGs: [s13, s15, s17],
  ),
  // SDGCard(
  //   imageUrl: sdgLandWater,
  //   name: 'Aqua-Land',
  //   description: 'x is dishing up some nutritious food from the cafeteria.',
  //   appliedSDGs: [s14, s15, s17],
  // ),
  SDGCard(
    imageUrl: sdgUnderwaterJudge,
    name: "Just O'Shawn",
    description: 'x is dishing up some nutritious food from the cafeteria.',
    appliedSDGs: [s14, s16],
  ),
  SDGCard(
    imageUrl: sdgReligiousTeamwork,
    name: 'Faith',
    description: 'x is dishing up some nutritious food from the cafeteria.',
    appliedSDGs: [s16, s17],
  ),
];

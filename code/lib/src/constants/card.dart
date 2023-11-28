import 'package:sdg_guess_quest/src/constants/image_strings.dart';

class SDGCard {
  final String imageUrl;
  final String name;
  final String description;
  List<int> appliedSDGs;

  SDGCard({
    required this.imageUrl,
    required this.name,
    required this.description,
    required this.appliedSDGs,
  });
}

List<SDGCard> allSDGCards = [
  SDGCard(
    imageUrl: sdgCafeteria,
    name: 'Eco Eater',
    description:
        'During her lunch break, Betty spends a few dollars on a nutritious meal! Unlike Betty, many people struggle to earn enough money for food or their well-being.',
    appliedSDGs: [1, 2, 3],
  ),
  SDGCard(
    imageUrl: sdgWaterPlant,
    name: 'Aqua Builder',
    description:
        'Michael is enjoying a refreshing cup of water during a break from working at a new water treatment plant! Notice how his cup is reusable? At the plant, they turn low quality water into high wauality water. Many people do not have the access to clean drinking water and must risk disease from bad water.',
    appliedSDGs: [1, 6, 8, 9],
  ),
  SDGCard(
    imageUrl: sdgWashingHands,
    name: 'Hygiene',
    description:
        'Eugene is making sure to stay clean! He washes his hands regularly in the house he bought last month!',
    appliedSDGs: [1, 6],
  ),
  SDGCard(
    imageUrl: sdgHouse,
    name: 'Minnie House',
    description:
        'Minnie has just bought her first house. Do you like it? It is in a great neighborhood too! Unlike Minnie, there are many people who do not have the money to buy houses since they are so expensive',
    appliedSDGs: [1, 11],
  ),
  SDGCard(
    imageUrl: sdgSkyscraper,
    name: 'Sky Designer',
    description:
        'Dennis is enjoying his lunch that was given to him by the company he works for. They have been busy building a skyscraper!',
    appliedSDGs: [2, 8],
  ),
  // SDGCard(
  //   imageUrl: sdgSharingFood,
  //   name: 'Nourish Us',
  //   description:
  //       'Alex is doing his part by helping someone in need of a meal. They sit and talk about ideas to end homelessness in their community.',
  //   appliedSDGs: [2, 17],
  // ),
  SDGCard(
    imageUrl: sdgTreadmill,
    name: 'Motion',
    description:
        'The future is here! Big Larry is staying fit by walking on a treadmill that powers the light around him!',
    appliedSDGs: [3, 7],
  ),
  SDGCard(
    imageUrl: sdgBike,
    name: 'Recycle Biker',
    description:
        'Leonard is the sustainability man! He bikes around his neighborhood picking up peices of garbage and recyling.',
    appliedSDGs: [3, 11, 12],
  ),
  SDGCard(
    imageUrl: sdgFlood,
    name: 'Floody Mary',
    description:
        'Uh oh! Climate change has caused the sea to rise. Many sea and land animals are displaced as the damage rolls in.',
    appliedSDGs: [3, 13, 14, 15],
  ),
  SDGCard(
    imageUrl: sdgSolar,
    name: 'Electro-sun',
    description:
        'Guess what Jackie just learned on the class field trip? We can turn the energy from the sun into electricity that we can use! Students that are not able to get a good education would not know this.',
    appliedSDGs: [4, 5, 7],
  ),
  SDGCard(
    imageUrl: sdgClassroom,
    name: 'Education Al',
    description:
        'Last year, pandas were not allowed in the classroom because they are too big but now they are allowed. Bigger desks were bought to make it easier for Joel to learn!',
    appliedSDGs: [4, 10, 17],
  ),
  SDGCard(
    imageUrl: sdgHospital,
    name: 'Medi-care',
    description:
        'A doctor and a nurse talk about what solutions there might be to a problem their patient is facing. In some places, people go bankrupt paying for the medical caare they need.',
    appliedSDGs: [3, 10, 11],
  ),
  SDGCard(
    imageUrl: sdgScience,
    name: 'Sci-guys',
    description:
        'Just a couple of scientists changing the world one experiment at a time! In some countries, women are not allowed to become scientists or even read! We must push for a better future for all!',
    appliedSDGs: [5, 8, 9],
  ),
  SDGCard(
    imageUrl: sdgWindTurbine,
    name: 'Winergy',
    description:
        'Barry poses for a picture in front of a row of wind turbines. Communtiies living off of clean energy has never felt so good!',
    appliedSDGs: [7, 11],
  ),
  SDGCard(
    imageUrl: sdgRoboticLegs,
    name: 'Robotify',
    description:
        'Arnold and Jenna were in an accident that left them without legs. Now, they are going for a walk with brand new robotic legs that were built by engineers!',
    appliedSDGs: [9, 10],
  ),
  // SDGCard(
  //   imageUrl: sdgWheelchairs,
  //   name: 'Equality',
  //   description:
  //       'Barney spent a day in a wheelchair to better understand the problems of his friend, Carl. Afterwards, he promised Carl that he would build a ramp to his house so Carl can visit.',
  //   appliedSDGs: [10, 17],
  // ),
  // SDGCard(
  //   imageUrl: sdgProtest,
  //   name: 'Unity',
  //   description:
  //       "Someone didn't get the memo! Eddy stands among climate protestors while drinking out of a single use plastic. Small changes and united voices can push governments to make big changes.",
  //   appliedSDGs: [12, 13, 17],
  // ),
  SDGCard(
    imageUrl: sdgPlantingTree,
    name: 'Mr. Beast',
    description:
        'Be like our good pal, Mr.Beast and plant a tree to help our enviornment. Doing this with other people can ignite a passion in your community!',
    appliedSDGs: [13, 15, 17],
  ),
  SDGCard(
    imageUrl: sdgReligiousTeamwork,
    name: 'Faith',
    description:
        'Sandra helps her friend, Kelly with a task at school. They may have different religions, but they are the same within.',
    appliedSDGs: [16, 17],
  ),
];

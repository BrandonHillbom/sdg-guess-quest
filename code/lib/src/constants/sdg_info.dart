class SDGInfo {
  final int number;
  final String title;
  final String description;
  final List<String> actionableSteps;

  const SDGInfo(
      {required this.number,
      required this.title,
      required this.description,
      required this.actionableSteps});
}

const List<SDGInfo> sdgInformation = [
  SDGInfo(
    number: 1,
    title: "No Poverty",
    description:
        "Goal 1 is about making sure everyone has enough money to have a decent life, with food, a home, and education.", //grade 8 reading level
    actionableSteps: [
      "Donate old clothes, toys, or books to those who need them", //grade 5 reading level
      "Share your lunch or snacks with a friend who may not have as much",
      "Learn about what poverty looks like in your community. Talk with others about how you can help!",
    ],
  ),
  SDGInfo(
    number: 2,
    title: "Zero Hunger",
    description:
        "Goal 2 is about making sure all people have enough healthy food to eat so that no one is hungry.", //reading level is grade 4
    actionableSteps: [
      "Grow a small garden or plant herbs in your kitchen",
      "Ask your family to buy food from local farmers or markets",
      "Only take the amount of food you can eat to reduce waste",
    ],
  ),
  SDGInfo(
    number: 3,
    title: "Good Health and Well-being",
    description:
        "Goal 3 is about staying healthy and having access to doctors and medicine when needed.", //grade 7 reading level
    actionableSteps: [
      "Play outside, ride your bike, or join a sports team.",
      "Choose fruits and veggies for snacks, and limit sugary drinks.",
      "Follow safety rules, like wearing a helmet when biking.",
    ],
  ),
  SDGInfo(
    number: 4,
    title: "Quality Education",
    description:
        "Goal 4 is about making sure all children have the chance to go to school and learn important.", //grade 7
    actionableSteps: [
      "Spend time reading books or articles to learn new things",
      "If a classmate needs help with their school work, offer your help if you are able",
      "Ask questions and find new topics to keep learning exciting",
    ],
  ),
  SDGInfo(
    number: 5,
    title: "Gender Equality",
    description:
        "Goal 5 is about treating boys and girls the same. We should give everyone equal opportunities and rights.", //grade 6
    actionableSteps: [
      "Speak out if you see someone treated unfair based on their gender", //grade 7
      "Support your friends and their interests. Ignore gender stereotypes",
      "Be a good friend by including others in your games and activities",
    ],
  ),
  SDGInfo(
    number: 6,
    title: "Clean Water and Sanitation",
    description:
        "Goal 6 is about making sure everyone has access to clean/safe water and proper toilets.", //grade 7
    actionableSteps: [
      "Turn off the tap when brushing your teeth or taking short showers",
      "Learn where your water comes from and how to use it wisely",
      "Avoid polluting rivers and lakes by not throwing trash into them",
    ],
  ),
  SDGInfo(
    number: 7,
    title: "Affordable and Clean Energy",
    description:
        "Goal 7 is about using clean and renewable energy sources like the sun and wind. This can power our homes and gadgets.", //grade 4
    actionableSteps: [
      "Remember to turn off lights and electronic devices when you're not using them", //grade 8
      "Use natural light when possible and unplug chargers when not in use",
      "Learn how solar panels work and why they are good for the environment",
    ],
  ),
  SDGInfo(
    number: 8,
    title: "Decent Work and Economic Growth",
    description:
        "Goal 8 is about making sure everyone has a job that pays well and helps the economy grow.", //grade 2
    actionableSteps: [
      "Explore your interests and learn new skills to prepare for future jobs", //grade 7
      "Buy things from local shops in your community",
      "Do your chores and homework to understand the value of hard work",
    ],
  ),
  SDGInfo(
    number: 9,
    title: "Industry, Innovation, and Infrastructure",
    description:
        "Goal 9 is about creating ways to transport goods, communicate, and create things.", //grade 9
    actionableSteps: [
      "Learn about new technologies and how they make life better", //grade 9
      "Try creating something using recycled materials",
      "Talk to friends and family about cool inventions or ideas",
    ],
  ),
  SDGInfo(
    number: 10,
    title: "Reduced Inequalities",
    description:
        "Goal 10 is about making sure everyone is treated fairly, no matter where they are from or who they are.", //grade 8
    actionableSteps: [
      "Include everyone in your games and activities.", //g9
      "Speak out if you see someone being treated unfairly or bullied",
      "Learn about different cultures to understand and appreciate other people",
    ],
  ),
  SDGInfo(
    number: 11,
    title: "Sustainable Cities and Communities",
    description:
        "Goal 11 is about creating cities and communities that are safe, clean, and a good place to live.", //g7
    actionableSteps: [
      "Keep your community clean by joining neighborhood clean-up events", //g8
      "If possible, use buses or trains to reduce pollution from cars (if your city has these)",
      "Trees make cities greener and help the environment. Consider planting one in your community",
    ],
  ),
  SDGInfo(
    number: 12,
    title: "Responsible Consumption and Production",
    description:
        "Goal 12 is about using things wisely. Try to not waste food, clothes, or other items.", //g7
    actionableSteps: [
      "Use both sides of paper, recycle, and avoid single-use plastics", //g7
      "Choose products with less packaging and support companies that care about the environment",
      "If you see trash, pick it up and throw it in the trash",
    ],
  ),
  SDGInfo(
    number: 13,
    title: "Climate Action",
    description:
        "Goal 13 aims to prevent climate change. This is done by using clean energy, safeguarding forests, and reducing pollution.", //g8
    actionableSteps: [
      "Turn off lights and electronics when not in use to reduce energy consumption", //g6
      "Plant trees! Trees absorb carbon dioxide, helping to fight climate change",
      "Learn how climate change affects the Earth and what we can do to help",
    ],
  ),
  SDGInfo(
    number: 14,
    title: "Life Below Water",
    description:
        "Goal 14 is about protecting life underwater, like fish and coral reefs.", //g6
    actionableSteps: [
      "Say no to single-use plastics to prevent them from ending up in the ocean", //g7
      "Use water wisely, even if you don't live near the ocean!",
      "Learn about organizations helping oceans and consider supporting them",
    ],
  ),
  SDGInfo(
    number: 15,
    title: "Life on Land",
    description:
        "Goal 15 is about taking care of the land, forests, and animals.", //g4
    actionableSteps: [
      "Trees provide oxygen and homes for animals. Plant one", //g4
      "Paper comes from trees, so recycling it helps save forests",
      "Learn about animals in your area and how to help protect their homes",
    ],
  ),
  SDGInfo(
    number: 16,
    title: "Peace, Justice, and Strong Institutions",
    description:
        "Goal 16 is about making sure everyone is treated fairly. There is peace in the world and there are good laws/organizations to keep people safe.", //g6
    actionableSteps: [
      "Treat others the way you want to be treated. Stand up against bullying!", //g6
      "Find out how laws protect people and why they are important",
      "Find peaceful solutions to conflicts. Encourage understanding among your friends too!",
    ],
  ),
  SDGInfo(
    number: 17,
    title: "Partnerships for the Goals",
    description:
        "Goal 17 is for people and countries to work together. They solve problems, such as poverty and pollution, by helping each other.", //g6
    actionableSteps: [
      "Work with your friends on projects or activities to achieve common goals", //g8
      "Help classmates or family members when they need it",
      "Learn and appreciate different cultures. This will foster global cooperation",
    ],
  ),
];

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sdg_guess_quest/src/constants/card.dart';
import 'package:sdg_guess_quest/src/constants/colors.dart';
import 'package:sdg_guess_quest/src/constants/image_strings.dart';
import 'package:sdg_guess_quest/src/constants/styles.dart';

class QuestionObject {
  String? question;
  bool? answer;
  String askedBy;

  QuestionObject({this.question, this.answer, required this.askedBy});
  // Method to update the object with new values
  void update({String? question, bool? answer, String? askedBy}) {
    this.question = question ?? this.question;
    this.answer = answer ?? this.answer;
    this.askedBy = askedBy ?? this.askedBy;
  }
}

class GameCard {
  SDGCard card;
  bool flipped;

  GameCard({
    required this.card,
    this.flipped = false,
  });
}

class GameScreen extends StatefulWidget {
  const GameScreen({Key? key}) : super(key: key);

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  GameCard? p1SelectedCard;
  GameCard? p2SelectedCard;

  List<QuestionObject> player1AskedQuestions = [];
  List<QuestionObject> player2AskedQuestions = [];

  String? turn = 'p1';
  String? winner;
  String? guessedCard;

  List<GameCard> p1Cards = [];
  List<GameCard> p2Cards = [];

  bool flipCards = false;
  bool guessCards = false;

  @override
  void initState() {
    super.initState();
    // Call the function to shuffle and distribute cards when the screen is initialized
    shuffleAndDistributeCards();
  }

  void shuffleAndDistributeCards() {
    // Shuffle the allSDGCards list and assign them to each player
    List<SDGCard> shuffledCards = List.from(allSDGCards)..shuffle();
    p1Cards = shuffledCards.map((card) => GameCard(card: card)).toList();
    shuffledCards = List.from(allSDGCards)..shuffle();
    p2Cards = shuffledCards.map((card) => GameCard(card: card)).toList();
  }

  @override
  Widget build(BuildContext context) {
    //2. add the button to ask a question, make sure no overflows in the buttons
    //3. add the question popover
    //4. handle turn switching
    // 5. handle the guess card state
    // handle on click for cards to view their details/learning
    return Scaffold(
      backgroundColor: primaryColor,
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Center(
              child: Text(
                'Cards Remaining',
                style: secondaryFontWhite,
              ),
            ),
            Expanded(
              flex: 1,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Player 1',
                        style: secondaryFontWhite,
                      ),
                      Text(
                          p1Cards
                              .where((card) => !card.flipped)
                              .length
                              .toString(),
                          style: primaryFontWhite),
                    ],
                  ),
                  const SizedBox(width: 20),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Player 2',
                        style: secondaryFontWhite,
                      ),
                      Text(
                          p2Cards
                              .where((card) => !card.flipped)
                              .length
                              .toString(),
                          style: primaryFontWhite),
                    ],
                  )
                ],
              ),
            ),
            Expanded(
              flex: 4,
              child: GridView.builder(
                  itemCount: 20,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 5),
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                      onTap: () {
                        if (turn == 'p1' && p1SelectedCard == null) {
                          setState(() {
                            p1SelectedCard = p1Cards[index];
                          });
                        } else if (turn == 'p2' && p2SelectedCard == null) {
                          setState(() {
                            p2SelectedCard = p2Cards[index];
                          });
                        } else if (flipCards == true) {
                          //find out which player is flipping, whose turn is it to ask a question?
                          //if its p1 turn to ask then p2 asked last and had their q as
                          if (turn == 'p1') {
                            setState(() {
                              p1Cards[index].flipped = !p1Cards[index].flipped;
                            });
                          } else if (turn == 'p2') {
                            setState(() {
                              p2Cards[index].flipped = !p2Cards[index].flipped;
                            });
                          }
                          // setState(() {
                          //
                          // });
                        } else {
                          //info popover
                        }
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          border: Border.all(width: 3, color: primaryColor),
                          color: secondaryColor,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: !p1Cards[index].flipped
                              ? [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(7.5),
                                    child: Image.asset(
                                      p1Cards[index].card.imageUrl,
                                      fit: BoxFit.contain,
                                    ),
                                  ),

                                  //SizedBox(height: 2), // Adjust the height as needed
                                  // Text(
                                  //   p1Cards[index].card.name,
                                  //   style: TextStyle(
                                  //     color: Colors.white, // Customize the text color
                                  //     fontSize: 8, // Customize the font size
                                  //   ),
                                  //),
                                ]
                              : [],
                        ),
                      ),
                    );
                  }),
            ),
            Expanded(
              flex: 2,
              child: (turn == 'p1' && p1SelectedCard == null) ||
                      (turn == 'p2' && p2SelectedCard == null)
                  ? Column(children: [
                      Container(
                        margin: const EdgeInsets.only(bottom: 16.0),
                        child: Text(
                          'Select one of the cards above that your opponent will try to guess.',
                          style: secondaryFontWhite,
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ])
                  : Column(children: [
                      Container(
                        margin: const EdgeInsets.only(bottom: 16.0),
                        child: Text(
                          'The card your opponent will guess:',
                          style: secondaryFontWhite,
                          textAlign: TextAlign.center,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          //view card info
                        },
                        child: Container(
                          width: 104,
                          height: 122,
                          padding: EdgeInsets.all(5),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            border: Border.all(width: 5, color: primaryColor),
                            color: secondaryColor,
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Align(
                                alignment: Alignment.topCenter,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(7.5),
                                  child: Image.asset(
                                    turn == 'p1' && p1SelectedCard != null
                                        ? p1SelectedCard?.card.imageUrl ??
                                            logoWithText
                                        : turn == 'p2' && p2SelectedCard != null
                                            ? p2SelectedCard?.card.imageUrl ??
                                                logoWithText
                                            : logoWithText,
                                  ),
                                ),
                              ),
                              Text(
                                turn == 'p1'
                                    ? p1SelectedCard?.card.name ?? 'Your card'
                                    : p2SelectedCard?.card.name ?? 'Your card',
                                style: TextStyle(
                                  color:
                                      Colors.white, // Customize the text color
                                  fontSize: 12, // Customize the font size
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ]),
            ),
            Expanded(
              flex: 1,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      if ((turn == 'p1' && p1SelectedCard != null) ||
                          (turn == 'p2' && p2SelectedCard != null)) {
                        setState(() {
                          flipCards = !flipCards; // Update the state variable
                        });
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor:
                          ((turn == 'p1' && p1SelectedCard != null) ||
                                  (turn == 'p2' && p2SelectedCard != null))
                              ? secondaryColor
                              : disabledColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      side: BorderSide.none,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20.0, vertical: 12.0), // Adjust padding
                    ),
                    child: Text(flipCards == true ? "Lock cards" : "Flip cards",
                        style: buttonFontWhite),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      // Handle guess character
                      //select and then click the card, the button displayed should be send Guess
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor:
                          ((turn == 'p1' && p1SelectedCard != null) ||
                                  (turn == 'p2' && p2SelectedCard != null))
                              ? secondaryColor
                              : disabledColor,
                      shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(10.0), // Rounded corners
                      ),
                      side: BorderSide.none,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20.0, vertical: 12.0), // Adjust padding
                    ),
                    child: Text('Guess character', style: buttonFontWhite),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CardTile extends StatefulWidget {
  const CardTile({Key? key}) : super(key: key);

  @override
  CardTileState createState() => CardTileState();
}

class CardTileState extends State<CardTile> {
  bool isFlipped = false;

  void flipCard() {
    setState(() {
      isFlipped = !isFlipped;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: flipCard,
      child: Container(
        width: 100, // Adjust card dimensions as needed
        height: 150,
        color:
            isFlipped ? Colors.black : Colors.blue, // Customize card appearance
        margin: const EdgeInsets.all(4),
        alignment: Alignment.center,
        child: isFlipped ? const Text('') : Image.asset('logoWithText.png'),
      ),
    );
  }
}

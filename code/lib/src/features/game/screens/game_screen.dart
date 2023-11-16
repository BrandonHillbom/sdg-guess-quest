import 'package:flutter/material.dart';
import 'package:sdg_guess_quest/src/constants/card.dart';
import 'package:sdg_guess_quest/src/constants/colors.dart';
import 'package:sdg_guess_quest/src/constants/image_strings.dart';
import 'package:sdg_guess_quest/src/constants/styles.dart';
import 'package:sdg_guess_quest/src/features/game/screens/hide_screen.dart';
import 'package:sdg_guess_quest/src/features/game/screens/question_popover.dart';
import 'package:sdg_guess_quest/src/features/game/screens/response_popover.dart';

class QuestionObject {
  String? question;
  bool? answer;
  bool? isGuess;

  QuestionObject({this.question, this.answer, required this.isGuess});
  // Method to update the object with new values
  void update({String? question, bool? answer, bool? isGuess}) {
    this.question = question ?? this.question;
    this.answer = answer ?? this.answer;
    this.isGuess = isGuess ?? this.isGuess;
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
  GameCard? guessedCard;

  List<GameCard> p1Cards = [];
  List<GameCard> p2Cards = [];

  bool isFlippingCard = false;
  bool isGuessingCard = false;

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

  void questionSubmitted(String newString) {
    if (turn == 'p1') {
      QuestionObject question =
          QuestionObject(isGuess: false, question: newString);
      setState(() {
        player1AskedQuestions.add(question);
      });
    } else if (turn == 'p2') {
      QuestionObject question =
          QuestionObject(isGuess: false, question: newString);
      setState(() {
        player2AskedQuestions.add(question);
      });
    }
    switchTurn();
  }

  void switchTurn() {
    String newTurn = turn == 'p1' ? 'p2' : 'p1';
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => HideScreen(
              playerTurn:
                  newTurn)), // Replace YourNewPage with the actual widget you want to push
    ).then((value) {
      setState(() {
        turn = newTurn;
      });
      if ((newTurn == 'p1' &&
              p1SelectedCard != null &&
              player2AskedQuestions.isNotEmpty &&
              player2AskedQuestions.last.answer == null) ||
          (newTurn == 'p2' &&
              p2SelectedCard != null &&
              player1AskedQuestions.isNotEmpty &&
              player1AskedQuestions.last.answer == null)) {
        WidgetsBinding.instance?.addPostFrameCallback((_) {
          // Show the popover after the frame is rendered
          showResponsePopover(context);
        });
      }
    });
  }

  void guessCard(GameCard guessedCard) {
    if (turn == 'p1' && p2SelectedCard != null) {
      if (guessedCard.card.name == p2SelectedCard?.card.name) {
        QuestionObject question = QuestionObject(
            isGuess: true,
            question: 'Is your card ${guessedCard.card.name}?',
            answer: true);
        setState(() {
          player1AskedQuestions.add(question);
          winner = 'p1';
          isGuessingCard = false;
        });
      } else {
        QuestionObject question = QuestionObject(
            isGuess: true,
            question: 'Is your card ${guessedCard.card.name}?',
            answer: false);
        setState(() {
          player1AskedQuestions.add(question);
          isGuessingCard = false;
        });
        switchTurn();
      }
    } else if (turn == 'p2' && p1SelectedCard != null) {
      if (guessedCard.card.name == p1SelectedCard?.card.name) {
        QuestionObject question = QuestionObject(
            isGuess: true,
            question: 'Is your card ${guessedCard.card.name}?',
            answer: true);
        setState(() {
          player2AskedQuestions.add(question);
          winner = 'p2';
          isGuessingCard = false;
        });
      } else {
        QuestionObject question = QuestionObject(
            isGuess: true,
            question: 'Is your card ${guessedCard.card.name}?',
            answer: false);
        setState(() {
          player2AskedQuestions.add(question);
          isGuessingCard = false;
        });
        switchTurn();
      }
    }
  }

  void showResponsePopover(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return ResponsePopoverWidget(
          message: turn == 'p1'
              ? 'Does your card ${player2AskedQuestions.last.question}'
              : 'Does your card ${player1AskedQuestions.last.question}',
          onButtonPressed: (buttonText) {
            // Handle the button press here
            if (buttonText == 'yes') {
              if (turn == 'p1') {
                setState(() {
                  player2AskedQuestions.last.answer = true;
                });
              } else if (turn == 'p2') {
                setState(() {
                  player1AskedQuestions.last.answer = true;
                });
              }
            } else if (buttonText == 'no') {
              if (turn == 'p1') {
                setState(() {
                  player2AskedQuestions.last.answer = false;
                });
              } else if (turn == 'p2') {
                setState(() {
                  player1AskedQuestions.last.answer = false;
                });
              }
            }
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    // 1.fix bug where p2 doesnt answer p1 question in round 1
    // 2. Move into code folder

    // 3. see past questions and answers
    // 4. fix: take out the questionmark if it is at the end and if it isnt then add it

    // 5. handle on click for cards to view their details/learning
    // 6. add highlight for selecting a guess card or flipping them over
    // 7. fix: spacing of ask question button padding

    return Scaffold(
      backgroundColor: primaryColor,
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Expanded(
              flex: 2,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    flex: 3,
                    child: Column(
                      children: [
                        Center(
                          child: Text(
                            'Cards Remaining',
                            style: secondaryFontWhite,
                          ),
                        ),
                        Row(
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
                        )
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Row(
                      children: [
                        IconButton(
                          onPressed: () {
                            // Handle the button press to view past questions
                            // ...
                          },
                          icon: Icon(
                            Icons.history, // Replace with the desired icon
                            color: Colors.white, // Adjust the color as needed
                            size: 24.0, // Adjust the size as needed
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            // Handle the button press to view past questions
                            // ...
                            Navigator.pop(context);
                          },
                          icon: Icon(
                            Icons.exit_to_app, // Replace with the desired icon
                            color: Colors.white, // Adjust the color as needed
                            size: 24.0, // Adjust the size as needed
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 7,
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
                        } else if (isFlippingCard == true) {
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
                        } else if (isGuessingCard == true) {
                          //handle the guessed card
                          guessCard(p1Cards[index]);
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
                          children: (turn == 'p1' && !p1Cards[index].flipped) ||
                                  (turn == 'p2' && !p2Cards[index].flipped)
                              ? [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(7.5),
                                    child: Image.asset(
                                      turn == 'p1'
                                          ? p1Cards[index].card.imageUrl
                                          : p2Cards[index].card.imageUrl,
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
              flex: 4,
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
                          (turn == 'p1' &&
                                      (p1SelectedCard == null ||
                                          player1AskedQuestions.isEmpty)) ||
                                  (turn == 'p2' &&
                                      (p2SelectedCard == null ||
                                          player2AskedQuestions.isEmpty))
                              ? 'The card your opponent will guess:'
                              : turn == 'p1'
                                  ? 'You asked: ${player1AskedQuestions.last.isGuess == true ? '' : 'Does your card'}${player1AskedQuestions.last.question}? ${player1AskedQuestions.last.answer == true ? 'Yes' : 'No'}'
                                  : 'You asked: ${player2AskedQuestions.last.isGuess == true ? '' : 'Does your card'}${player2AskedQuestions.last.question}? ${player1AskedQuestions.last.answer == true ? 'Yes' : 'No'}',
                          style: (turn == 'p1' &&
                                      (p1SelectedCard == null ||
                                          player1AskedQuestions.isEmpty)) ||
                                  (turn == 'p2' &&
                                      (p2SelectedCard == null ||
                                          player2AskedQuestions.isEmpty))
                              ? secondaryFontWhite
                              : smallFontWhite,
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
              flex: 2,
              child: winner != 'p1' || winner != 'p2'
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Column(
                            children: [
                              ElevatedButton(
                                onPressed: () {
                                  if (p1SelectedCard != null &&
                                      p2SelectedCard != null &&
                                      !isGuessingCard) {
                                    setState(() {
                                      isFlippingCard =
                                          !isFlippingCard; // Update the state variable
                                    });
                                  }
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: (p1SelectedCard != null &&
                                          p2SelectedCard != null &&
                                          !isGuessingCard)
                                      ? secondaryColor
                                      : disabledColor,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  side: BorderSide.none, // Adjust padding
                                ),
                                child: Container(
                                  width: double
                                      .infinity, // Take up the entire width
                                  child: Center(
                                    child: Text(
                                      isFlippingCard
                                          ? "Lock cards"
                                          : "Flip cards",
                                      style: buttonFontWhite,
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                  height:
                                      10), // Adjust the space between buttons
                              ElevatedButton(
                                onPressed: () {
                                  //select and then click the card, the button displayed should be send Guess
                                  if (!isFlippingCard &&
                                      p1SelectedCard != null &&
                                      p2SelectedCard != null) {
                                    setState(() {
                                      isGuessingCard = !isGuessingCard;
                                    });
                                  }
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: (p1SelectedCard != null &&
                                          p2SelectedCard != null &&
                                          !isFlippingCard)
                                      ? secondaryColor
                                      : disabledColor,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(
                                        10.0), // Rounded corners
                                  ),
                                  side: BorderSide.none,
                                ),
                                child: Container(
                                  width: double
                                      .infinity, // Take up the entire width
                                  child: Center(
                                    child:
                                        Text('Guess', style: buttonFontWhite),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(width: 20), // Adjust the space between columns
                        Column(
                          children: [
                            ElevatedButton(
                              onPressed: () {
                                if (((turn == 'p1' && p1SelectedCard != null) ||
                                        (turn == 'p2' &&
                                            p2SelectedCard != null)) &&
                                    !isFlippingCard &&
                                    !isGuessingCard) {
                                  showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return QuestionPopoverWidget(
                                          onStringChanged: questionSubmitted);
                                    },
                                  );
                                }
                                // Handle the third button press
                              },
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: (((turn == 'p1' &&
                                                  p1SelectedCard != null) ||
                                              (turn == 'p2' &&
                                                  p2SelectedCard != null)) &&
                                          !isGuessingCard &&
                                          !isFlippingCard)
                                      ? secondaryColor
                                      : disabledColor, // Adjust the color for the third button
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  side: BorderSide.none,
                                  padding: EdgeInsets.symmetric(
                                      vertical: 5, horizontal: 10)),
                              child:
                                  Text('Ask Question', style: buttonFontWhite),
                            ),
                          ],
                        ),
                      ],
                    )
                  : Center(
                      child: Text('You Won!', style: primaryFontWhite),
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

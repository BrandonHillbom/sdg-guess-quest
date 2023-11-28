import 'package:flutter/material.dart';
import 'package:sdg_guess_quest/src/constants/card.dart';
import 'package:sdg_guess_quest/src/constants/colors.dart';
import 'package:sdg_guess_quest/src/constants/image_strings.dart';
import 'package:sdg_guess_quest/src/constants/styles.dart';
import 'package:sdg_guess_quest/src/features/game/screens/hide_screen.dart';
import 'package:sdg_guess_quest/src/features/game/screens/info_popover_widget.dart';
import 'package:sdg_guess_quest/src/features/game/screens/past_questions_drawer_widget.dart';
import 'package:sdg_guess_quest/src/features/game/screens/question_popover.dart';
import 'package:sdg_guess_quest/src/features/game/screens/response_popover.dart';
import 'package:sdg_guess_quest/src/utils/theme/utils.dart';

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
      createResponseWidgetIfAccepted(newTurn);
    });
  }

  void createResponseWidgetIfAccepted(String newTurn) {
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
              ? 'Does your card ${player2AskedQuestions.last.question}${checkQuestionMark(player2AskedQuestions.last.question)}'
              : 'Does your card ${player1AskedQuestions.last.question}${checkQuestionMark(player1AskedQuestions.last.question)}',
          onButtonPressed: (buttonText) {
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

  void showInfoPopover(BuildContext context, SDGCard card) {
    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (context) {
        return InfoPopoverWidget(
          card: card,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    //TODO
    // Move code into sepearate files, clean up code with shared functions
    // widget breakdown should be cards remaining, top right icons, cards, selected card, buttons
    //fix different screen sizing issues
    // . fix: spacing of ask question button padding

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
                            style: buttonFontWhite,
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
                        Builder(
                          builder: (context) => IconButton(
                            onPressed: () {
                              // Use a Builder to get a context that is a descendant of the Scaffold
                              Scaffold.of(context).openEndDrawer();
                            },
                            icon: const Icon(
                              Icons.history,
                              color: Colors.white,
                              size: 24.0,
                            ),
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            // Handle the button press to view past questions
                            // ...
                            Navigator.pop(context);
                          },
                          icon: const Icon(
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
                  itemCount: 16,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 4),
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
                          createResponseWidgetIfAccepted('p2');
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
                          if (turn == 'p1') {
                            guessCard(p1Cards[index]);
                          } else if (turn == 'p2') {
                            guessCard(p2Cards[index]);
                          }
                        } else {
                          //show info card
                          showInfoPopover(
                              context,
                              turn == 'p1'
                                  ? p1Cards[index].card
                                  : p2Cards[index].card);
                        }
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          border: Border.all(width: 3, color: primaryColor),
                          color: secondaryColor,
                          boxShadow: [
                            // Add a yellow glow when the box is clickable
                            if ((turn == 'p1' &&
                                    !p1Cards[index].flipped &&
                                    (isFlippingCard == true ||
                                        p1SelectedCard == null)) ||
                                (turn == 'p2' &&
                                    !p2Cards[index].flipped &&
                                    (isFlippingCard == true ||
                                        p2SelectedCard == null)))
                              const BoxShadow(
                                color: Colors.yellow,
                                spreadRadius: 2,
                                blurRadius: 5,
                                offset: Offset(0, 0),
                              ),
                          ],
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
                        child: const Text(
                          'Select one of the cards above that your opponent will try to guess.',
                          style: TextStyle(color: Colors.white, fontSize: 16),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ])
                  : Column(children: [
                      Container(
                        margin: const EdgeInsets.only(bottom: 12.0),
                        child: Text(
                          (turn == 'p1' &&
                                      (p1SelectedCard == null ||
                                          player1AskedQuestions.isEmpty)) ||
                                  (turn == 'p2' &&
                                      (p2SelectedCard == null ||
                                          player2AskedQuestions.isEmpty))
                              ? 'The card your opponent will guess:'
                              : turn == 'p1'
                                  ? 'You asked: ${player1AskedQuestions.last.isGuess == true ? '' : 'Does your card '}${player1AskedQuestions.last.question}${checkQuestionMark(player1AskedQuestions.last.question)} ${player1AskedQuestions.last.answer == true ? 'Yes' : 'No'}'
                                  : 'You asked: ${player2AskedQuestions.last.isGuess == true ? '' : 'Does your card '}${player2AskedQuestions.last.question}${checkQuestionMark(player2AskedQuestions.last.question)} ${player2AskedQuestions.last.answer == true ? 'Yes' : 'No'}',
                          style: const TextStyle(
                              color: Colors.white, fontSize: 16),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          //view card info
                          if (turn == 'p1' && p1SelectedCard != null) {
                            showInfoPopover(context, p1SelectedCard!.card);
                          }
                          if (turn == 'p2' && p2SelectedCard != null) {
                            showInfoPopover(context, p2SelectedCard!.card);
                          }
                        },
                        child: Container(
                          width: 150,
                          height: 170,
                          padding: const EdgeInsets.all(5),
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
                                style: const TextStyle(
                                  color:
                                      Colors.white, // Customize the text color
                                  fontSize: 14, // Customize the font size
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
              child: winner != 'p1' && winner != 'p2'
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
                              const SizedBox(
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
                        const SizedBox(
                            width: 20), // Adjust the space between columns
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
                                  padding: const EdgeInsets.symmetric(
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
      endDrawer: PastQuestionsDrawer(
        player1AskedQuestions: player1AskedQuestions, // Add your questions here
        player2AskedQuestions: player2AskedQuestions, // Add your questions here
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

import 'package:flutter/material.dart';
import 'package:sdg_guess_quest/src/features/game/screens/game_screen.dart';

class PastQuestionsDrawer extends StatelessWidget {
  final List<QuestionObject> player1AskedQuestions;
  final List<QuestionObject> player2AskedQuestions;

  PastQuestionsDrawer(
      {required this.player1AskedQuestions,
      required this.player2AskedQuestions});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          // Drawer header with title
          DrawerHeader(
            child: Center(
              child: Text(
                'Past Asked Questions',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),

          // List of past rounds
          Expanded(
            child: ListView.builder(
              itemCount:
                  player1AskedQuestions.length + player2AskedQuestions.length,
              itemBuilder: (context, index) {
                QuestionObject questionObject;
                if (index % 2 == 0) {
                  // Even index, display Player 1 question
                  questionObject = player1AskedQuestions[index ~/ 2];
                  return ListTile(
                    title: Text('Round ${index ~/ 2 + 1}'),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                            "Player 1 Question: ${questionObject.isGuess == true ? questionObject.question : 'Does your card ${(questionObject.question ?? '')}?'}"),
                        Text(
                            'Player 2 Answer: ${questionObject.answer == true ? 'Yes' : 'No'}'),
                      ],
                    ),
                  );
                } else {
                  // Odd index, display Player 2 question
                  questionObject = player2AskedQuestions[index ~/ 2];
                  return ListTile(
                    title: Text('Round ${index ~/ 2 + 1}'),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                            "Player 2 Question: ${questionObject.isGuess == true ? questionObject.question : 'Does your card ${(questionObject.question ?? '')}?'}"),
                        Text(
                            'Player 1 Answer: ${questionObject.answer == true ? 'Yes' : 'No'}'),
                      ],
                    ),
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class QuestionPopoverWidget extends StatefulWidget {
  final Function(String) onStringChanged;

  const QuestionPopoverWidget({Key? key, required this.onStringChanged})
      : super(key: key);

  @override
  _QuestionPopoverWidgetState createState() => _QuestionPopoverWidgetState();
}

class _QuestionPopoverWidgetState extends State<QuestionPopoverWidget> {
  TextEditingController _textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Ask a question to narrow down your character'),
      content: TextField(
        controller: _textEditingController,
        inputFormatters: [
          LengthLimitingTextInputFormatter(50), // Limit to 50 characters
        ],
        decoration: const InputDecoration(labelText: 'Does your card...'),
      ),
      actions: [
        ElevatedButton(
          onPressed: () {
            Navigator.pop(context);
            String enteredString = _textEditingController.text;
            widget.onStringChanged(enteredString);
          },
          child: const Text('Send'),
        ),
      ],
    );
  }
}

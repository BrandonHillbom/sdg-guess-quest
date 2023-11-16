import 'package:flutter/material.dart';

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
      title: Text('Ask a question to narrow down your character'),
      content: TextField(
        controller: _textEditingController,
        decoration: InputDecoration(labelText: 'Does your card...'),
      ),
      actions: [
        ElevatedButton(
          onPressed: () {
            Navigator.pop(context);
            String enteredString = _textEditingController.text;
            widget.onStringChanged(enteredString);
          },
          child: Text('Send'),
        ),
      ],
    );
  }
}

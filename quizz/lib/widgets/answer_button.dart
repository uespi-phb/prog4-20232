import 'package:flutter/material.dart';

class AnswerButton extends StatelessWidget {
  final String text;

  const AnswerButton(
    this.text, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 6.0,
        horizontal: 30.0,
      ),
      child: ElevatedButton(
        onPressed: () {},
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            text,
            style: const TextStyle(
              fontSize: 18.0,
            ),
          ),
        ),
      ),
    );
  }
}

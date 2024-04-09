import 'package:flutter/material.dart';

import '../models/option.dart';

typedef OnOptionSelected = void Function(Option option);

class AnswerButton extends StatelessWidget {
  final Option option;
  final OnOptionSelected onSelected;

  const AnswerButton({
    super.key,
    required this.option,
    required this.onSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 6.0,
        horizontal: 30.0,
      ),
      child: ElevatedButton(
        onPressed: () {
          onSelected(option);
        },
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            option.text,
            style: const TextStyle(
              fontSize: 18.0,
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

import '../models/option.dart';

typedef OnOptionSelected = void Function(Option option);

class OptionButton extends StatelessWidget {
  final Option option;
  final OnOptionSelected onSelected;
  final Color? color;

  const OptionButton({
    super.key,
    required this.option,
    required this.onSelected,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6.0),
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(color),
        ),
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

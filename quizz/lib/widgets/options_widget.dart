import 'package:flutter/material.dart';

import '../models/option.dart';
import 'option_button.dart';

class OptionsWidget extends StatefulWidget {
  final List<Option> options;
  final OnOptionSelected onOptionSelected;
  final Color wrightColor;
  final Color wrongColor;

  const OptionsWidget({
    super.key,
    required this.options,
    required this.onOptionSelected,
    this.wrightColor = Colors.green,
    this.wrongColor = Colors.red,
  });

  @override
  State<OptionsWidget> createState() => _OptionsWidgetState();
}

class _OptionsWidgetState extends State<OptionsWidget> {
  Option? selectedOption;

  void _buttonClicked(Option option) {
    setState(() {
      selectedOption = option != selectedOption ? option : null;
    });
    widget.onOptionSelected(option);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: widget.options
          .map((option) => OptionButton(
                color: option == selectedOption
                    ? option.correct
                        ? widget.wrightColor
                        : widget.wrongColor
                    : null,
                option: option,
                onSelected: _buttonClicked,
              ))
          .toList(),
    );
  }
}

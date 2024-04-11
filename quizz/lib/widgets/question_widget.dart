import 'package:flutter/material.dart';

import '../models/database.dart';
import 'option_button.dart';
import './options_widget.dart';

class QuestionWidget extends StatelessWidget {
  final int questionIndex;
  final OnOptionSelected onOptionSelected;

  const QuestionWidget({
    super.key,
    required this.questionIndex,
    required this.onOptionSelected,
  });

  @override
  Widget build(BuildContext context) {
    final question = Database.questions[questionIndex];

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(14.0),
            child: Text(
              '$questionIndex: ${question.text}',
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          OptionsWidget(
            options: question.options,
            onOptionSelected: onOptionSelected,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ElevatedButton(
                onPressed: questionIndex > 0 ? () {} : null,
                child: const Padding(
                  padding: EdgeInsets.all(6.0),
                  child: Icon(Icons.arrow_back),
                ),
              ),
              ElevatedButton(
                onPressed: () {},
                child: const Padding(
                  padding: EdgeInsets.all(6.0),
                  child: Icon(Icons.arrow_forward),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

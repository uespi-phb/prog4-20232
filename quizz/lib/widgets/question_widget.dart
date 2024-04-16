import 'package:flutter/material.dart';

import '../types/types.dart';
import '../models/database.dart';
import '../pages/main_page.dart';
import './options_widget.dart';

class QuestionWidget extends StatelessWidget {
  final int questionIndex;
  final OnButtonPressed onButtonPressed;

  const QuestionWidget({
    super.key,
    required this.questionIndex,
    required this.onButtonPressed,
  });

  @override
  Widget build(BuildContext context) {
    final question = Database.questions[questionIndex];
    final lastQuestion = questionIndex >= Database.questions.length - 1;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(14.0),
            child: Text(
              question.text,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          OptionsWidget(
            options: question.options,
            onOptionSelected: (option) {
              onButtonPressed(option, null);
            },
          ),
          Padding(
            padding: const EdgeInsets.only(top: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                if (questionIndex > 0)
                  ElevatedButton(
                    onPressed: () {
                      onButtonPressed(null, QuizzAction.backward);
                    },
                    child: const Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Text('Anterior'),
                    ),
                  )
                else
                  const SizedBox(),
                ElevatedButton(
                  onPressed: () {
                    onButtonPressed(null, QuizzAction.forward);
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(lastQuestion ? 'Resultado' : 'Próximo'),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

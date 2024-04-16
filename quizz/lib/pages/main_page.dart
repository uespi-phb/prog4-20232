import 'package:flutter/material.dart';

import '../types/types.dart';
import '../models/database.dart';
import '../models/option.dart';
import '../models/quizz_result.dart';
import '../widgets/result_widget.dart';
import '../widgets/question_widget.dart';

typedef OnButtonPressed = void Function(Option? option, QuizzAction? action);

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _questionIndex = 0;

  final List<Option?> _answers =
      List<Option?>.filled(Database.questions.length, null);

  void _onButtonPressed(Option? option, QuizzAction? action) {
    if (option == null) {
      setState(() {
        switch (action) {
          case QuizzAction.backward:
            _questionIndex--;
            break;
          case QuizzAction.forward:
            _questionIndex++;
            break;
          case QuizzAction.restart:
            _questionIndex = 0;
            break;
          default:
            break;
        }
      });
    } else {
      _answers[_questionIndex] =
          option != _answers[_questionIndex] ? option : null;
    }
  }

  QuizzResult _computeQuizzResult() {
    int playerScore = 0;
    int totalScore = 0;

    for (int i = 0; i < _answers.length; i++) {
      if ((_answers[i] != null) && _answers[i]!.correct) {
        playerScore += Database.questions[i].score;
      }
      totalScore += Database.questions[i].score;
    }

    return QuizzResult(
      playerScore: playerScore,
      totalScore: totalScore,
    );
  }

  @override
  Widget build(BuildContext context) {
    debugPrint(_answers.toString());
    return Scaffold(
      appBar: AppBar(
        title: const Text('Quizz'),
      ),
      body: (_questionIndex < Database.questions.length)
          ? QuestionWidget(
              questionIndex: _questionIndex,
              onButtonPressed: _onButtonPressed,
            )
          : ResultWidget(
              result: _computeQuizzResult(),
              onButtonPressed: _onButtonPressed,
            ),
    );
  }
}

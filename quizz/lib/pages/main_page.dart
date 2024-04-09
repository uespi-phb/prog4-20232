import 'package:flutter/material.dart';
import 'package:quizz/widgets/result_widget.dart';

import '../models/database.dart';
import '../models/option.dart';
import '../models/question.dart';
import '../widgets/answer_button.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _questionIndex = 0;

  void _onOptionSelected(Option option) {
    setState(() {
      _questionIndex++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Quizz'),
      ),
      body: (_questionIndex < Database.questions.length)
          ? QuestionWidget(
              question: Database.questions[_questionIndex],
              onSelected: _onOptionSelected,
            )
          : const ResultWidget(),
    );
  }
}

class QuestionWidget extends StatelessWidget {
  final Question question;
  final OnOptionSelected onSelected;

  const QuestionWidget({
    super.key,
    required this.question,
    required this.onSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
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
        ...question.options.map(
          (option) => AnswerButton(
            option: option,
            onSelected: onSelected,
          ),
        ),
      ],
    );
  }
}

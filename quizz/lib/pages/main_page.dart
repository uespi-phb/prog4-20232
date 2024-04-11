import 'package:flutter/material.dart';
import 'package:quizz/widgets/result_widget.dart';

import '../models/database.dart';
import '../models/option.dart';
import '../widgets/question_widget.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final int _questionIndex = 0;

  void _onOptionSelected(Option option) {
    setState(() {
      //_questionIndex++;
    });
    debugPrint('button pressed: ${option.text}');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Quizz'),
      ),
      body: (_questionIndex < Database.questions.length)
          ? QuestionWidget(
              questionIndex: _questionIndex,
              onOptionSelected: _onOptionSelected,
            )
          : const ResultWidget(),
    );
  }
}

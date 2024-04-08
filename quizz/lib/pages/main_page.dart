import 'package:flutter/material.dart';

import '../models/database.dart';
import '../widgets/answer_button.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Quizz'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.all(14.0),
            child: Text(
              Database.questions[0].text,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          AnswerButton(Database.questions[0].options[0].text),
          AnswerButton(Database.questions[0].options[1].text),
          AnswerButton(Database.questions[0].options[2].text),
          AnswerButton(Database.questions[0].options[3].text),
        ],
      ),
    );
  }
}

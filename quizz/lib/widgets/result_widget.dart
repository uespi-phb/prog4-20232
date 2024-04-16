import 'package:flutter/material.dart';
import 'package:quizz/pages/main_page.dart';
import 'package:quizz/types/types.dart';

import '../models/quizz_result.dart';

class ResultWidget extends StatelessWidget {
  final QuizzResult result;
  final OnButtonPressed onButtonPressed;

  const ResultWidget({
    super.key,
    required this.result,
    required this.onButtonPressed,
  });

  @override
  Widget build(BuildContext context) {
    const textStyle = TextStyle(
      fontSize: 28.0,
      fontWeight: FontWeight.bold,
    );

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 14.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Expanded(
            flex: 6,
            child: SizedBox(),
          ),
          Expanded(
            child: Text(
              'Pontuação',
              style: textStyle.copyWith(fontSize: 32.0),
              textAlign: TextAlign.center,
            ),
          ),
          Expanded(
            child: Text(
              '${result.playerScore} / ${result.totalScore} (${result.playerPercentScoreAsText})',
              style: textStyle,
              textAlign: TextAlign.center,
            ),
          ),
          Expanded(
            child: Text(
              'Classificação',
              style: textStyle.copyWith(fontSize: 32.0),
              textAlign: TextAlign.center,
            ),
          ),
          Expanded(
            child: Text(
              result.rakingAsText.toUpperCase(),
              style: textStyle,
              textAlign: TextAlign.center,
            ),
          ),
          ElevatedButton(
            onPressed: () {
              onButtonPressed(null, QuizzAction.restart);
            },
            child: const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'Jogar Novamente',
                style: TextStyle(
                  fontSize: 18.0,
                ),
              ),
            ),
          ),
          const Expanded(
            flex: 6,
            child: SizedBox(),
          ),
        ],
      ),
    );
  }
}

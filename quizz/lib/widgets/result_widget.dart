import 'package:flutter/material.dart';

class ResultWidget extends StatelessWidget {
  const ResultWidget({super.key});

  @override
  Widget build(BuildContext context) {
    const textStyle = TextStyle(
      fontSize: 32.0,
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
              style: textStyle.copyWith(fontSize: 40.0),
              textAlign: TextAlign.center,
            ),
          ),
          const Expanded(
            child: Text(
              '9/9',
              style: textStyle,
              textAlign: TextAlign.center,
            ),
          ),
          Expanded(
            child: Text(
              'Classificação',
              style: textStyle.copyWith(fontSize: 40.0),
              textAlign: TextAlign.center,
            ),
          ),
          const Expanded(
            child: Text(
              'BRONZE',
              style: textStyle,
              textAlign: TextAlign.center,
            ),
          ),
          ElevatedButton(
            onPressed: () {},
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

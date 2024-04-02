import 'package:flutter/material.dart';

import './dice_widget.dart';

class MainPage extends StatelessWidget {
  final _leftDice = const DiceWidget();
  final _rightDice = const DiceWidget();

  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    debugPrint('MainPage.build()');

    return Scaffold(
      backgroundColor: Colors.blue,
      appBar: AppBar(
        title: const Text('Rolando Dados'),
      ),
      body: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () {
          // rool dices
        },
        child: Center(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: _leftDice,
              ),
              Expanded(
                child: _rightDice,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

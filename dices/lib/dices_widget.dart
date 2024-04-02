import 'dart:math';

import 'package:flutter/material.dart';

class DicesWidget extends StatefulWidget {
  const DicesWidget({
    super.key,
  });

  @override
  State<DicesWidget> createState() => _DicesWidgetState();
}

class _DicesWidgetState extends State<DicesWidget> {
  final _rnd = Random();

  int _leftDice = 1;
  int _rightDice = 1;

  void _rollDices() {
    setState(() {
      _leftDice = _rnd.nextInt(6) + 1;
      _rightDice = _rnd.nextInt(6) + 1;
    });

    debugPrint('left : $_leftDice');
    debugPrint('right: $_rightDice');
  }

  @override
  Widget build(BuildContext context) {
    debugPrint('DicesWidget.build()');
    return GestureDetector(
      onTap: _rollDices,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Image.asset('assets/images/dice$_leftDice.png'),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Image.asset('assets/images/dice$_rightDice.png'),
            ),
          ),
        ],
      ),
    );
  }
}

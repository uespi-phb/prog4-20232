import 'dart:math';

import 'package:flutter/material.dart';

class DiceWidget extends StatefulWidget {
  const DiceWidget({
    super.key,
  });

  @override
  State<DiceWidget> createState() => _DiceWidgetState();
}

class _DiceWidgetState extends State<DiceWidget> {
  final _rnd = Random();

  late int value;

  @override
  void initState() {
    super.initState();
    roll();
  }

  void roll() {
    setState(() {
      value = _rnd.nextInt(6) + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: roll,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Image.asset('assets/images/dice$value.png'),
      ),
    );
  }
}

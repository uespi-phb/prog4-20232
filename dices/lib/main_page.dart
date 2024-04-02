import 'dart:math';
import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final _rnd = Random();

  int _leftDice = 1;
  int _rightDice = 4;

  void _rollDices() {
    setState(() {
      _leftDice = _rnd.nextInt(6) + 1;
      _rightDice = _rnd.nextInt(6) + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    debugPrint('**** build()');

    return Scaffold(
      backgroundColor: Colors.blue,
      appBar: AppBar(
        title: const Text('Rolando Dados'),
      ),
      body: GestureDetector(
        onTap: _rollDices,
        child: Center(
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
        ),
      ),
    );
  }
}

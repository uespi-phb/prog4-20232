import 'dart:math';

import 'package:flutter/material.dart';
import 'package:jokenpo/domain/jokenpo.dart';
import 'package:jokenpo/models/jokenpo_object.dart';

import '../widgets/rounded_button.dart';
import '../themes/styles.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final rnd = Random();

  JokenpoObject computerChoice = JokenpoObject.none;
  JokenpoObject playerChoice = JokenpoObject.none;

  void _onChoice(JokenpoObject object) {
    final index = rnd.nextInt(JokenpoObject.values.length - 1);

    setState(() {
      computerChoice = JokenpoObject.values[index + 1];
      playerChoice = object;
    });
  }

  @override
  Widget build(BuildContext context) {
    final jokenpo = Jokenpo(
      player1Object: computerChoice,
      player2Object: playerChoice,
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text('Jokenpo'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Padding(
            padding: EdgeInsets.all(18.0),
            child: Text(
              'Escolha do App',
              style: AppStyles.title,
            ),
          ),
          RoundedButton(
            object: computerChoice,
            onPressed: () {},
            selected: false,
          ),
          const Padding(
            padding: EdgeInsets.all(18.0),
            child: Text(
              'Sua Escolha',
              style: AppStyles.title,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              RoundedButton(
                object: JokenpoObject.stone,
                onPressed: () => _onChoice(JokenpoObject.stone),
                selected: playerChoice == JokenpoObject.stone,
              ),
              RoundedButton(
                object: JokenpoObject.paper,
                onPressed: () => _onChoice(JokenpoObject.paper),
                selected: playerChoice == JokenpoObject.paper,
              ),
              RoundedButton(
                object: JokenpoObject.scisors,
                onPressed: () => _onChoice(JokenpoObject.scisors),
                selected: playerChoice == JokenpoObject.scisors,
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: Text(
              jokenpo.winnerText,
              style: AppStyles.title,
            ),
          ),
          Text(
            jokenpo.winnerReason,
            style: AppStyles.title,
          ),
        ],
      ),
    );
  }
}

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:jokenpo/domain/jokenpo.dart';
import 'package:jokenpo/domain/jokenpo_object.dart';

import '../widgets/rounded_button.dart';
import '../themes/styles.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final rnd = Random();

  JokenpoObject? computerChoice;
  JokenpoObject? playerChoice;

  void _onChoice(JokenpoObject object) {
    final index = rnd.nextInt(JokenpoObject.values.length - 1);

    setState(() {
      computerChoice = JokenpoObject.values[index + 1];
      playerChoice = object;
    });
  }

  Color? getRingColor(
    JokenpoPlayer player,
    JokenpoObject? object,
  ) {
    if (computerChoice != null && playerChoice != null) {
      if (player == JokenpoPlayer.player1) {
        return (computerChoice! > playerChoice!)
            ? AppTheme.winnerColor
            : AppTheme.looserColor;
      }
      if (player == JokenpoPlayer.player2) {
        if (playerChoice == object) {
          if (playerChoice! > computerChoice!) {
            return AppTheme.winnerColor;
          } else {
            return AppTheme.looserColor;
          }
        }
      }
    }

    return null;
  }

  @override
  Widget build(BuildContext context) {
    JokenpoPlayer? winner;
    String winnerText;
    String reasonText;

    if ((computerChoice != null) && (playerChoice != null)) {
      final jokenpo = Jokenpo(
        player1Object: computerChoice!,
        player2Object: playerChoice!,
      );
      winner = jokenpo.winner;
      winnerText = jokenpo.winnerText;
      reasonText = jokenpo.reasonText;
    } else {
      winner = null;
      winnerText = '';
      reasonText = '';
    }

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
              style: AppTheme.titleStyle,
            ),
          ),
          RoundedButton(
            object: computerChoice,
            onPressed: () {},
            ringColor: getRingColor(JokenpoPlayer.player1, computerChoice),
          ),
          const Padding(
            padding: EdgeInsets.all(18.0),
            child: Text(
              'Sua Escolha',
              style: AppTheme.titleStyle,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              RoundedButton(
                object: JokenpoObject.stone,
                onPressed: () => _onChoice(JokenpoObject.stone),
                ringColor:
                    getRingColor(JokenpoPlayer.player2, JokenpoObject.stone),
              ),
              RoundedButton(
                object: JokenpoObject.paper,
                onPressed: () => _onChoice(JokenpoObject.paper),
                ringColor:
                    getRingColor(JokenpoPlayer.player2, JokenpoObject.paper),
              ),
              RoundedButton(
                object: JokenpoObject.scisors,
                onPressed: () => _onChoice(JokenpoObject.scisors),
                ringColor:
                    getRingColor(JokenpoPlayer.player2, JokenpoObject.scisors),
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: Text(
              winnerText,
              style: AppTheme.titleStyle,
            ),
          ),
          Text(
            reasonText,
            style: AppTheme.titleStyle,
          ),
        ],
      ),
    );
  }
}

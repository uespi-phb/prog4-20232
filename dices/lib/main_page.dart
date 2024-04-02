import 'package:flutter/material.dart';

import './dices_widget.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    debugPrint('MainPage.build()');

    return Scaffold(
      backgroundColor: Colors.blue,
      appBar: AppBar(
        title: const Text('Rolando Dados'),
      ),
      body: const Center(
        child: DicesWidget(),
      ),
    );
  }
}

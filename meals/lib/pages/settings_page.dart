import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Configurações'),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 18.0),
            child: Text(
              'Filtros',
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
          ),
          SwitchListTile(
            value: false,
            title: const Text('Sem Glútem'),
            subtitle: const Text('Só exibe refeições sem glúten'),
            onChanged: (flag) {
              //provider.toggleGlutenFree();
            },
          )
        ],
      ),
    );
  }
}

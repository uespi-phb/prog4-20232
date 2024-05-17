import 'package:flutter/material.dart';

import '../app/app_routes.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    const titleStyle = TextStyle(
      fontWeight: FontWeight.w900,
      fontSize: 20.0,
      color: Colors.black87,
    );

    return Drawer(
      child: Column(
        children: [
          Container(
            height: 80.0,
            width: double.infinity,
            color: Theme.of(context).primaryColor,
            child: Center(
              child: Text(
                'Tudo Gostoso',
                style: TextStyle(
                  fontWeight: FontWeight.w900,
                  fontSize: 26.0,
                  color: Theme.of(context).canvasColor,
                ),
              ),
            ),
          ),
          ListTile(
            leading: const Icon(
              Icons.restaurant,
            ),
            title: const Text(
              'Refeições',
              style: titleStyle,
            ),
            onTap: () {
              Navigator.of(context).pushReplacementNamed(AppRoutes.root);
            },
          ),
          ListTile(
            leading: const Icon(
              Icons.settings,
            ),
            title: const Text(
              'Configurações',
              style: titleStyle,
            ),
            onTap: () {
              Navigator.of(context).pushNamed(AppRoutes.settings);
            },
          )
        ],
      ),
    );
  }
}

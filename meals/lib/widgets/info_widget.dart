import 'package:flutter/material.dart';

class InfoWidget extends StatelessWidget {
  final String title;
  final Widget child;

  const InfoWidget({
    super.key,
    required this.title,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Column(
        children: [
          Text(
            title,
            style: Theme.of(context).textTheme.titleMedium,
          ),
          Container(
            width: 250.0,
            margin: const EdgeInsets.only(top: 10.0),
            padding: const EdgeInsets.all(8.0),
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: child,
          )
        ],
      ),
    );
  }
}

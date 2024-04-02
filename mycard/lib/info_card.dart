import 'package:flutter/material.dart';

class InfoCard extends StatelessWidget {
  final IconData? icon;
  final String? text;

  const InfoCard({
    super.key,
    this.icon,
    this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: 16.0,
        vertical: 8.0,
      ),
      padding: const EdgeInsets.symmetric(
        horizontal: 16.0,
        vertical: 8.0,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(4.0),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Icon(
            icon,
            color: Colors.teal,
            size: 18.0,
          ),
          Text(
            text ?? '',
            style: const TextStyle(
              decorationStyle: TextDecorationStyle.solid,
              fontSize: 12.0,
              fontWeight: FontWeight.bold,
              color: Colors.teal,
            ),
          ),
        ],
      ),
    );
  }
}

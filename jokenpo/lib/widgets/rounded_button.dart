import 'package:flutter/material.dart';
import 'package:jokenpo/domain/jokenpo_object.dart';

class RoundedButton extends StatelessWidget {
  final JokenpoObject? object;
  final VoidCallback onPressed;
  final Color? ringColor;

  const RoundedButton({
    super.key,
    this.object,
    required this.onPressed,
    this.ringColor,
  });

  @override
  Widget build(BuildContext context) {
    final assetName = (object != null) ? object!.name : 'none';

    return GestureDetector(
      onTap: onPressed,
      child: CircleAvatar(
        backgroundColor: ringColor ?? Colors.white,
        radius: 40.0,
        child: CircleAvatar(
          backgroundColor: Colors.white,
          radius: 36.0,
          child: Image.asset('assets/images/$assetName.png'),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:jokenpo/models/jokenpo_object.dart';

class RoundedButton extends StatelessWidget {
  final JokenpoObject object;
  final VoidCallback onPressed;
  final bool selected;

  const RoundedButton({
    super.key,
    required this.object,
    required this.onPressed,
    required this.selected,
  });

  String get objectAssetName {
    final name = object.name.replaceAll('JokenpoObject.', '');
    return 'assets/images/$name.png';
  }

  String get objectAssetName_ {
    String name;

    switch (object) {
      case JokenpoObject.stone:
        name = 'stone.png';
        break;
      case JokenpoObject.paper:
        name = 'paper.png';
        break;
      case JokenpoObject.scisors:
        name = 'scisors.png';
        break;
      default:
        name = 'blank.png';
    }
    return 'assets/images/$name';
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: CircleAvatar(
        backgroundColor: selected ? Colors.red : Colors.white,
        radius: 40.0,
        child: CircleAvatar(
          backgroundColor: Colors.white,
          radius: 36.0,
          child: Image.asset(objectAssetName),
        ),
      ),
    );
  }
}

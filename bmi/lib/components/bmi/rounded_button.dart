import 'package:flutter/material.dart';

class RoundedButton extends StatelessWidget {
  RoundedButton({
    required this.onPressed,
    required this.heroTag,
    this.backgroundColor = const Color(0xFF4C4F5E),
    this.icon = const Icon(Icons.add, color: Colors.white),
  });

  final Function onPressed;
  final Color backgroundColor;
  final Icon icon;
  final String heroTag;

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () => onPressed(),
      backgroundColor: backgroundColor,
      shape: CircleBorder(),
      elevation: 6.0,
      heroTag: heroTag,
      child: icon,
    );
  }
}

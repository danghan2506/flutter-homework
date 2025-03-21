import 'package:flutter/material.dart';

class ReusableCard extends StatelessWidget {
  ReusableCard({
    this.colour = const Color(0xFF1D1E33),
    this.cardChild = const Text(""),
    this.onTap = _defaultOnTap,
  });

  final Color colour;
  final Widget cardChild;
  final Function onTap;

  static void _defaultOnTap() {}

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => {onTap()},
      child: Container(
        margin: EdgeInsets.all(15.0),
        decoration: BoxDecoration(
          color: colour,
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: cardChild,
      ),
    );
  }
}

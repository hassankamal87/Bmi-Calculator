import 'package:flutter/material.dart';

class CardWidget extends StatelessWidget {
  CardWidget({super.key, required this.colour, this.cardChild, this.onPress});

  final Color colour;
  final Widget? cardChild;
  final onPress;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress ?? (){},
      child: Container(
        margin: EdgeInsets.all(15.0),
        decoration:
        BoxDecoration(color: colour, borderRadius: BorderRadius.circular(20)),
        child: cardChild,
      ),
    );
  }
}
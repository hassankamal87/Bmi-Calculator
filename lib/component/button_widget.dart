import 'package:flutter/material.dart';

import '../constants.dart';


class ButtonWidget extends StatelessWidget {
  final onPress;
  final String title ;
  ButtonWidget({this.onPress, required this.title});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress ?? (){},
      child: Container(
        decoration: const BoxDecoration(
            color: bottomContainerColor,
            borderRadius:
            BorderRadius.vertical(top: Radius.circular(20.0))),
        margin: const EdgeInsets.only(top: 10.0),
        height: bottomContainerHeight,
        width: double.infinity,
        child: Center(
          child: Text(
            title,
            style: const TextStyle(color: Colors.white, fontSize: 20.0),
          ),
        ),
      ),
    );
  }
}
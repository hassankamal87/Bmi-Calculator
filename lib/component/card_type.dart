import 'package:flutter/material.dart';

import '../constants.dart';



class TypeCard extends StatelessWidget {
  TypeCard({required this.icon, required this.type});

  final IconData icon;
  final String type;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon,
          size: 80.0,
          color: Colors.white,
        ),
        const SizedBox(
          height: 15.0,
        ),
        Text(
          type,
          style: lableTextStyle,
        ),
      ],
    );
  }
}

import 'package:bmi_calculater/bmi_brain.dart';
import 'package:flutter/material.dart';

import '../component/button_widget.dart';
import '../component/card_widget.dart';
import '../constants.dart';

class ResultPage extends StatelessWidget {

  ResultPage({required this.status, required this.result, required this.statics});

  final String status ;
  final String result;
  final String statics ;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('BMI CALCULATOR'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
                child: Container(
              padding: const EdgeInsets.only(left: 20),
              alignment: Alignment.bottomLeft,
              child: const Text(
                'Your Result',
                style: TextStyle(fontSize: 50.0, fontWeight: FontWeight.bold),
              ),
            )),
            Expanded(
              flex: 6,
              child: CardWidget(
                colour: activeCardColor,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      status.toUpperCase(),
                      style: const TextStyle(
                          color: Color(0xFF24D876),
                          fontSize: 22.0,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      result,
                      style: const TextStyle(
                          fontSize: 100.0, fontWeight: FontWeight.bold),
                    ),
                    Padding(
                      padding: EdgeInsets.all(10.0,),
                      child: Text(
                        statics,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: 22.0,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            ButtonWidget(
                onPress: () {
                    Navigator.pop(context);
                },
                title: 'RE-CALCULATE'),
          ],
        ));
  }
}

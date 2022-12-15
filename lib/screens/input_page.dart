import 'package:bmi_calculater/bmi_brain.dart';
import 'package:bmi_calculater/screens/result_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../component/button_widget.dart';
import '../component/card_type.dart';
import '../component/card_widget.dart';
import '../constants.dart';
import '../component/round_icon_button.dart';

enum Gender { male, female }

class InputPage extends StatefulWidget {
  const InputPage({Key? key}) : super(key: key);

  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender? selected;
  int currentHeight = 183;
  int currentWeight = 80;
  int currentAge = 20;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('BMI CALCULATOR'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
              child: Row(
            children: [
              //male
              Expanded(
                child: CardWidget(
                  onPress: () {
                    setState(() {
                      selected = Gender.male;
                    });
                  },
                  colour: selected == Gender.male
                      ? activeCardColor
                      : inActiveCardColor,
                  cardChild: TypeCard(
                    icon: FontAwesomeIcons.mars,
                    type: 'MALE',
                  ),
                ),
              ),
              //female
              Expanded(
                child: CardWidget(
                  onPress: () {
                    setState(() {
                      selected = Gender.female;
                    });
                  },
                  colour: selected == Gender.female
                      ? activeCardColor
                      : inActiveCardColor,
                  cardChild: TypeCard(
                    icon: FontAwesomeIcons.venus,
                    type: 'FEMALE',
                  ),
                ),
              ),
            ],
          )),
          //slider age
          Expanded(
              child: CardWidget(
            colour: activeCardColor,
            cardChild: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'HEIGHT',
                  style: lableTextStyle,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  textBaseline: TextBaseline.alphabetic,
                  children: [
                    Text(
                      currentHeight.toString(),
                      style: lableNumberStyle,
                    ),
                    Text(
                      'cm',
                      style: lableTextStyle,
                    )
                  ],
                ),
                SliderTheme(
                  data: SliderTheme.of(context).copyWith(
                      thumbColor: bottomContainerColor,
                      activeTrackColor: Colors.white,
                      inactiveTrackColor: Colors.grey,
                      overlayColor: Color(0x29EB2555),
                      thumbShape:
                          RoundSliderThumbShape(enabledThumbRadius: 15.0),
                      overlayShape: RoundSliderOverlayShape(overlayRadius: 30)),
                  child: Slider(
                    value: currentHeight.toDouble(),
                    min: 120.0,
                    max: 220.0,
                    onChanged: (double newValue) {
                      setState(() {
                        currentHeight = newValue.round();
                      });
                    },
                  ),
                )
              ],
            ),
          )),
          //weight
          Expanded(
              child: Row(
            children: [
              Expanded(
                  child: CardWidget(
                colour: activeCardColor,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'WEIGHT',
                      style: lableTextStyle,
                    ),
                    Text(
                      currentWeight.toString(),
                      style: lableNumberStyle,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        RoundIconButton(
                          icon: FontAwesomeIcons.minus,
                          onPress: () {
                            setState(() {
                              if (currentWeight > 30) {
                                currentWeight--;
                              }
                            });
                          },
                        ),
                        SizedBox(
                          width: 15.0,
                        ),
                        RoundIconButton(
                          icon: FontAwesomeIcons.plus,
                          onPress: () {
                            setState(() {
                              if (currentWeight < 250) {
                                currentWeight++;
                              }
                            });
                          },
                        )
                      ],
                    )
                  ],
                ),
              )),
              //age
              Expanded(
                  child: CardWidget(
                colour: activeCardColor,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'AGE',
                      style: lableTextStyle,
                    ),
                    Text(
                      currentAge.toString(),
                      style: lableNumberStyle,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        RoundIconButton(
                          icon: FontAwesomeIcons.minus,
                          onPress: () {
                            setState(() {
                              if (currentAge > 8) {
                                currentAge--;
                              }
                            });
                          },
                        ),
                        SizedBox(
                          width: 15.0,
                        ),
                        RoundIconButton(
                          icon: FontAwesomeIcons.plus,
                          onPress: () {
                            setState(() {
                              if (currentAge < 100) {
                                currentAge++;
                              }
                            });
                          },
                        )
                      ],
                    )
                  ],
                ),
              )),
            ],
          )),
          ButtonWidget(
            onPress: () {
              BmiBrain brain =
                  BmiBrain(weight: currentWeight, height: currentHeight);
              String re = brain.getResult();
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => ResultPage(
                          result: re,
                          status: brain.getStatus(),
                          statics: brain.getStatics(),
                        )),
              );
            },
            title: 'CALCULATE BMI',
          )
        ],
      ),
    );
  }
}

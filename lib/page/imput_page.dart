// ignore_for_file: library_private_types_in_public_api

import 'package:calculator/calculation_brain.dart';
import 'package:calculator/constants.dart';
import 'package:calculator/component/reaseble.dart';
import 'package:calculator/component/red_button.dart';
import 'package:calculator/component/round_icon_button.dart';
import 'package:calculator/page/result.page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

enum Gender { men, women }

class InputPage extends StatefulWidget {
  const InputPage({super.key});

  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender? selectedGender;

  int height = 170;

  int weight = 70;

  int age = 18;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BMI CALCULATOR'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Expanded(
                  child: ReusableCard(
                    colorBox: selectedGender == Gender.men
                        ? kInactiveCadrColor
                        : kActiveCadrColor,
                    cardChild: const Icon(
                      FontAwesomeIcons.mars,
                      size: 80,
                    ),
                    text: 'Мужчина',
                    voidGender: () {
                      setState(() {
                        selectedGender = Gender.men;
                      });
                    },
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    colorBox: selectedGender == Gender.women
                        ? kInactiveCadrColor
                        : kActiveCadrColor,
                    cardChild: const Icon(
                      FontAwesomeIcons.venus,
                      size: 80,
                    ),
                    text: 'Женщина',
                    voidGender: () {
                      setState(
                        () {
                          selectedGender = Gender.women;
                        },
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
          ReusableCard(
              colorBox: kActiveCadrColor,
              cardChild: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const Padding(
                      padding: EdgeInsets.all(20),
                      child: Text(
                        'Высота',
                        style: kLabelTextStyle,
                      ),
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      mainAxisAlignment: MainAxisAlignment.center,
                      textBaseline: TextBaseline.alphabetic,
                      children: [
                        Text(
                          height.toString(),
                          style: kTextStyleNumber,
                        ),
                        const Text('cm'),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SliderTheme(
                        data: SliderTheme.of(context).copyWith(
                          thumbShape: const RoundSliderThumbShape(
                            enabledThumbRadius: 12,
                          ),
                          overlayShape:
                              const RoundSliderOverlayShape(overlayRadius: 24),
                          activeTrackColor: const Color(0xFFEB1570),
                          inactiveTrackColor: const Color(0xFF8D8E98),
                          thumbColor: const Color(0xFFEB1555),
                          overlayColor: const Color(0x29EB1555),
                        ),
                        child: Center(
                          child: Slider(
                            value: height.toDouble(),
                            min: 120.0,
                            max: 220.0,
                            // activeColor: const Color(0xFFEB1555),
                            // inactiveColor: const Color(0xFF8D8E98),
                            onChanged: (double newValue) {
                              setState(() {
                                height = newValue.round();
                              });
                            },
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              text: '',
              voidGender: () {},
              textStyle: kTextStyleNumber),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                    colorBox: kActiveCadrColor,
                    cardChild: Column(
                      children: [
                        const Text(
                          "Масса",
                          style: kLabelTextStyle,
                        ),
                        Text(
                          weight.toString(),
                          style: kTextStyleNumber,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            RoundIconButton(
                              icon: FontAwesomeIcons.minus,
                              onPressed: () {
                                setState(() {
                                  weight--;
                                });
                              },
                            ),
                            RoundIconButton(
                              icon: FontAwesomeIcons.plus,
                              onPressed: () {
                                setState(() {
                                  weight++;
                                });
                              },
                            ),
                          ],
                        )
                      ],
                    ),
                    voidGender: () {},
                    text: '',
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    colorBox: kActiveCadrColor,
                    cardChild: Column(
                      children: [
                        const Text(
                          "Возраст",
                          style: kLabelTextStyle,
                        ),
                        Text(
                          age.toString(),
                          style: kTextStyleNumber,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            RoundIconButton(
                              icon: FontAwesomeIcons.minus,
                              onPressed: () {
                                setState(() {
                                  age--;
                                });
                              },
                            ),
                            RoundIconButton(
                              icon: FontAwesomeIcons.plus,
                              onPressed: () {
                                setState(() {
                                  age++;
                                });
                              },
                            ),
                          ],
                        )
                      ],
                    ),
                    voidGender: () {},
                    text: '',
                  ),
                ),
              ],
            ),
          ),
          ButtonRed(
            onTap: () {
              CalculationBrain calc =
                  CalculationBrain(height: height, weight: weight);

              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ResultPage(
                    bmiResult: calc.calculationBMI(),
                    intarpretation: calc.getInterpretation(),
                    textResult: calc.getResult(),
                  ),
                ),
              );
            },
            buttonTitle: 'Вычислить',
          ),
        ],
      ),
    );
  }
}

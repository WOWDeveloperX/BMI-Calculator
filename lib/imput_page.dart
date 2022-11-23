// ignore_for_file: library_private_types_in_public_api

import 'package:calculator/constants.dart';
import 'package:calculator/reaseble.dart';
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

  int _height = 120;

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
                    iconData: const Icon(
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
                    iconData: const Icon(
                      FontAwesomeIcons.venus,
                      size: 80,
                    ),
                    text: 'Женщина',
                    voidGender: () {
                      setState(() {
                        selectedGender = Gender.women;
                      });
                    },
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ReusableCard(
                colorBox: kActiveCadrColor,
                iconData: Column(
                  children: [
                    const Text(
                      'Высота',
                      style: kLabelTextStyle,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      mainAxisAlignment: MainAxisAlignment.center,
                      textBaseline: TextBaseline.alphabetic,
                      children: [
                        Text(
                          _height.toString(),
                          style: kTextStyleNumber,
                        ),
                        const Text('cm'),
                      ],
                    ),
                    SliderTheme(
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
                      child: Slider(
                        value: _height.toDouble(),
                        min: 120.0,
                        max: 220.0,
                        // activeColor: const Color(0xFFEB1555),
                        // inactiveColor: const Color(0xFF8D8E98),
                        onChanged: (double newValue) {
                          setState(() {
                            _height = newValue.round();
                          });
                        },
                      ),
                    ),
                  ],
                ),
                text: '',
                voidGender: () {},
                textStyle: kTextStyleNumber),
          ),

          // Expanded(
          //   child: Row(
          //     children: const [
          //       Expanded(
          //         child: ReusableCard(
          //           colorBox: activeCadrColor,
          //         ),
          //       ),
          //       Expanded(
          //         child: ReusableCard(
          //           colorBox: activeCadrColor,
          //         ),
          //       ),
          //     ],
          //   ),
          // ),
          Container(
            color: kBottomContainerColor,
            margin: const EdgeInsets.only(top: 10),
            width: double.infinity,
            height: 70,
          )
        ],
      ),
    );
  }
}

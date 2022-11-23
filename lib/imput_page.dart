// ignore_for_file: library_private_types_in_public_api

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
  static const _activeCadrColor = Color(0xFF1D1E33);
  static const _inactiveCadrColor = Color(0xFF111328);
  static const _bottomContainerColor = Color(0xFFEB1555);

  Gender? selectedGender;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BMI CALCULATOR'),
      ),
      body: Column(
        children: [
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: ReusableCard(
                    colorBox: selectedGender == Gender.men
                        ? _inactiveCadrColor
                        : _activeCadrColor,
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
                        ? _inactiveCadrColor
                        : _activeCadrColor,
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
          // const Expanded(
          //   child: ReusableCard(
          //     colorBox: _activeCadrColor,
          //     iconData: null,
          //     text: 'null',
          //   ),
          // ),
          // Expanded(
          //   child: Row(
          //     children: const [
          //       Expanded(
          //         child: ReusableCard(
          //           colorBox: _activeCadrColor,
          //         ),
          //       ),
          //       Expanded(
          //         child: ReusableCard(
          //           colorBox: _activeCadrColor,
          //         ),
          //       ),
          //     ],
          //   ),
          // ),
          Container(
            color: _bottomContainerColor,
            margin: const EdgeInsets.only(top: 10),
            width: double.infinity,
            height: 70,
          )
        ],
      ),
    );
  }
}

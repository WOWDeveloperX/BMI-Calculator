// ignore_for_file: library_private_types_in_public_api

import 'package:calculator/reaseble.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class InputPage extends StatefulWidget {
  const InputPage({super.key});

  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  static const _activeCadrColor = Color(0xFF1D1E33);
  static const _inactiveCadrColor = Color(0xFF111328);
  static const _bottomContainerColor = Color(0xFFEB1555);

  Color maleCardColor = _inactiveCadrColor;
  Color femaleCardColor = _inactiveCadrColor;

  void updateColor(int gender) {
    if (gender == 1) {
      if (maleCardColor == _inactiveCadrColor) {
        maleCardColor = _activeCadrColor;
        femaleCardColor = _inactiveCadrColor;
      } else {
        maleCardColor = _inactiveCadrColor;
      }
    }
    if (gender == 2) {
      if (femaleCardColor == _inactiveCadrColor) {
        femaleCardColor = _activeCadrColor;
        maleCardColor = _inactiveCadrColor;
      } else {
        femaleCardColor = _inactiveCadrColor;
      }
    }
  }

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
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        updateColor(1);
                      });
                    },
                    child: ReusableCard(
                      colorBox: maleCardColor,
                      iconData: const Icon(
                        FontAwesomeIcons.mars,
                        size: 80,
                      ),
                      text: 'Мужчина',
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        updateColor(2);
                      });
                    },
                    child: ReusableCard(
                      colorBox: femaleCardColor,
                      iconData: const Icon(
                        FontAwesomeIcons.venus,
                        size: 80,
                      ),
                      text: 'Женщина',
                    ),
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

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

  // Color maleCardColor = _activeCadrColor;
  // Color femaleCardColor = _inactiveCadrColor;



  

  bool _menBool = false;
  bool _womenBool = false;

  void updateColor(gender) {
    if (gender == Gender.men) {
      if (_menBool == false) {
        _menBool = true;
        _womenBool = false;
      } else {
        _menBool = false;
      }
    }
    if (gender == Gender.women) {
      if (_womenBool == false) {
        _womenBool = true;
        _menBool = false;
      } else {
        _womenBool = false;
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
                        updateColor(Gender.men);
                      });
                    },
                    child: ReusableCard(
                      colorBox:
                          _menBool ? _inactiveCadrColor : _activeCadrColor,
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
                        updateColor(Gender.women);
                      });
                    },
                    child: ReusableCard(
                      colorBox:
                          _womenBool ? _inactiveCadrColor : _activeCadrColor,
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

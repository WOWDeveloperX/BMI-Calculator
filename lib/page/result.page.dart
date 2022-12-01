import 'package:calculator/constants.dart';
import 'package:calculator/component/reaseble.dart';
import 'package:flutter/material.dart';

import '../component/red_button.dart';

class ResultPage extends StatelessWidget {
  const ResultPage(
      {super.key,
      required this.bmiResult,
      required this.textResult,
      required this.intarpretation});

  final String bmiResult;
  final String textResult;
  final String intarpretation;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Результат"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              "Твои результаты",
              style: kTitleTextStyle,
            ),
          ),
          Expanded(
            flex: 5,
            child: ReusableCard(
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(textResult.toUpperCase(), style: kResultTextStyle),
                  Text(
                    bmiResult,
                    style: kBMITextStule,
                  ),
                  Text(
                    intarpretation,
                    style: kBMITextStuleMini,
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
              colorBox: kActiveCadrColor,
              text: '',
              voidGender: () {},
            ),
          ),
          ButtonRed(
            buttonTitle: 'Начать сначала',
            onTap: () {
              Navigator.pop(context);
            },
          )
        ],
      ),
    );
  }
}

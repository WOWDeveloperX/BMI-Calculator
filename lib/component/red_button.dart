import 'package:calculator/constants.dart';
import 'package:flutter/material.dart';

class ButtonRed extends StatelessWidget {
  const ButtonRed({Key? key, required this.onTap, required this.buttonTitle})
      : super(key: key);

  final VoidCallback onTap;

  final String buttonTitle;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.only(bottom: 20),
        color: kBottomContainerColor,
        margin: const EdgeInsets.only(top: 10),
        width: double.infinity,
        height: 70,
        child: Center(
            child: Text(
          buttonTitle,
          style: kLargeButtonTextStyke,
        )),
      ),
    );
  }
}

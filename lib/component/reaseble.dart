import 'package:flutter/material.dart';

class ReusableCard extends StatelessWidget {
  const ReusableCard({
    Key? key,
    required this.colorBox,
    required this.cardChild,
    required this.text,
    required this.voidGender,
    this.textStyle = const TextStyle(
      fontSize: 18,
      color: Color(0xff8D8E98),
    ),
  }) : super(key: key);

  final Color colorBox;
  final Widget cardChild;
  final String text;

  final TextStyle textStyle;
  final Function() voidGender;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: voidGender,
      child: Container(
        margin: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: colorBox,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          
          children: [
            cardChild,
            Text(text, style: textStyle),
          ],
        ),
      ),
    );
  }
}

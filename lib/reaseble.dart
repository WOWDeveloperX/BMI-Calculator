import 'package:flutter/material.dart';

class ReusableCard extends StatelessWidget {
  const ReusableCard(
      {Key? key,
      required this.colorBox,
      required this.iconData,
      required this.text,
      required this.voidGender})
      : super(key: key);

  final Color colorBox;
  final Icon iconData;
  final String text;
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
            iconData,
            const SizedBox(
              height: 15,
            ),
            Text(
              text,
              style: const TextStyle(
                fontSize: 18,
                color: Color(0xff8D8E98),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

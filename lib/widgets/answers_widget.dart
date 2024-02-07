import 'package:flutter/material.dart';

class AnswersWidget extends StatelessWidget {
  final int questionNumber;
  final String answer;

  const AnswersWidget({super.key, required this.questionNumber, required this.answer});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      margin: EdgeInsets.symmetric(horizontal: 4),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (questionNumber > 1)
            const VerticalDivider(color: Colors.black),
          Container(
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(questionNumber.toString(), style: TextStyle(fontSize: 24),),
                SizedBox(width: 10),
                Container(
                  width: 24,
                  height: 24,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: Color(0xFFD9D9D9)),
                  ),
                ),
                SizedBox(width: 10),
                Text(answer, style: TextStyle(fontSize: 24),),
              ],
            ),
          )
        ],
      ),
    );
  }
}

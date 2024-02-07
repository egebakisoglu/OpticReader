import 'package:flutter/material.dart';
import 'package:opticreader/widgets/answers_widget.dart';

class AnswerKeyPage extends StatelessWidget {
  const AnswerKeyPage({super.key, required this.answers});
  final List<String> answers;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Cevap Anahtarı",
          style: TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Column(
        children: [
          const Divider(indent: 30, endIndent: 30, color: Colors.black, thickness: 0.4),
          Wrap(
            children: [
              for (int i = 0; i < answers.length; i++)
                AnswersWidget(questionNumber: i + 1, answer: answers[i]),
            ],
          )
        ],
      ),
    );
  }
}

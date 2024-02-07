import 'package:flutter/material.dart';

class AnswerKeyPage extends StatelessWidget {
  const AnswerKeyPage({super.key});
  // answers parametresi olcak

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
          Text("Answer Key"),
        ],
      ),
    );
  }
}

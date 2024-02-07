import 'package:flutter/material.dart';

class OpticPage extends StatelessWidget {
  const OpticPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Optik Sonuçları",
          style: TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Column(
        children: [
          const Divider(indent: 30, endIndent: 30, color: Colors.black, thickness: 0.4),
          Text("Optik"),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';

class MainButton extends StatefulWidget {
  final Function() onTap;
  final bool disabled;
  final bool answerKeyValid;
  final String title;
  final String subtitle;
  final String imagePath;

  const MainButton({
    super.key,
    required this.onTap,
    this.disabled = false,
    required this.answerKeyValid,
    required this.title,
    required this.subtitle,
    required this.imagePath,
  });

  @override
  State<MainButton> createState() => _MainButtonState();
}

class _MainButtonState extends State<MainButton> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 18),
        height: 186,
        decoration: BoxDecoration(
          color: !widget.disabled
              ? const Color(0xFFFFFFFF)
              : const Color(0xFFD9D9D9),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            width: 1,
            color: const Color(0xFFD9D9D9),
          ),
          boxShadow: [
            BoxShadow(
              color: const Color(0xFF000000).withOpacity(0.25),
              blurRadius: 6,
              spreadRadius: -3,
              offset: const Offset(0, 2),
            ),
          ]
        ),
        child: Row(
          children: [
            SizedBox(
              width: 120,
              height: 120,
              child: Image.asset(widget.imagePath, fit: BoxFit.fill),
            ),
            Container(
              margin: const EdgeInsets.only(top:30, left: 20),
              width: 180,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(widget.title,
                    style: const TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      height: 0
                    ),
                  ),
                  const SizedBox(height: 2),
                  !widget.answerKeyValid
                      ? Text(widget.subtitle,
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color: !widget.disabled ? const Color(0xFFAAAAAA) : const Color(0xFF920707),
                        ),
                      )
                      : const SizedBox(height: 32),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

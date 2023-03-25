import 'package:flutter/material.dart';

class TimeButton extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;

  const TimeButton({super.key, required this.label, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        TextButton(
          onPressed: onPressed,
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(
              Colors.black,
            ),
          ),
          child: Text(
            label,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        const SizedBox(width: 20)
      ],
    );
  }
}

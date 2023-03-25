import 'package:flutter/material.dart';

class ModeButton extends StatelessWidget {
  final bool isMode;
  final String label;
  final VoidCallback switchMode;

  const ModeButton(
      {super.key,
      required this.isMode,
      required this.label,
      required this.switchMode});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: 40,
      height: 40,
      decoration: BoxDecoration(
        boxShadow: List.generate(
          isMode ? 3 : 0,
          (index) => BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 2,
            offset: const Offset(0, 2),
          ),
        ),
        border: isMode
            ? Border.all(
                color: Colors.black,
                width: 3,
              )
            : null,
        borderRadius: BorderRadius.circular(50),
        color: Theme.of(context).cardColor,
      ),
      child: TextButton(
        onPressed: switchMode,
        child: Container(
          alignment: Alignment.center,
          child: Text(
            label,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 15,
              color: Colors.black,
            ),
          ),
        ),
      ),
    );
  }
}

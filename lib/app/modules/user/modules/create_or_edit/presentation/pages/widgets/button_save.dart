import 'package:eduqhub_test/core/constants/app_theme.dart';
import 'package:flutter/material.dart';

class ButtonSave extends StatelessWidget {
  const ButtonSave({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          boxShadow: const [
            BoxShadow(
              color: shadowColor2,
              spreadRadius: 1,
              blurRadius: 3,
              offset: Offset(0, 1),
            ),
            BoxShadow(
              color: shadowColor1,
              spreadRadius: 0,
              blurRadius: 0,
              offset: Offset(0, 5),
            )
          ]),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.0),
          ),
          backgroundColor: green,
          // Background color
        ),
        onPressed: () {
          // Respond to button press
        },
        child: const Text("Salvar"),
      ),
    );
  }
}

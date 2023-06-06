import 'package:eduqhub_test/core/constants/app_theme.dart';
import 'package:flutter/material.dart';

class ButtonSave extends StatelessWidget {
  final void Function() onClick;
  const ButtonSave({super.key, required this.onClick});

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
        ),
        onPressed: onClick,
        child: const Text("Salvar"),
      ),
    );
  }
}

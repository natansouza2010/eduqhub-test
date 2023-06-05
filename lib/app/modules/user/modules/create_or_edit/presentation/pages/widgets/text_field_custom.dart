import 'package:eduqhub_test/core/constants/app_theme.dart';
import 'package:flutter/material.dart';

class TextFieldCustom extends StatelessWidget {
  const TextFieldCustom({super.key});

  @override
  Widget build(BuildContext context) {
    return const TextField(
      decoration: InputDecoration(
        filled: true,
        fillColor: grey,
        border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(16))),
        hintText: 'Enter a search term',
      ),
    );
  }
}

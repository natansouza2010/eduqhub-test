import 'package:eduqhub_test/core/constants/app_theme.dart';
import 'package:flutter/material.dart';

class DropdownCustom<T> extends StatelessWidget {
  final List<T> listOfItems;
  final String hint;
  final T? initialValue;
  final void Function(T?)? onChanged;

  const DropdownCustom({
    Key? key,
    required this.listOfItems,
    required this.hint,
    this.initialValue,
    this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: textFormField,
      ),
      child: DropdownButtonFormField<T>(
          value: itens(context).contains(initialValue) ? initialValue : null,
          hint: Padding(
            padding: const EdgeInsets.only(left: 20.0),
            child: Text(
              hint,
              style: const TextStyle(color: Colors.black),
            ),
          ),
          borderRadius: BorderRadius.circular(16),
          decoration: const InputDecoration(
            fillColor: Colors.red,
            border: InputBorder.none,
          ),
          icon: Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: Image.asset('assets/images/arrow.png'),
          ),
          items: itens(context),
          onChanged: onChanged),
    );
  }

  List<DropdownMenuItem<T>> itens(BuildContext context) {
    final itens = listOfItems.map<DropdownMenuItem<T>>((T value) {
      return DropdownMenuItem<T>(value: value, child: Text(value.toString()));
    }).toList();
    return itens;
  }
}

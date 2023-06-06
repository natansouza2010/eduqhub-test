import 'package:eduqhub_test/core/constants/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TextFieldCustom extends StatelessWidget {
  final String? Function(String?)? validator;
  final List<TextInputFormatter>? mask;
  final String label;
  final Widget? iconPrefix;
  final double? height;
  final bool? hasIcon;
  final void Function(String?) onChange;
  const TextFieldCustom(
      {super.key,
      required this.label,
      this.iconPrefix,
      this.height,
      this.hasIcon,
      required this.onChange,
      this.mask,
      this.validator});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator,
      inputFormatters: mask,
      onChanged: onChange,
      maxLines: null,
      decoration: InputDecoration(
        contentPadding:
            height != null ? EdgeInsets.only(bottom: height!, left: 20) : null,
        prefixIcon: hasIcon == null ? iconPrefix : null,
        filled: true,
        fillColor: textFormField,
        enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.transparent),
            borderRadius: BorderRadius.all(Radius.circular(16))),
        focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.transparent),
            borderRadius: BorderRadius.all(Radius.circular(16))),
        border: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.transparent),
            borderRadius: BorderRadius.all(Radius.circular(16))),
        hintText: label,
      ),
    );
  }
}

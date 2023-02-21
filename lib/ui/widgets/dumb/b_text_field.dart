import 'package:flutter/material.dart';

class BTextField extends StatelessWidget {
  final TextEditingController controller;
  final FocusNode? focusNode;

  final String? hintText;
  final String? helperText;
  final String? errorText;

  final bool autofocus;
  final bool obscureText;

  final void Function(String)? onChanged;
  final void Function()? onEditingComplete;

  const BTextField({
    super.key,
    required this.controller,
    this.focusNode,
    this.hintText,
    this.helperText,
    this.errorText,
    this.autofocus = false,
    this.obscureText = false,
    this.onChanged,
    this.onEditingComplete,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      focusNode: focusNode,
      autofocus: autofocus,
      cursorWidth: 2,
      cursorRadius: const Radius.circular(2.0),
      showCursor: controller.text.isNotEmpty,
      textAlignVertical: TextAlignVertical.center,
      textAlign: TextAlign.center,
      obscureText: obscureText,
      decoration: InputDecoration(
        hintText: hintText,
        helperText: helperText,
        errorText: errorText,
        errorMaxLines: 3,
      ),
      onChanged: onChanged,
      onEditingComplete: onEditingComplete,
    );
  }
}

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
    const TextStyle textStyle = TextStyle(
      fontSize: 20,
      height: 30 / 20,
      fontWeight: FontWeight.w500,
      color: Colors.black,
    );

    final TextStyle helperTextStyle = TextStyle(
      fontSize: 12,
      height: 14 / 12,
      fontWeight: FontWeight.w400,
      color: Colors.blueGrey.shade800,
    );

    final TextStyle errorTextStyle = helperTextStyle.copyWith(
      color: Colors.red,
    );

    final TextStyle hintTextStyle = textStyle.copyWith(
      color: Colors.blueGrey.shade300,
    );

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
      style: textStyle,
      cursorColor: Colors.blueGrey.shade400,
      decoration: InputDecoration(
        hintText: hintText,
        helperText: helperText,
        errorText: errorText,
        errorMaxLines: 3,
        hintStyle: hintTextStyle,
        helperStyle: helperTextStyle,
        errorStyle: errorTextStyle,
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.blueGrey.shade100),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            width: 1.5,
            color: Colors.blueGrey.shade400,
          ),
        ),
      ),
      onChanged: onChanged,
      onEditingComplete: onEditingComplete,
    );
  }
}

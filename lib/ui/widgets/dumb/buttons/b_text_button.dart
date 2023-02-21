import 'package:flutter/material.dart';

class BTextButton extends StatelessWidget {
  final String text;

  final void Function()? onTap;

  const BTextButton({
    super.key,
    required this.text,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

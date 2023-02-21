// ignore_for_file: unused_element

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BFilledButton extends StatelessWidget {
  final String? text;
  final IconData? icon;

  final bool fillWidth;
  final EdgeInsetsGeometry? margin;

  final void Function()? onTap;

  const BFilledButton({
    super.key,
    this.text,
    this.icon,
    this.fillWidth = false,
    this.margin,
    this.onTap,
  }) : assert((text != null || icon != null),
            'Button needs to have either text or icon.');

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      padding: EdgeInsets.zero,
      onPressed: onTap,
      child: Container(
        margin: margin,
        width: fillWidth ? double.infinity : null,
        padding: _padding(),
        decoration: BoxDecoration(
          color: Colors.green,
          borderRadius: BorderRadius.circular(100.0),
        ),
        child: text != null
            ? _TextContent(text: text!)
            : _IconContent(icon: icon!),
      ),
    );
  }

  EdgeInsetsGeometry _padding() {
    if (text != null) {
      return const EdgeInsets.symmetric(vertical: 12.0, horizontal: 14.0);
    } else {
      return const EdgeInsets.all(6.0);
    }
  }
}

class _TextContent extends StatelessWidget {
  final String text;

  const _TextContent({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(
        fontSize: 16,
        color: Colors.white,
      ),
      textAlign: TextAlign.center,
    );
  }
}

class _IconContent extends StatelessWidget {
  final IconData icon;

  const _IconContent({
    super.key,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Icon(
      icon,
      color: Colors.white,
    );
  }
}

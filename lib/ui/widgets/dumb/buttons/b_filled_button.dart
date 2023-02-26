// ignore_for_file: unused_element

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BFilledButton extends StatelessWidget {
  final String? text;
  final IconData? icon;

  final bool isBusy;
  final bool fillWidth;
  final bool isOutlined;
  final EdgeInsetsGeometry? margin;
  final Color? contentColor;
  final Color? backgroundColor;
  final Color? borderColor;

  final void Function()? onTap;

  const BFilledButton({
    super.key,
    this.text,
    this.icon,
    this.isBusy = false,
    this.fillWidth = false,
    this.isOutlined = false,
    this.margin,
    this.contentColor,
    this.backgroundColor,
    this.borderColor,
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
        constraints: const BoxConstraints(minHeight: 44.0, minWidth: 44.0),
        decoration: BoxDecoration(
          color: isOutlined
              ? Colors.white
              : backgroundColor ?? Colors.blueGrey.shade500,
          borderRadius: BorderRadius.circular(100.0),
          border: Border.all(
            width: 1.0,
            color: isOutlined
                ? borderColor ?? Colors.blueGrey.shade300
                : Colors.transparent,
          ),
        ),
        child: isBusy
            ? Center(
                child: SizedBox(
                  width: 16.0,
                  height: 16.0,
                  child: CircularProgressIndicator(
                    strokeWidth: 2.0,
                    color: contentColor ??
                        (isOutlined ? Colors.blueGrey.shade500 : Colors.white),
                  ),
                ),
              )
            : text != null
                ? _TextContent(
                    text: text!,
                    isOutlined: isOutlined,
                    color: contentColor,
                  )
                : _IconContent(
                    icon: icon!,
                    isOutlined: isOutlined,
                    color: contentColor,
                  ),
      ),
    );
  }

  EdgeInsetsGeometry _padding() {
    if (text != null) {
      return const EdgeInsets.symmetric(vertical: 14.0, horizontal: 16.0);
    } else {
      return const EdgeInsets.all(6.0);
    }
  }
}

class _TextContent extends StatelessWidget {
  final String text;
  final bool isOutlined;
  final Color? color;

  const _TextContent({
    super.key,
    required this.text,
    required this.isOutlined,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: 18,
        height: 1.0,
        color: color ?? (isOutlined ? Colors.blueGrey.shade500 : Colors.white),
        fontWeight: FontWeight.w500,
      ),
      textAlign: TextAlign.center,
    );
  }
}

class _IconContent extends StatelessWidget {
  final IconData icon;
  final bool isOutlined;
  final Color? color;

  const _IconContent({
    super.key,
    required this.icon,
    required this.isOutlined,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Icon(
      icon,
      color: color ?? (isOutlined ? Colors.blueGrey.shade500 : Colors.white),
    );
  }
}

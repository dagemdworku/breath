import 'package:flutter/material.dart';

class BBadge extends StatelessWidget {
  final String text;

  const BBadge({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    final TextStyle textStyle = TextStyle(
      fontFamily: 'Roboto',
      fontSize: 18,
      height: 1.0,
      fontWeight: FontWeight.w500,
      color: Colors.blueGrey.shade900,
    );

    return Material(
      color: Colors.blueGrey.shade100,
      borderRadius: BorderRadius.circular(50.0),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        child: Text(
          text,
          style: textStyle,
        ),
      ),
    );
  }
}

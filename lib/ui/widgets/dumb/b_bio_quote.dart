import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

const double _iconSize = 25.0;

class BBioQuote extends StatelessWidget {
  final String? text;

  const BBioQuote({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    final Color iconColor = Colors.blueGrey.shade700;

    final TextStyle textStyle = TextStyle(
      fontFamily: 'Roboto',
      fontSize: 20,
      height: 30 / 20,
      fontWeight: FontWeight.w500,
      color: Colors.blueGrey.shade900,
    );
    return Text.rich(
      TextSpan(
        children: [
          WidgetSpan(
            child: Icon(
              Icons.format_quote_rounded,
              color: iconColor,
              size: _iconSize,
            ),
          ),
          const WidgetSpan(
            child: SizedBox(width: 8.0),
          ),
          TextSpan(
            text: text,
            style: textStyle,
          ),
          const WidgetSpan(
            child: SizedBox(width: 8.0),
          ),
          WidgetSpan(
            child: Icon(
              Icons.format_quote_rounded,
              color: iconColor,
              size: _iconSize,
            ),
          ),
        ],
      ),
    );
  }
}

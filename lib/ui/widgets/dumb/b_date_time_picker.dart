import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BDateTimePicker extends StatelessWidget {
  final void Function(DateTime) onDateTimeChanged;

  final DateTime? initialDateTime;

  final int? minimumYear;
  final int? maximumYear;

  final double? maxHeight;

  const BDateTimePicker({
    super.key,
    required this.onDateTimeChanged,
    this.initialDateTime,
    this.minimumYear,
    this.maximumYear,
    this.maxHeight,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(maxHeight: maxHeight ?? 500.0),
      child: ShaderMask(
        shaderCallback: (Rect rect) {
          return const LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.white,
              Colors.white,
              Colors.transparent,
              Colors.transparent,
              Colors.white,
              Colors.white,
            ],
            stops: [0.0, 0.1, 0.3, 0.7, 0.9, 1.0],
          ).createShader(rect);
        },
        blendMode: BlendMode.dstOut,
        child: CupertinoDatePicker(
          initialDateTime: initialDateTime,
          dateOrder: DatePickerDateOrder.mdy,
          mode: CupertinoDatePickerMode.date,
          minimumYear: minimumYear ?? 1,
          maximumYear: maximumYear,
          onDateTimeChanged: onDateTimeChanged,
        ),
      ),
    );
  }
}

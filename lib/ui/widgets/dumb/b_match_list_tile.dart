import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BMatchListTile extends StatelessWidget {
  final String name;
  final String progress;

  final void Function()? onTap;

  const BMatchListTile({
    super.key,
    required this.name,
    required this.progress,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final TextStyle nameTextStyle = TextStyle(
      fontSize: 20,
      height: 22 / 20,
      fontWeight: FontWeight.w500,
      color: Colors.blueGrey.shade900,
    );
    final TextStyle progressTextStyle = TextStyle(
      fontSize: 16,
      height: 20 / 16,
      fontWeight: FontWeight.w400,
      color: Colors.blueGrey.shade600,
    );

    return CupertinoButton(
      padding: EdgeInsets.zero,
      onPressed: onTap,
      child: Padding(
        padding: const EdgeInsets.only(right: 8.0),
        child: Row(
          children: [
            Material(
              color: Colors.blueGrey.shade100,
              borderRadius: BorderRadius.circular(100),
              child: const SizedBox(
                width: 50.0,
                height: 50.0,
              ),
            ),
            const SizedBox(width: 12.0),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: nameTextStyle,
                  ),
                  Text(
                    progress,
                    style: progressTextStyle,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

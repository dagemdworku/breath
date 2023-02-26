import 'dart:math';

import 'package:breath/breath.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'home_viewmodel.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);

    return ViewModelBuilder<HomeViewModel>.reactive(
      builder: (context, model, child) => Scaffold(
        body: LayoutBuilder(
          builder: (context, constraints) {
            final double layoutWidth = constraints.maxWidth;
            final double layoutHeight = constraints.maxHeight;

            final double appBarMaxSize = max(layoutWidth, layoutHeight / 2);

            return Material(
              color: themeData.scaffoldBackgroundColor,
              child: CustomScrollView(
                slivers: [
                  BUserAppBar(
                    appBarMaxSize: appBarMaxSize,
                  ),
                  const SliverFillRemaining(
                    hasScrollBody: false,
                    child: _UserInformation(),
                  ),
                ],
              ),
            );
          },
        ),
      ),
      viewModelBuilder: () => HomeViewModel(),
    );
  }
}

class _UserInformation extends StatelessWidget {
  const _UserInformation({super.key});

  @override
  Widget build(BuildContext context) {
    final TextStyle nameStyle = TextStyle(
      fontFamily: 'Roboto',
      fontSize: 48,
      height: 60 / 48,
      fontWeight: FontWeight.w400,
      color: Colors.blueGrey.shade900,
    );

    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text('Dagem D', style: nameStyle),
          Text('Worku', style: nameStyle.copyWith(fontWeight: FontWeight.w600)),
          const SizedBox(height: 8.0),
          const _Information(text: 'City', icon: CupertinoIcons.house_alt_fill),
          const _Information(text: 'Job Title', icon: Icons.business_center),
          const SizedBox(height: 8.0),
          const BBioQuote(
            text:
                'Sunt ad pariatur proident excepteur amet nulla laborum. Et mollit consectetur ullamco esse fugiat ea est elit adipisicing commodo ullamco mollit laborum quis. Eu dolor incididunt nisi pariatur amet officia culpa cillum ipsum nisi.',
          ),
          const SizedBox(height: 16.0),
          const _Interests(
            interests: ['Reading books', 'Singing', 'Dancing', 'Shopping'],
          ),
          const SizedBox(height: 24.0),
          _Actions(
            onAccept: () {},
            onReject: () {},
          ),
        ],
      ),
    );
  }
}

class _Information extends StatelessWidget {
  final String text;
  final IconData icon;

  const _Information({
    super.key,
    required this.text,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    final TextStyle textStyle = TextStyle(
      fontFamily: 'Roboto',
      fontSize: 20.0,
      height: 30 / 20,
      fontWeight: FontWeight.w400,
      color: Colors.blueGrey.shade800,
    );

    return Row(
      children: [
        Icon(
          icon,
          size: 20.0,
          color: Colors.blueGrey.shade700,
        ),
        const SizedBox(width: 8.0),
        Text(text, style: textStyle)
      ],
    );
  }
}

class _Actions extends StatelessWidget {
  final void Function() onAccept;
  final void Function() onReject;

  const _Actions({super.key, required this.onAccept, required this.onReject});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: BFilledButton(
            text: 'not for me',
            isOutlined: true,
            fillWidth: true,
            onTap: onReject,
          ),
        ),
        const SizedBox(width: 12.0),
        Expanded(
          child: BFilledButton(
            text: 'go on a date',
            fillWidth: true,
            onTap: onAccept,
          ),
        )
      ],
    );
  }
}

class _Interests extends StatelessWidget {
  final List<String> interests;

  const _Interests({
    super.key,
    required this.interests,
  });

  @override
  Widget build(BuildContext context) {
    return Wrap(
      runSpacing: 8.0,
      spacing: 8.0,
      children: interests
          .map(
            (interest) => BBadge(
              text: interest,
            ),
          )
          .toList(),
    );
  }
}

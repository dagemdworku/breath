import 'dart:math';

import 'package:breath/breath.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'match_viewmodel.dart';

enum _MatchStatus {
  completed,
  inProgress,
  onHold,
}

class MatchView extends StatelessWidget {
  final String matchId;

  const MatchView({Key? key, required this.matchId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);

    return ViewModelBuilder<MatchViewModel>.reactive(
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
                    goBack: model.goBack,
                  ),
                  const SliverFillRemaining(
                    hasScrollBody: false,
                    child: _MatchInformation(),
                  ),
                ],
              ),
            );
          },
        ),
      ),
      viewModelBuilder: () => MatchViewModel(),
    );
  }
}

class _MatchInformation extends StatelessWidget {
  const _MatchInformation({super.key});

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
          const SizedBox(height: 12.0),
          const _Progress(
            date: '02/26',
            progress: 'you matched with name name',
            status: _MatchStatus.completed,
          ),
          const SizedBox(height: 24.0),
          const _Progress(
            progress: 'you pay for your date',
            status: _MatchStatus.inProgress,
          ),
          const SizedBox(height: 24.0),
          const _Progress(
            progress: 'date is picked',
            status: _MatchStatus.onHold,
          ),
          const SizedBox(height: 24.0),
          const _Progress(
            progress: 'waiting on location reveal',
            status: _MatchStatus.onHold,
          ),
          const SizedBox(height: 24.0),
          const _Progress(
            progress: 'the day of the date',
            status: _MatchStatus.onHold,
          ),
          const SizedBox(height: 32.0),
        ],
      ),
    );
  }
}

class _Progress extends StatelessWidget {
  final String progress;
  final _MatchStatus status;
  final String? date;

  const _Progress({
    super.key,
    required this.progress,
    required this.status,
    this.date,
  });

  @override
  Widget build(BuildContext context) {
    final TextStyle dateStyle = TextStyle(
      fontFamily: 'Roboto',
      fontSize: 12,
      height: 18 / 12,
      fontWeight: FontWeight.w400,
      color: Colors.blueGrey.shade800,
    );

    final TextStyle progressStyle = TextStyle(
      fontFamily: 'Roboto',
      fontSize: 18,
      height: 24 / 18,
      fontWeight: FontWeight.w500,
      color: Colors.blueGrey.shade500,
      leadingDistribution: TextLeadingDistribution.even,
    );
    return Row(
      children: [
        SizedBox(
          width: 35,
          child: Text(
            date ?? '',
            style: dateStyle,
            textAlign: TextAlign.end,
          ),
        ),
        const SizedBox(width: 16.0),
        Material(
          color: _statusColor(),
          borderRadius: BorderRadius.circular(15.0),
          child: SizedBox(
            width: 30.0,
            height: 30.0,
            child: status == _MatchStatus.completed
                ? const Icon(
                    Icons.done,
                    size: 15.0,
                    color: Colors.white,
                  )
                : null,
          ),
        ),
        const SizedBox(width: 16.0),
        Expanded(
          child: Text(
            progress,
            style: progressStyle.copyWith(
              color: status == _MatchStatus.onHold
                  ? null
                  : Colors.blueGrey.shade800,
            ),
          ),
        ),
      ],
    );
  }

  Color _statusColor() {
    switch (status) {
      case _MatchStatus.completed:
        return Colors.blueGrey.shade500;
      case _MatchStatus.inProgress:
        return Colors.blueGrey.shade400;
      case _MatchStatus.onHold:
        return Colors.blueGrey.shade100;
    }
  }
}

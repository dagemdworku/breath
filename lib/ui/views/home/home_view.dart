import 'dart:math';

import 'package:breath/breath.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import 'home_viewmodel.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);

    return ViewModelBuilder<HomeViewModel>.reactive(
      onViewModelReady: (viewModel) => viewModel.onViewModelReady(),
      builder: (context, model, child) => Scaffold(
        body: LayoutBuilder(
          builder: (context, constraints) {
            final double layoutWidth = constraints.maxWidth;
            final double layoutHeight = constraints.maxHeight;

            final double appBarMaxSize = max(layoutWidth, layoutHeight / 2);

            return AnimatedCrossFade(
              duration: const Duration(milliseconds: 300),
              crossFadeState: model.user == null
                  ? CrossFadeState.showSecond
                  : CrossFadeState.showFirst,
              firstChild: SizedBox(
                width: layoutWidth,
                height: layoutHeight,
                child: Material(
                  color: themeData.scaffoldBackgroundColor,
                  child: CustomScrollView(
                    slivers: [
                      BUserAppBar(
                        appBarMaxSize: appBarMaxSize,
                      ),
                      SliverFillRemaining(
                        hasScrollBody: false,
                        child: _UserInformation(
                          user: model.user,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              secondChild: _Loading(
                layoutWidth: layoutWidth,
                appBarHeight: appBarMaxSize + 24.0,
                nameHeight: 45.0,
                bioHeight: 100.0,
                othersHeight: 22.0,
              ),
            );
          },
        ),
      ),
      viewModelBuilder: () => HomeViewModel(),
    );
  }
}

class _Loading extends StatelessWidget {
  final double layoutWidth;
  final double appBarHeight;
  final double nameHeight;
  final double bioHeight;
  final double othersHeight;

  const _Loading({
    super.key,
    required this.layoutWidth,
    required this.appBarHeight,
    required this.nameHeight,
    required this.bioHeight,
    required this.othersHeight,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Shimmer.fromColors(
        baseColor: Colors.blueGrey.shade100,
        highlightColor: Colors.blueGrey.shade50,
        enabled: true,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Material(
              color: Colors.white,
              child: SizedBox(
                height: appBarHeight,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _getShimmer(
                    const Key('first_name_shimmer'),
                    max(100.0, layoutWidth / 2) + 50,
                    nameHeight,
                  ),
                  const SizedBox(height: 8.0),
                  _getShimmer(
                    const Key('last_name_shimmer'),
                    max(100.0, layoutWidth / 2),
                    nameHeight,
                  ),
                  const SizedBox(height: 8.0),
                  _getShimmer(
                    const Key('city_shimmer'),
                    max(100.0, layoutWidth / 2) + 30,
                    othersHeight,
                  ),
                  const SizedBox(height: 8.0),
                  _getShimmer(
                    const Key('job_title_shimmer'),
                    max(100.0, layoutWidth / 2) + 40,
                    othersHeight,
                  ),
                  const SizedBox(height: 8.0),
                  _getShimmer(
                    const Key('bio_shimmer'),
                    double.infinity,
                    bioHeight,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _getShimmer(Key key, double width, double height) {
    return Material(
      key: key,
      color: Colors.white,
      borderRadius: BorderRadius.circular(8.0),
      child: SizedBox(
        width: width,
        height: height,
      ),
    );
  }
}

class _UserInformation extends StatelessWidget {
  final User? user;

  const _UserInformation({
    super.key,
    required this.user,
  });

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
          Text(user?.firstName ?? '', style: nameStyle),
          Text(user?.lastName ?? '',
              style: nameStyle.copyWith(fontWeight: FontWeight.w600)),
          const SizedBox(height: 8.0),
          _Information(text: user?.city, icon: CupertinoIcons.house_alt_fill),
          _Information(text: user?.jobTitle, icon: Icons.business_center),
          const SizedBox(height: 8.0),
          BBioQuote(
            text: user?.bio,
          ),
          const SizedBox(height: 16.0),
          _Interests(interests: user?.hobbies),
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
  final String? text;
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
        Text(text ?? '', style: textStyle)
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
  final List<String>? interests;

  const _Interests({
    super.key,
    required this.interests,
  });

  @override
  Widget build(BuildContext context) {
    return Wrap(
      runSpacing: 8.0,
      spacing: 8.0,
      children: (interests ?? [])
          .map(
            (interest) => BBadge(
              text: interest,
            ),
          )
          .toList(),
    );
  }
}

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedRouterGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:breath/breath.dart' as _i2;
import 'package:flutter/cupertino.dart' as _i4;
import 'package:flutter/foundation.dart' as _i5;
import 'package:flutter/material.dart';
import 'package:stacked/src/code_generation/router_annotation/transitions_builders.dart'
    as _i3;
import 'package:stacked/stacked.dart' as _i1;
import 'package:stacked_services/stacked_services.dart' as _i6;

class Routes {
  static const startupView = '/';

  static const authenticationView = '/authentication-view';

  static const wrapperView = '/wrapper-view';

  static const matchView = '/match-view';

  static const all = <String>{
    startupView,
    authenticationView,
    wrapperView,
    matchView,
  };
}

class StackedRouter extends _i1.RouterBase {
  final _routes = <_i1.RouteDef>[
    _i1.RouteDef(
      Routes.startupView,
      page: _i2.StartupView,
    ),
    _i1.RouteDef(
      Routes.authenticationView,
      page: _i2.AuthenticationView,
    ),
    _i1.RouteDef(
      Routes.wrapperView,
      page: _i2.WrapperView,
    ),
    _i1.RouteDef(
      Routes.matchView,
      page: _i2.MatchView,
    ),
  ];

  final _pagesMap = <Type, _i1.StackedRouteFactory>{
    _i2.StartupView: (data) {
      return PageRouteBuilder<dynamic>(
        pageBuilder: (context, animation, secondaryAnimation) =>
            const _i2.StartupView(),
        settings: data,
        transitionsBuilder: data.transition ?? _i3.TransitionsBuilders.fadeIn,
      );
    },
    _i2.AuthenticationView: (data) {
      return PageRouteBuilder<dynamic>(
        pageBuilder: (context, animation, secondaryAnimation) =>
            const _i2.AuthenticationView(),
        settings: data,
        transitionsBuilder: data.transition ?? _i3.TransitionsBuilders.fadeIn,
      );
    },
    _i2.WrapperView: (data) {
      return PageRouteBuilder<dynamic>(
        pageBuilder: (context, animation, secondaryAnimation) =>
            const _i2.WrapperView(),
        settings: data,
        transitionsBuilder: data.transition ?? _i3.TransitionsBuilders.fadeIn,
      );
    },
    _i2.MatchView: (data) {
      final args = data.getArgs<MatchViewArguments>(nullOk: false);
      return _i4.CupertinoPageRoute<dynamic>(
        builder: (context) =>
            _i2.MatchView(key: args.key, matchId: args.matchId),
        settings: data,
      );
    },
  };

  @override
  List<_i1.RouteDef> get routes => _routes;
  @override
  Map<Type, _i1.StackedRouteFactory> get pagesMap => _pagesMap;
}

class MatchViewArguments {
  const MatchViewArguments({
    this.key,
    required this.matchId,
  });

  final _i5.Key? key;

  final String matchId;

  @override
  String toString() {
    return '{"key": "$key", "matchId": "$matchId"}';
  }
}

extension NavigatorStateExtension on _i6.NavigationService {
  Future<dynamic> navigateToStartupView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.startupView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToAuthenticationView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.authenticationView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToWrapperView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.wrapperView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToMatchView({
    _i5.Key? key,
    required String matchId,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.matchView,
        arguments: MatchViewArguments(key: key, matchId: matchId),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithStartupView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.startupView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithAuthenticationView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.authenticationView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithWrapperView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.wrapperView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithMatchView({
    _i5.Key? key,
    required String matchId,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(Routes.matchView,
        arguments: MatchViewArguments(key: key, matchId: matchId),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }
}

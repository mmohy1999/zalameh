import 'package:flutter/material.dart';

extension ContextTheme on BuildContext {
  double get width => MediaQuery.sizeOf(this).width;
  double get height => MediaQuery.sizeOf(this).height;
  //region Text Styles
  //region title
  TextStyle? textTitleLarge({required double fontSize, Color? color}) =>
      Theme.of(this).textTheme.titleLarge
          ?.copyWith(fontSize: fontSize)
          .copyWith(color: color);

  //endregion
  //region body
  TextStyle? textBodyLarge({required double fontSize, Color? color}) =>
      Theme.of(this).textTheme.bodyLarge
          ?.copyWith(fontSize: fontSize)
          .copyWith(color: color);

  //endregion
  //endregion
}

extension Navigation on BuildContext {
  Future<dynamic> pushNamed(String routeName, {Object? arguments}) {
    return Navigator.of(this).pushNamed(routeName, arguments: arguments);
  }

  Future<dynamic> pushReplacementNamed(String routeName, {Object? arguments}) {
    return Navigator.of(
      this,
    ).pushReplacementNamed(routeName, arguments: arguments);
  }

  Future<dynamic> pushNamedAndRemoveUntil(
    String routeName, {
    Object? arguments,
    required RoutePredicate predicate,
  }) {
    return Navigator.of(
      this,
    ).pushNamedAndRemoveUntil(routeName, predicate, arguments: arguments);
  }

  void pop() => Navigator.of(this).pop();

  void popToFirst() => Navigator.of(this).popUntil((route) => route.isFirst);
}

extension StringExtension on String? {
  bool isNotEmptyOrNull() => this != null && this!.isNotEmpty;
}

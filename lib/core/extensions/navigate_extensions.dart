import 'package:flutter/material.dart';

extension NavigateExtensions on BuildContext {
  Future<T?> pushNamed<T>(String routeName, {Object? arguments}) =>
      Navigator.pushNamed(this, routeName, arguments: arguments);

  Future<T?> pushReplacementNamed<T>(String routeName, {Object? arguments}) =>
      Navigator.pushReplacementNamed(this, routeName, arguments: arguments);

  Future<T?> pushNamedAndRemoveUntil<T>(
    String routeName, {
    Object? arguments,
  }) => Navigator.pushNamedAndRemoveUntil(
    this,
    routeName,
    (route) => false,
    arguments: arguments,
  );

  void pop<T extends Object?>([T? result]) => Navigator.pop(this, result);
}

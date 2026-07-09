import 'package:flutter/material.dart';

extension ConfigExtenstions on BuildContext {
  bool get isDarkMode => Theme.of(this).brightness == Brightness.dark;
  bool get isArabic => Localizations.localeOf(this).languageCode == 'ar';
}

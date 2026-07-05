import 'package:bawabak/app/bawabetak.dart';
import 'package:bawabak/core/database/cache/shared_preferences_helper.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPreferencesHelper().init();
  runApp(const Bawabetak());
}

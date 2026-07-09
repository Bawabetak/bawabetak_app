import 'package:bawabak/app/bawabetak.dart';
import 'package:bawabak/core/database/cache/shared_preferences_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Future.wait([
    SharedPreferencesHelper().init(),
    ScreenUtil.ensureScreenSize(),
  ]);
  runApp(const Bawabetak());
}

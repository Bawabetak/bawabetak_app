import 'package:bawabak/core/database/cache/shared_preferences_helper.dart';
import 'package:bawabak/core/utils/app_strings.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'theme_state.dart';

class ThemeCubit extends Cubit<ThemeState> {
  ThemeCubit() : super(ThemeInitial.init()) {
    getAppTheme();
  }

  void getAppTheme() {
    final appTheme = SharedPreferencesHelper().get(key: AppStrings.theme);
    emit(
      LoadAppThemeState(
        themeMode: ThemeMode.values[appTheme ?? ThemeMode.system.index],
      ),
    );
  }

  void changeTheme({required ThemeMode themeMode}) async {
    await SharedPreferencesHelper().set(
      key: AppStrings.theme,
      value: themeMode.index,
    );

    emit(ChangeAppThemeState(themeMode: themeMode));
  }
}

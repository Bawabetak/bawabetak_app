import 'package:bawabak/core/config/themes/app_theme.dart';
import 'package:bawabak/core/config/themes/manager/theme_cubit.dart';
import 'package:bawabak/core/utils/app_strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Bawabetak extends StatelessWidget {
  const Bawabetak({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ThemeCubit(),
      child: BlocBuilder<ThemeCubit, ThemeState>(
        buildWhen: (previous, current) =>
            previous.themeMode != current.themeMode,
        builder: (context, state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: AppStrings.appName,
            darkTheme: AppTheme.darkTheme,
            theme: AppTheme.lightTheme,
            themeMode: state.themeMode,
            home: const Scaffold(
              body: Center(child: Text('Welcome to Bawabetak!')),
            ),
          );
        },
      ),
    );
  }
}

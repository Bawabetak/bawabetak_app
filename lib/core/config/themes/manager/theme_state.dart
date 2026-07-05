part of 'theme_cubit.dart';

sealed class ThemeState {
  final ThemeMode themeMode;

  const ThemeState({required this.themeMode});
}

final class ThemeInitial extends ThemeState {
  const ThemeInitial({required super.themeMode});
  const ThemeInitial.init() : this(themeMode: ThemeMode.system);
}

final class LoadAppThemeState extends ThemeState {
  const LoadAppThemeState({required super.themeMode});
}

final class ChangeAppThemeState extends ThemeState {
  const ChangeAppThemeState({required super.themeMode});
}

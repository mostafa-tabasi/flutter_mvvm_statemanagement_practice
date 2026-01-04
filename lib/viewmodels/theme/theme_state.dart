part of 'theme_bloc.dart';

@immutable
sealed class ThemeState {}

final class ThemeInitial extends ThemeState {}

final class LightTheme extends ThemeState {
  final ThemeData themeData;

  LightTheme({required this.themeData});
}

final class DarkTheme extends ThemeState {
  final ThemeData themeData;

  DarkTheme({required this.themeData});
}

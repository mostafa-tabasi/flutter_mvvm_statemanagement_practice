import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_mvvm_statemanagement_practice/constants/theme.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'theme_event.dart';
part 'theme_state.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  ThemeBloc() : super(ThemeInitial()) {
    on<LoadThemeEvent>(loadTheme);

    on<ToggleThemeEvent>(toggleTheme);
  }

  final prefsKeyIsDarkMode = "isDarkMode";

  Future<void> loadTheme(event, emit) async {
    final prefs = await SharedPreferences.getInstance();
    final isDarkMode = prefs.getBool(prefsKeyIsDarkMode) ?? false;
    if (isDarkMode) {
      emit(DarkTheme(themeData: AppThemeData.darkTheme));
    } else {
      emit(LightTheme(themeData: AppThemeData.lightTheme));
    }
  }

  Future<void> toggleTheme(event, emit) async {
    final prefs = await SharedPreferences.getInstance();
    final currentState = state;

    if (currentState is LightTheme) {
      await prefs.setBool(prefsKeyIsDarkMode, true);
      emit(DarkTheme(themeData: AppThemeData.darkTheme));
    } else {
      await prefs.setBool(prefsKeyIsDarkMode, false);
      emit(LightTheme(themeData: AppThemeData.lightTheme));
    }
  }
}

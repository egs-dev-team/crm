import 'package:egs/login/domain/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final themeModeProvider =
    StateNotifierProvider<ThemeModeNotifier, ThemeMode>((ref) {
      final user = ref.watch(userProvider);
      final isLogged = ref.watch(userProvider.notifier).isLogged;

  return ThemeModeNotifier(isLogged ? ((user?.is_dark ?? false) ? ThemeMode.dark : ThemeMode.light) : ThemeMode.dark);
});

class ThemeModeNotifier extends StateNotifier<ThemeMode> {
  ThemeModeNotifier(super.initialMode);

  void setThemeMode(ThemeMode mode) {
    state = mode;
  }

  void toggleThemeMode() {
    state = state == ThemeMode.dark ? ThemeMode.light : ThemeMode.dark;
  }
}

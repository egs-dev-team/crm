import 'package:animated_toggle_switch/animated_toggle_switch.dart';
import 'package:egs/core/api.dart';
import 'package:egs/core/const.dart';
import 'package:egs/header/theme/domain/theme_provider.dart';
import 'package:egs/login/domain/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ThemeSwitch extends ConsumerWidget {
  const ThemeSwitch({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(userProvider);
    final themeProvider = ref.watch(themeModeProvider.notifier);
    final theme = ref.watch(themeModeProvider);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
      child: AnimatedToggleSwitch<bool>.dual(
          current: theme == ThemeMode.dark,
          first: true,
          second: false,
          indicatorSize: const Size.fromWidth(40.0),
          animationDuration: const Duration(milliseconds: 500),
          style: ToggleStyle(
            borderColor: Colors.transparent,
            indicatorColor: Theme.of(context).colorScheme.surface,
            backgroundColor: Theme.of(context).colorScheme.secondary,
            borderRadius: BorderRadius.circular(10.0),
          ),
          customStyleBuilder: (context, local, global) {
            return ToggleStyle(
                backgroundColor: Theme.of(context).colorScheme.primary);
          },
          borderWidth: 6.0,
          onChanged: (value) async {
            bool needsToggle =
                await apiService.sendChangeTheme(isDark: value, user: user);
            if (needsToggle) {
              themeProvider.toggleThemeMode();
            }
          },
          iconBuilder: (value) => Icon(
              value ? Icons.nightlight_round : Icons.sunny,
              color: Theme.of(context).colorScheme.primary,
              size: 32.0),
          textBuilder: (value) => Center(
                child: FittedBox(
                  fit: BoxFit.scaleDown,
                  child: Text(
                    value ? 'Темная' : 'Светлая',
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.surface,
                      fontSize: 16.0,
                    ),
                  ),
                ),
              )),
    );
  }
}

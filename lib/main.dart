import 'package:egs/core/api.dart';
import 'package:egs/core/prefs.dart';
import 'package:egs/core/routes.dart';
import 'package:egs/header/theme/data/theme.dart';
import 'package:egs/header/theme/domain/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:responsive_framework/responsive_framework.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  prefs = Prefs();
  apiService = ApiService();
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeMode = ref.watch(themeModeProvider);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'ЭГС',
      initialRoute: '/login',
      theme: theme,
      darkTheme: darkTheme,
      themeMode: themeMode,
      onGenerateRoute: (RouteSettings settings) {
        return RouteGenerator.generateRoute(settings);
      },
      builder: (context, child) => ResponsiveBreakpoints.builder(
        child: child!,
        breakpoints: [
          const Breakpoint(start: 0, end: 450, name: MOBILE),
          const Breakpoint(start: 451, end: double.infinity, name: DESKTOP),
        ],
      ),
    );
  }
}

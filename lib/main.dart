import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'screens/home.dart';

final _routes = GoRouter(initialLocation: '/', routes: [
  GoRoute(path: '/', builder: (context, state) => const HomeScreen()),
]);

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  runApp(EasyLocalization(
    path: 'assets/lang',
    supportedLocales: const [Locale('en'), Locale('fr')],
    fallbackLocale: const Locale('en'),
    child: const ProviderScope(child: MyApp()),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: _routes,
      locale: context.locale,
      title: 'Point of Sale',
      theme: MyTheme.lightTheme,
      themeMode: ThemeMode.system,
      darkTheme: MyTheme.darkTheme,
      debugShowCheckedModeBanner: false,
      supportedLocales: context.supportedLocales,
      localizationsDelegates: context.localizationsDelegates,
    );
  }
}


import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'screens/home.dart';
import 'shared/theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  runApp(EasyLocalization(
    path: 'assets/lang',
    supportedLocales: const [Locale('en'), Locale('fr'), Locale('es')],
    fallbackLocale: const Locale('en'),
    child: ProviderScope(child: MyApp()),
  ));
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final _routes = {
    '/': (context) => HomeScreen(),
  };

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: _routes,
      locale: context.locale,
      title: 'Point of Sale',
      theme: MyTheme.lightTheme,
      themeMode: ThemeMode.system,
      darkTheme: MyTheme.darkTheme,
      debugShowCheckedModeBanner: false,
      supportedLocales: context.supportedLocales,
      localizationsDelegates: context.localizationDelegates,
    );
  }
}

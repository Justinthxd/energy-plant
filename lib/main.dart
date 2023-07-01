import 'package:energy_builder/config/router/router.dart';
import 'package:flutter/material.dart';

import 'config/theme/theme.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Energy Builder',
      routerConfig: router,
      theme: AppTheme.getTheme(),
    );
  }
}

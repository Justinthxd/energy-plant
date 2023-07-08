import 'package:energy_builder/config/router/router.dart';
import 'package:energy_builder/design/levels/level_1/provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'config/theme/theme.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => Level1Provider(),
        ),
      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        title: 'Energy Builder',
        routerConfig: router,
        theme: AppTheme.getTheme(),
      ),
    );
  }
}
// Hola ----------------------

import 'package:energy_builder/data/dictionary/dictionary.dart';
import 'package:energy_builder/design/pages/levels.dart';
import 'package:go_router/go_router.dart';
import '../../../design/pages/home.dart';

final router = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      name: '/',
      path: '/',
      builder: (context, state) => const Home(),
    ),
    GoRoute(
      name: '/levels',
      path: '/levels',
      builder: (context, state) => const Levels(),
    ),
    for (int i = 0; i < levels.length; i++)
      GoRoute(
        name: levels[i].route,
        path: levels[i].route,
        builder: (context, state) => levels[i].widget,
      ),
  ],
);

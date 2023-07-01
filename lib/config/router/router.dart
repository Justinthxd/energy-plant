import 'package:go_router/go_router.dart';

import '../../design/levels/level_1/level_1.dart';
import '../../design/pages/home.dart';

final router = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      name: '/',
      path: '/',
      builder: (context, state) => const Home(),
    ),
    GoRoute(
      name: '/level1',
      path: '/level1',
      builder: (context, state) => const Level1(),
    ),
  ],
);

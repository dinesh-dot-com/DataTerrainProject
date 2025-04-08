import 'package:go_router/go_router.dart';
import 'package:interview_project/screens/home/home_screen.dart';

import '../../screens/home/coming_soon_screen.dart';

final appRouter = GoRouter(
  initialLocation: '/',
  routes: [

    GoRoute(
      path: '/',
      name: 'home',

      builder: (context, state) => const HomeScreen(),
    ),

       GoRoute(
      path: '/programs',
      name: 'programs',

      builder: (context, state) => const ComingSoonScreen(),
    ),
      GoRoute(
      path: '/users',
      name: 'users',

      builder: (context, state) => const ComingSoonScreen(),
    ),
      GoRoute(
      path: '/requests',
      name: 'requests',

      builder: (context, state) => const ComingSoonScreen(),
    ),
  ],
);

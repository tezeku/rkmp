import 'package:go_router/go_router.dart';
import '../../presentation/screens/home/home_screen.dart';
import '../../presentation/screens/gallery/gallery_screen.dart';
import '../../presentation/screens/species/species_screen.dart';
import '../../presentation/screens/info/info_screen.dart';
import '../../presentation/screens/habitat/habitat_screen.dart';
import '../../presentation/screens/intro/intro_screen.dart';

final GoRouter appRouter = GoRouter(
  initialLocation: '/intro',
  routes: [
    GoRoute(
      path: '/',
      redirect: (context, state) => '/intro',
    ),
    GoRoute(
      path: '/intro',
      name: 'intro',
      builder: (context, state) => const IntroScreen(),
    ),
    GoRoute(
      path: '/home',
      name: 'home',
      builder: (context, state) => const HomeScreen(),
      routes: [
        GoRoute(
          path: 'gallery',
          name: 'gallery',
          builder: (context, state) => const GalleryScreen(),
        ),
        GoRoute(
          path: 'species',
          name: 'species',
          builder: (context, state) => const SpeciesScreen(),
        ),
        GoRoute(
          path: 'habitat',
          name: 'habitat',
          builder: (context, state) => const HabitatScreen(),
        ),
        GoRoute(
          path: 'info',
          name: 'info',
          builder: (context, state) => const InfoScreen(),
        ),
      ],
    ),
  ],
);
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../presentation/screens/gallery/cubit/gallery_cubit.dart';
import '../../presentation/screens/habitat/cubit/habitat_manager_cubit.dart';
import '../../presentation/screens/home/cubit/home_cubit.dart';
import '../../presentation/screens/info/cubit/facts_cubit.dart';
import '../../presentation/screens/species/cubit/penguin_cubit.dart';
import '../services/counter_observer.dart';
import 'app_router.dart';

void main() {
  Bloc.observer = const CounterObserver();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => HomeCubit()),
        BlocProvider(create: (context) => GalleryCubit()),
        BlocProvider(create: (context) => PenguinCubit()),
        BlocProvider(create: (context) => HabitatManagerCubit()),
        BlocProvider(create: (context) => FactsCubit()),
      ],
      child: MaterialApp.router(
        routerConfig: appRouter,
        title: 'Гид по пингвинам',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueGrey),
        ),
      ),
    );
  }
}
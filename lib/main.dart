import 'package:flutter/material.dart';
import 'app_router.dart';
import 'app_state.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return AppState(
      penguinCount: 18,
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
import 'package:flutter/material.dart';
import 'package:prac3/screens/GalleryScreen.dart';
import 'package:prac3/screens/HabitatScreen.dart';
import 'package:prac3/screens/HomeScreen.dart';
import 'package:prac3/screens/InfoScreen.dart';
import 'package:prac3/screens/SpeciesScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Гид по пингвинам',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueGrey),
      ),
      home: const MyHomePage(title: 'Главный экран',),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _currentScreenIndex = 0;

  final List<Widget> _screens = [
    const HomeScreen(),
    const InfoScreen(),
    const SpeciesScreen(),
    const HabitatScreen(),
    const GalleryScreen()
  ];

  void _changeScreen(int index) {
    setState(() {
      _currentScreenIndex = index;
    });
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Гид по Пингвинам'),
        backgroundColor: Colors.blue[100],
      ),
      body: _screens[_currentScreenIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentScreenIndex,
        onTap: _changeScreen,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Главная',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.info),
            label: 'Инфо',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.emoji_nature),
            label: 'Виды',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.public),
            label: 'Среда',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.photo_library),
            label: 'Галерея',
          ),
        ],
      ),
    );
  }
}

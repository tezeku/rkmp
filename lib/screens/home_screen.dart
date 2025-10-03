import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.anchor, size: 100, color: Colors.blue),
          const SizedBox(height: 30),
          const Text(
            'Добро пожаловать в мир пингвинов!',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 20),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: Text(
              'Исследуйте удивительный мир этих нелетающих птиц.',
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
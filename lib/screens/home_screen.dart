import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:prac3/screens/gallery_screen.dart';
import 'package:prac3/screens/habitat_screen.dart';
import 'package:prac3/screens/info_screen.dart';
import 'package:prac3/screens/species_screen.dart';

import 'intro_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Мир пингвинов'),
        backgroundColor: Colors.blue[100],
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () => Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) => const IntroScreen())
            ),
            tooltip: 'Выход',
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Card(
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Главный экран',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.blueGrey,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text('Добро пожаловать в приложение о пингвинах!'),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 20),

            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                children: [
                  _buildNavigationCard(
                    context,
                    'Галерея пингвинов',
                    Icons.photo_library,
                    Colors.blue,
                        () => Navigator.of(context).push(
                            MaterialPageRoute(
                                builder: (context) => const GalleryScreen()
                            )
                        ),
                  ),
                  _buildNavigationCard(
                    context,
                    'Виды пингвинов',
                    Icons.eco,
                    Colors.green,
                        () => Navigator.of(context).push(
                            MaterialPageRoute(
                                builder: (context) => const SpeciesScreen()
                            )
                        ),
                  ),
                  _buildNavigationCard(
                    context,
                    'Среда обитания',
                    Icons.public,
                    Colors.orange,
                        () => Navigator.of(context).push(
                            MaterialPageRoute(
                                builder: (context) => const HabitatScreen()
                            )
                        ),
                  ),
                  _buildNavigationCard(
                    context,
                    'Интересные факты',
                    Icons.info,
                    Colors.purple,
                        () => Navigator.of(context).push(
                            MaterialPageRoute(
                                builder: (context) => const InfoScreen()
                            )
                        ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildNavigationCard(
      BuildContext context,
      String title,
      IconData icon,
      Color color,
      VoidCallback onTap,
      ) {
    return Card(
      elevation: 4,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 40, color: color),
            const SizedBox(height: 10),
            Text(
              title,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
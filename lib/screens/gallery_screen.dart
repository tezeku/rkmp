import 'package:flutter/material.dart';

class GalleryScreen extends StatefulWidget {
  const GalleryScreen({super.key});

  @override
  State<GalleryScreen> createState() => _GalleryScreenState();
}

class _GalleryScreenState extends State<GalleryScreen> {
  final List<Map<String, String>> _penguins = [
    {
      'name': 'Императорский пингвин',
      'image': 'assets/images/penguins/p4.jpg',
    },
    {
      'name': 'Королевский пингвин',
      'image': 'assets/images/penguins/p5.jpg',
    },
    {
      'name': 'Пингвин Адели',
      'image': 'assets/images/penguins/p1.jpg',
    },
    {
      'name': 'Хохлатый пингвин',
      'image': 'assets/images/penguins/p3.jpg',
    },
    {
      'name': 'Галапагосский пингвин',
      'image': 'assets/images/penguins/p2.jpg',
    },
  ];

  int _currentPenguinIndex = 0;

  void _nextPenguin() {
    setState(() {
      _currentPenguinIndex = (_currentPenguinIndex + 1) % _penguins.length;
    });
  }

  @override
  Widget build(BuildContext context) {
    final currentPenguin = _penguins[_currentPenguinIndex];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Галерея пингвинов'),
        backgroundColor: Colors.blue[100],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '${_currentPenguinIndex + 1} / ${_penguins.length}',
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.grey,
              ),
            ),

            const SizedBox(height: 20),

            GestureDetector(
              onTap: _nextPenguin,
              child: Container(
                width: 300,
                height: 300,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.3),
                      blurRadius: 10,
                      offset: const Offset(0, 5),
                    ),
                  ],
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Image.asset(
                    currentPenguin['image']!,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return Container(
                        color: Colors.blue[50],
                        child: const Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.image, size: 50, color: Colors.blue),
                            SizedBox(height: 10),
                            Text('Фото не найдено'),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),

            const SizedBox(height: 20),

            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              decoration: BoxDecoration(
                color: Colors.blue[100],
                borderRadius: BorderRadius.circular(25),
              ),
              child: Text(
                currentPenguin['name']!,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            const SizedBox(height: 30),

            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.blue[50],
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.touch_app, size: 16, color: Colors.blue),
                  SizedBox(width: 8),
                  Text('Нажмите на фото для переключения'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
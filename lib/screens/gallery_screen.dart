import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:go_router/go_router.dart';

class GalleryScreen extends StatefulWidget {
  const GalleryScreen({super.key});

  @override
  State<GalleryScreen> createState() => _GalleryScreenState();
}

class _GalleryScreenState extends State<GalleryScreen> {
  final List<Map<String, String>> _penguins = [
    {
      'name': 'Императорский пингвин',
      'image': 'https://i.pinimg.com/736x/40/fd/82/40fd825f86f35d3034344b21c6a40aba.jpg',
    },
    {
      'name': 'Королевский пингвин',
      'image': 'https://i.pinimg.com/736x/e4/45/95/e44595eacfb5900ed00396eeeb09721d.jpg',
    },
    {
      'name': 'Пингвин Адели',
      'image': 'https://i.pinimg.com/736x/9a/46/13/9a4613c615a64ba3cb08452aa621fd6d.jpg',
    },
    {
      'name': 'Хохлатый пингвин',
      'image': 'https://www.worldatlas.com/r/w1200/upload/f7/99/1b/shutterstock-487262299.jpg',
    },
    {
      'name': 'Галапагосский пингвин',
      'image': 'https://imgs.mongabay.com/wp-content/uploads/sites/25/2017/04/21001447/conservacion-aves-galapagos-biodiversidad-1.jpg',
    },
  ];

  int _currentPenguinIndex = 0;

  void _nextPenguin() {
    setState(() {
      _currentPenguinIndex = (_currentPenguinIndex + 1) % _penguins.length;
    });
  }

  void _previousPenguin() {
    setState(() {
      _currentPenguinIndex = (_currentPenguinIndex - 1) % _penguins.length;
      if (_currentPenguinIndex < 0) {
        _currentPenguinIndex = _penguins.length - 1;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final currentPenguin = _penguins[_currentPenguinIndex];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Галерея пингвинов'),
        backgroundColor: Colors.blue[100],
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => context.pop(),
        ),
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

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  icon: const Icon(Icons.arrow_back_ios),
                  onPressed: _previousPenguin,
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: _nextPenguin,
                    child: Container(
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
                        child: CachedNetworkImage(
                          imageUrl: currentPenguin['image']!,
                          fit: BoxFit.cover,
                          progressIndicatorBuilder: (context, url, progress) =>
                              Center(
                                child: CircularProgressIndicator(
                                  value: progress.progress,
                                ),
                              ),
                          errorWidget: (context, url, error) => Container(
                            color: Colors.blue[50],
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Icon(Icons.error, size: 50, color: Colors.red),
                                const SizedBox(height: 10),
                                const Text('Ошибка загрузки'),
                                const SizedBox(height: 10),
                                Text(
                                  'URL: ${Uri.parse(url).host}',
                                  style: const TextStyle(fontSize: 12),
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.arrow_forward_ios),
                  onPressed: _nextPenguin,
                ),
              ],
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
          ],
        ),
      ),
    );
  }
}
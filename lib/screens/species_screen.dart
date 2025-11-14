import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:go_router/go_router.dart';
import '../service_locator.dart';

class SpeciesScreen extends StatefulWidget {
  const SpeciesScreen({super.key});

  @override
  State<SpeciesScreen> createState() => _SpeciesScreenState();
}

class _SpeciesScreenState extends State<SpeciesScreen> {
  final List<Map<String, dynamic>> _penguinSpecies = [
    {
      'name': 'Императорский пингвин',
      'description': 'Самый крупный вид, обитает в Антарктиде',
      'image': 'https://i.pinimg.com/736x/40/fd/82/40fd825f86f35d3034344b21c6a40aba.jpg',
    },
    {
      'name': 'Королевский пингвин',
      'description': 'Второй по величине, яркие оранжевые пятна',
      'image': 'https://i.pinimg.com/736x/e4/45/95/e44595eacfb5900ed00396eeeb09721d.jpg',
    },
    {
      'name': 'Пингвин Адели',
      'description': 'Небольшие пингвины с белым кольцом вокруг глаз',
      'image': 'https://i.pinimg.com/736x/9a/46/13/9a4613c615a64ba3cb08452aa621fd6d.jpg',
    },
  ];

  @override
  Widget build(BuildContext context) {
    final bool isServiceRegistered = locator.isRegistered<AppStateService>();

    String penguinCountText;
    if (isServiceRegistered) {
      final appStateService = locator.get<AppStateService>();
      penguinCountText = 'Всего видов пингвинов: ${appStateService.penguinCount}';
    } else {
      penguinCountText = 'Сервис не зарегистрирован';
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Виды пингвинов'),
        backgroundColor: Colors.blue[100],
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => context.pop(),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  children: [
                    const Icon(Icons.style, color: Colors.green),
                    const SizedBox(width: 10),
                    Text(
                      penguinCountText,
                      style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 20),

            Expanded(
              child: ListView.builder(
                itemCount: _penguinSpecies.length,
                itemBuilder: (context, index) {
                  final species = _penguinSpecies[index];
                  return Card(
                    margin: const EdgeInsets.only(bottom: 10),
                    child: ListTile(
                      leading: CircleAvatar(
                        radius: 25,
                        backgroundColor: Colors.blue[50],
                        child: CachedNetworkImage(
                          imageUrl: species['image'],
                          imageBuilder: (context, imageProvider) => Container(
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                image: imageProvider,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          placeholder: (context, url) => const CircularProgressIndicator(),
                          errorWidget: (context, url, error) => const Icon(Icons.broken_image),
                        ),
                      ),
                      title: Text(species['name']),
                      subtitle: Text(species['description']),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
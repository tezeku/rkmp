import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:go_router/go_router.dart';

class HabitatScreen extends StatefulWidget {
  const HabitatScreen({super.key});

  @override
  State<HabitatScreen> createState() => _HabitatScreenState();
}

class _HabitatScreenState extends State<HabitatScreen> {
  final List<Map<String, String>> _habitats = [
    {
      'name': 'Антарктида',
      'description': 'Основное место обитания императорских пингвинов',
      'image': 'https://png.klev.club/uploads/posts/2024-05/png-klev-club-mpai-p-antarktida-png-24.png',
    },
    {
      'name': 'Субантарктические острова',
      'description': 'Обитают королевские и хохлатые пингвины',
      'image': 'https://upload.wikimedia.org/wikipedia/commons/0/0b/Joinville-Stub-Picture.png',
    },
    {
      'name': 'Южная Америка',
      'description': 'Магеллановы и галапагосские пингвины',
      'image': 'https://www.clipartmax.com/png/middle/175-1754158_south-america-comments-flecha-para-adentro.png',
    },
  ];

  final TextEditingController _habitatController = TextEditingController();

  void _addHabitat() {
    final name = _habitatController.text;
    if (name.isNotEmpty) {
      setState(() {
        _habitats.add({
          'name': name,
          'description': 'Новый регион обитания пингвинов',
        });
      });
      _habitatController.clear();
    }
  }

  void _removeFirstHabitat() {
    if (_habitats.isNotEmpty) {
      setState(() {
        _habitats.removeAt(0);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Среда обитания'),
        backgroundColor: Colors.blue[100],
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: Column(
        children: [
          Container(
            height: 80,
            margin: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Colors.blue[50],
            ),
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.public, size: 30, color: Colors.blue),
                  const SizedBox(width: 10),
                  const Text(
                    'Среда обитания пингвинов',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue,
                    ),
                  ),
                ],
              ),
            ),
          ),

          Card(
            margin: const EdgeInsets.all(16),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Управление списком',
                          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 10),
                        Text('Элементов в списке: ${_habitats.length}'),
                      ],
                    ),
                  ),
                  Column(
                    children: [
                      ElevatedButton(
                        onPressed: _addHabitat,
                        child: const Text('Добавить'),
                      ),
                      const SizedBox(height: 5),
                      ElevatedButton(
                        onPressed: _removeFirstHabitat,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.red,
                          foregroundColor: Colors.white,
                        ),
                        child: const Text('Удалить первый'),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: TextField(
              controller: _habitatController,
              decoration: const InputDecoration(
                labelText: 'Новый регион обитания',
                border: OutlineInputBorder(),
              ),
            ),
          ),

          const SizedBox(height: 10),

          Expanded(
            child: ListView.builder(
              itemCount: _habitats.length,
              itemBuilder: (context, index) {
                final habitat = _habitats[index];
                final hasImage = habitat['image'] != null;

                return Card(
                  margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                  child: ListTile(
                    leading: CircleAvatar(
                      radius: 25,
                      backgroundColor: Colors.blue[50],
                      child: hasImage
                          ? CachedNetworkImage(
                        imageUrl: habitat['image']!,
                        imageBuilder: (context, imageProvider) => Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                              image: imageProvider,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        placeholder: (context, url) => const CircularProgressIndicator(strokeWidth: 2),
                        errorWidget: (context, url, error) => const Icon(Icons.public),
                      )
                          : const Icon(Icons.add_location, color: Colors.blue),
                    ),
                    title: Text(habitat['name']!),
                    subtitle: Text(habitat['description']!),
                    trailing: !hasImage
                        ? const Text('Новая', style: TextStyle(color: Colors.grey))
                        : null,
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
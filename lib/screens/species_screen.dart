import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

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

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _descController = TextEditingController();
  final TextEditingController _imageController = TextEditingController();

  void _addSpecies() {
    final name = _nameController.text;
    final description = _descController.text;
    final image = _imageController.text;

    if (name.isNotEmpty && description.isNotEmpty && image.isNotEmpty) {
      setState(() {
        _penguinSpecies.add({
          'name': name,
          'description': description,
          'image': image,
        });
      });
      _nameController.clear();
      _descController.clear();
      _imageController.clear();
    }
  }

  void _removeFirstSpecies() {
    if (_penguinSpecies.isNotEmpty) {
      setState(() {
        _penguinSpecies.removeAt(0);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Виды пингвинов'),
        backgroundColor: Colors.blue[100],
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
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Управление списком',
                            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height: 10),
                          Text('Элементов в списке: ${_penguinSpecies.length}'),
                        ],
                      ),
                    ),
                    Column(
                      children: [
                        ElevatedButton(
                          onPressed: _addSpecies,
                          child: const Text('Добавить'),
                        ),
                        const SizedBox(height: 5),
                        ElevatedButton(
                          onPressed: _removeFirstSpecies,
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

            const SizedBox(height: 20),

            Card(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    const Text(
                      'Добавить новый вид',
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 10),
                    TextField(
                      controller: _nameController,
                      decoration: const InputDecoration(
                        labelText: 'Название вида',
                        border: OutlineInputBorder(),
                      ),
                    ),
                    const SizedBox(height: 10),
                    TextField(
                      controller: _descController,
                      decoration: const InputDecoration(
                        labelText: 'Описание',
                        border: OutlineInputBorder(),
                      ),
                    ),
                    const SizedBox(height: 10),
                    TextField(
                      controller: _imageController,
                      decoration: const InputDecoration(
                        labelText: 'URL изображения',
                        border: OutlineInputBorder(),
                        hintText: 'https://example.com/image.jpg',
                      ),
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
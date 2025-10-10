import 'package:flutter/material.dart';

class SpeciesScreen extends StatefulWidget {
  const SpeciesScreen({super.key});

  @override
  State<SpeciesScreen> createState() => _SpeciesScreenState();
}

class _SpeciesScreenState extends State<SpeciesScreen> {
  final List<Map<String, String>> _penguinSpecies = [
    {
      'name': 'Императорский пингвин',
      'description': 'Самый крупный вид, обитает в Антарктиде'
    },
    {
      'name': 'Королевский пингвин',
      'description': 'Второй по величине, яркие оранжевые пятна'
    },
    {
      'name': 'Пингвин Адели',
      'description': 'Небольшие пингвины с белым кольцом вокруг глаз'
    },
  ];

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _descController = TextEditingController();

  void _addSpecies() {
    final name = _nameController.text;
    final description = _descController.text;

    if (name.isNotEmpty && description.isNotEmpty) {
      setState(() {
        _penguinSpecies.add({
          'name': name,
          'description': description
        });
      });
      _nameController.clear();
      _descController.clear();
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
        title: const Text('Виды пингвинов - Column'),
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
                          child: const Text('Удалить первый элемент'),
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
                  ],
                ),
              ),
            ),

            const SizedBox(height: 20),

            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    for (int i = 0; i < _penguinSpecies.length; i++)
                      Card(
                        margin: const EdgeInsets.only(bottom: 10),
                        child: ListTile(
                          leading: const Icon(Icons.emoji_nature, color: Colors.blue),
                          title: Text(_penguinSpecies[i]['name']!),
                          subtitle: Text(_penguinSpecies[i]['description']!),
                        ),
                      ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
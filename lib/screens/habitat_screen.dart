import 'package:flutter/material.dart';

class HabitatScreen extends StatefulWidget {
  const HabitatScreen({super.key});

  @override
  State<HabitatScreen> createState() => _HabitatScreenState();
}

class _HabitatScreenState extends State<HabitatScreen> {
  final List<Map<String, String>> _habitats = [
    {
      'name': 'Антарктида',
      'description': 'Основное место обитания императорских пингвинов'
    },
    {
      'name': 'Субантарктические острова',
      'description': 'Обитают королевские и хохлатые пингвины'
    },
    {
      'name': 'Южная Америка',
      'description': 'Магеллановы и галапагосские пингвины'
    },
  ];

  final TextEditingController _habitatController = TextEditingController();

  void _addHabitat() {
    final name = _habitatController.text;
    if (name.isNotEmpty) {
      setState(() {
        _habitats.add({
          'name': name,
          'description': 'Новый регион обитания пингвинов'
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
        title: const Text('Регионы обитания'),
        backgroundColor: Colors.blue[100],
      ),
      body: Column(
        children: [
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
                return Card(
                  margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                  child: ListTile(
                    leading: const Icon(Icons.public, color: Colors.green),
                    title: Text(_habitats[index]['name']!),
                    subtitle: Text(_habitats[index]['description']!),
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
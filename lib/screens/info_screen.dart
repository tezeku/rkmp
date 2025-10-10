import 'package:flutter/material.dart';

class InfoScreen extends StatefulWidget {
  const InfoScreen({super.key});

  @override
  State<InfoScreen> createState() => _InfoScreenState();
}

class _InfoScreenState extends State<InfoScreen> {
  final List<Map<String, String>> _facts = [
    {'id': '1', 'text': 'Пингвины не умеют летать, но отлично плавают'},
    {'id': '2', 'text': 'Самый крупный вид - императорский пингвин'},
    {'id': '3', 'text': 'Пингвины живут только в Южном полушарии'},
    {'id': '4', 'text': 'Они могут пить морскую воду'},
    {'id': '5', 'text': 'Пингвины моногамны и образуют пары на всю жизнь'},
  ];

  final TextEditingController _factController = TextEditingController();

  int _nextId = 6;

  void _addFact() {
    final text = _factController.text;
    if (text.isNotEmpty) {
      setState(() {
        _facts.add({
          'id': _nextId.toString(),
          'text': text
        });
      });
      _nextId++;
      _factController.clear();
    }
  }

  void _removeFirstFact() {
    if (_facts.isNotEmpty) {
      setState(() {
        _facts.removeAt(0);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Интересные факты'),
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
                          'Управление списком фактов',
                          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 10),
                        Text('Фактов в списке: ${_facts.length}'),
                      ],
                    ),
                  ),
                  Column(
                    children: [
                      ElevatedButton(
                        onPressed: _addFact,
                        child: const Text('Добавить'),
                      ),
                      const SizedBox(height: 5),
                      ElevatedButton(
                        onPressed: _removeFirstFact,
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
              controller: _factController,
              decoration: const InputDecoration(
                labelText: 'Новый интересный факт о пингвинах',
                border: OutlineInputBorder(),
              ),
            ),
          ),

          const SizedBox(height: 10),

          Expanded(
            child: ListView.separated(
              itemCount: _facts.length,
              separatorBuilder: (context, index) => const Divider(
                height: 1,
                thickness: 1,
                color: Colors.grey,
              ),
              itemBuilder: (context, index) {
                final fact = _facts[index];

                return KeyedSubtree(
                  key: ValueKey(fact['id']), // Уникальный ключ на основе ID
                  child: ListTile(
                    leading: const Icon(Icons.arrow_forward_ios, size: 16, color: Colors.blue),
                    title: Text(fact['text']!),
                    subtitle: Text('ID: ${fact['id']}'),
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
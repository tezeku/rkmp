import 'package:flutter/material.dart';

class InfoScreen extends StatefulWidget {
  const InfoScreen({super.key});

  @override
  State<InfoScreen> createState() => _InfoScreenState();
}

class _InfoScreenState extends State<InfoScreen> {
  final List<String> _facts = [
    'Пингвины не умеют летать, но отлично плавают',
    'Самый крупный вид - императорский пингвин',
    'Пингвины живут только в Южном полушарии',
    'Они могут пить морскую воду',
    'Пингвины моногамны и образуют пары на всю жизнь',
  ];

  final TextEditingController _factController = TextEditingController();

  void _addFact() {
    final fact = _factController.text;
    if (fact.isNotEmpty) {
      setState(() {
        _facts.add(fact);
      });
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
                return ListTile(
                  leading: const Icon(Icons.arrow_forward_ios,
                      size: 16, color: Colors.blue),
                  title: Text(_facts[index]),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
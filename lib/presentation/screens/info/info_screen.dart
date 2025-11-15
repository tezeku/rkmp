import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:go_router/go_router.dart';
import 'cubit/facts_cubit.dart';

class InfoScreen extends StatefulWidget {
  const InfoScreen({super.key});

  @override
  State<InfoScreen> createState() => _InfoScreenState();
}

class _InfoScreenState extends State<InfoScreen> {
  final TextEditingController _factController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Интересные факты'),
        backgroundColor: Colors.blue[100],
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => context.pop(),
        ),
      ),
      body: BlocBuilder<FactsCubit, FactsState>(
        builder: (context, state) {
          return Column(
            children: [
              Container(
                height: 120,
                margin: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.blue[50],
                ),
                child: Row(
                  children: [
                    Expanded(
                      flex: 2,
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              'Интересные факты',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.blue,
                              ),
                            ),
                            const SizedBox(height: 5),
                            Text(
                              'Фактов: ${state.facts.length}',
                              style: const TextStyle(color: Colors.blueGrey),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: CachedNetworkImage(
                          imageUrl: 'https://static.tildacdn.com/087d880f-60c7-4756-8c80-f81d0392701f/idea01.png',
                          fit: BoxFit.contain,
                          progressIndicatorBuilder: (context, url, progress) =>
                              Center(child: CircularProgressIndicator(value: progress.progress)),
                          errorWidget: (context, url, error) => const Icon(
                            Icons.info,
                            size: 50,
                            color: Colors.blue,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              Expanded(
                child: ListView.separated(
                  itemCount: state.facts.length,
                  separatorBuilder: (context, index) => const Divider(
                    height: 1,
                    thickness: 1,
                    color: Colors.grey,
                  ),
                  itemBuilder: (context, index) {
                    final fact = state.facts[index];
                    return ListTile(
                      title: Text(fact['text']!),
                      subtitle: Text('ID: ${fact['id']}'),
                      trailing: IconButton(
                        icon: const Icon(Icons.delete, color: Colors.red),
                        onPressed: () => context.read<FactsCubit>().removeFact(index),
                      ),
                    );
                  },
                ),
              ),
            ],
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showAddFactDialog(context),
        child: const Icon(Icons.add),
      ),
    );
  }

  void _showAddFactDialog(BuildContext context) {
    final cubit = context.read<FactsCubit>();

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Добавить интересный факт'),
        content: TextField(
          controller: _factController,
          decoration: const InputDecoration(
            labelText: 'Новый факт о пингвинах',
            border: OutlineInputBorder(),
          ),
          maxLines: 3,
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Отмена'),
          ),
          TextButton(
            onPressed: () {
              if (_factController.text.isNotEmpty) {
                cubit.addFact(_factController.text);
                _factController.clear();
                Navigator.pop(context);
                setState(() {});
              }
            },
            child: const Text('Добавить'),
          ),
        ],
      ),
    );
  }
}
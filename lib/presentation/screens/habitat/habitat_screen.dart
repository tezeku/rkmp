import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:go_router/go_router.dart';
import 'cubit/habitat_manager_cubit.dart';

class HabitatScreen extends StatefulWidget {
  const HabitatScreen({super.key});

  @override
  State<HabitatScreen> createState() => _HabitatScreenState();
}

class _HabitatScreenState extends State<HabitatScreen> {
  final TextEditingController _habitatController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HabitatManagerCubit(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Среда обитания'),
          backgroundColor: Colors.blue[100],
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () => context.pop(),
          ),
        ),
        body: BlocBuilder<HabitatManagerCubit, HabitatManagerState>(
          builder: (context, state) {
            return Column(
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
                        Text(
                          'Сред обитания: ${state.habitats.length}',
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.blue,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                Expanded(
                  child: ListView.builder(
                    itemCount: state.habitats.length,
                    itemBuilder: (context, index) {
                      final habitat = state.habitats[index];
                      final hasImage = habitat['image'] != null && habitat['image']!.isNotEmpty;

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
                          trailing: IconButton(
                            icon: const Icon(Icons.delete, color: Colors.red),
                            onPressed: () => context.read<HabitatManagerCubit>().removeHabitat(index),
                          ),
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
          onPressed: () => _showAddHabitatDialog(context),
          child: const Icon(Icons.add),
        ),
      ),
    );
  }

  void _showAddHabitatDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Добавить среду обитания'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: _habitatController,
              decoration: const InputDecoration(labelText: 'Название региона'),
            ),
            TextField(
              controller: _descriptionController,
              decoration: const InputDecoration(labelText: 'Описание'),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Отмена'),
          ),
          TextButton(
            onPressed: () {
              if (_habitatController.text.isNotEmpty && _descriptionController.text.isNotEmpty) {
                context.read<HabitatManagerCubit>().addHabitat(
                  _habitatController.text,
                  _descriptionController.text,
                );
                _habitatController.clear();
                _descriptionController.clear();
                Navigator.pop(context);
              }
            },
            child: const Text('Добавить'),
          ),
        ],
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:go_router/go_router.dart';
import '../home/cubit/penguin_cubit.dart';

class SpeciesScreen extends StatelessWidget {
  const SpeciesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Виды пингвинов'),
        backgroundColor: Colors.blue[100],
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => context.pop(),
        ),
      ),
      body: BlocProvider(
        create: (context) => PenguinCubit(),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              BlocBuilder<PenguinCubit, PenguinState>(
                builder: (context, state) {
                  return Card(
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Row(
                        children: [
                          const Icon(Icons.style, color: Colors.green),
                          const SizedBox(width: 10),
                          Text(
                            'Всего видов пингвинов: ${state.penguinCount}',
                            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                          const Spacer(),
                          IconButton(
                            icon: const Icon(Icons.add),
                            onPressed: () => context.read<PenguinCubit>().increment(),
                          ),
                          IconButton(
                            icon: const Icon(Icons.remove),
                            onPressed: () => context.read<PenguinCubit>().decrement(),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
              const SizedBox(height: 20),
              Expanded(
                child: _buildSpeciesList(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSpeciesList() {
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

    return ListView.builder(
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
    );
  }
}
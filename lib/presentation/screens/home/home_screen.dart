import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'cubit/home_cubit.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Мир пингвинов'),
        backgroundColor: Colors.blue[100],
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () => context.pushReplacement('/intro'),
            tooltip: 'Выход',
          ),
        ],
      ),
      body: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Статистика посещений
                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      children: [
                        const Icon(Icons.visibility, size: 40, color: Colors.blue),
                        const SizedBox(height: 10),
                        Text(
                          'Количество посещений: ${state.visitCount}',
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ElevatedButton(
                              onPressed: () => context.read<HomeCubit>().incrementVisits(),
                              child: const Text('+1 посещение'),
                            ),
                            const SizedBox(width: 10),
                            ElevatedButton(
                              onPressed: () => context.read<HomeCubit>().resetVisits(),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.red,
                                foregroundColor: Colors.white,
                              ),
                              child: const Text('Сбросить'),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),

                const SizedBox(height: 20),

                // Навигационные карточки
                Expanded(
                  child: GridView.count(
                    crossAxisCount: 2,
                    crossAxisSpacing: 16,
                    mainAxisSpacing: 16,
                    children: [
                      _buildNavigationCard(
                        context,
                        'Галерея пингвинов',
                        Icons.photo_library,
                        Colors.blue,
                            () => context.push('/home/gallery'),
                      ),
                      _buildNavigationCard(
                        context,
                        'Виды пингвинов',
                        Icons.style,
                        Colors.green,
                            () => context.push('/home/species'),
                      ),
                      _buildNavigationCard(
                        context,
                        'Среда обитания',
                        Icons.public,
                        Colors.orange,
                            () => context.push('/home/habitat'),
                      ),
                      _buildNavigationCard(
                        context,
                        'Интересные факты',
                        Icons.info,
                        Colors.purple,
                            () => context.push('/home/info'),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildNavigationCard(
      BuildContext context,
      String title,
      IconData icon,
      Color color,
      VoidCallback onTap,
      ) {
    return Card(
      elevation: 4,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 40, color: color),
            const SizedBox(height: 10),
            Text(
              title,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
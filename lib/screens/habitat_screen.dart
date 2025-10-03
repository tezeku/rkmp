import 'package:flutter/material.dart';

class HabitatScreen extends StatelessWidget {
  const HabitatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Где живут пингвины:',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 15),
          Text('• Антарктида и субантарктические острова'),
          Text('• Южная Америка (Аргентина, Чили)'),
          Text('• Южная Африка'),
          Text('• Австралия и Новая Зеландия'),
          Text('• Галапагосские острова'),
        ],
      ),
    );
  }
}
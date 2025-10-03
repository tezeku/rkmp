import 'package:flutter/material.dart';

class SpeciesScreen extends StatelessWidget {
  const SpeciesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: const [
        ListTile(
          leading: Icon(Icons.icecream, color: Colors.blue),
          title: Text('Императорский пингвин'),
          subtitle: Text('Самый крупный вид, обитает в Антарктиде'),
        ),
        ListTile(
          leading: Icon(Icons.pets, color: Colors.blue),
          title: Text('Королевский пингвин'),
          subtitle: Text('Второй по величине, живет на субантарктических островах'),
        ),
        ListTile(
          leading: Icon(Icons.face, color: Colors.blue),
          title: Text('Адели'),
          subtitle: Text('Один из самых распространенных видов'),
        ),
        ListTile(
          leading: Icon(Icons.emoji_nature, color: Colors.blue),
          title: Text('Хохлатый пингвин'),
          subtitle: Text('Отличается желтыми перьями на голове'),
        ),
      ],
    );
  }
}
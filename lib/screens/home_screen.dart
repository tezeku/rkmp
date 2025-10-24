import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 200,
            height: 200,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.2),
                  blurRadius: 10,
                  offset: const Offset(0, 5),
                ),
              ],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(40),
              child: CachedNetworkImage(
                imageUrl: 'https://i.pinimg.com/736x/b9/65/3d/b9653d89dd3064fa709efdc7e9efe823.jpg',
                fit: BoxFit.cover,
                progressIndicatorBuilder: (context, url, progress) =>
                    Center(
                      child: CircularProgressIndicator(
                        value: progress.progress,
                      ),
                    ),
                errorWidget: (context, url, error) => Container(
                  color: Colors.blue[50],
                  child: const Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.anchor, size: 50, color: Colors.blue),
                      SizedBox(height: 10),
                      Text('Пингвины скоро будут!'),
                    ],
                  ),
                ),
              ),
            ),
          ),

          const SizedBox(height: 30),

          const Text(
            'Добро пожаловать в мир пингвинов!',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),

          const SizedBox(height: 20),

          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: Text(
              'Исследуйте удивительный мир этих нелетающих птиц.',
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
import 'package:flutter/material.dart';

class InfoScreen extends StatelessWidget {
  const InfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Интересные факты о пингвинах:',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 15),
          _buildFact('Пингвины не умеют летать, но отлично плавают'),
          _buildFact('Самый крупный вид - императорский пингвин'),
          _buildFact('Пингвины живут только в Южном полушарии'),
          _buildFact('Они могут пить морскую воду'),
          _buildFact('Пингвины моногамны и образуют пары на всю жизнь'),
        ],
      ),
    );
  }

  Widget _buildFact(String fact) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Icon(Icons.arrow_forward_ios, size: 16, color: Colors.blue),
          const SizedBox(width: 8),
          Expanded(child: Text(fact)),
        ],
      ),
    );
  }
}
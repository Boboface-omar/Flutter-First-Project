import 'package:flutter/material.dart';

void main() {
  runApp(
    const MaterialApp(
      home: Scaffold(
        body: Center(
          child: MonStack(),
        ),
      ),
    ),
  );
}

class MonStack extends StatelessWidget {
  const MonStack({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // 1. Carré rouge 200x200 (derrière)
        Container(width: 200, height: 200, color: Colors.red),

        // 2. Carré vert 150x150 (au-dessus)
        Container(width: 150, height: 150, color: Colors.green),

        // 3. Carré bleu 100x100 (au-dessus)
        Container(width: 100, height: 100, color: Colors.blue),

        // 4. Texte tout devant
        const Text('DEVANT', style: TextStyle(color: Colors.white, fontSize: 20)),
      ],
    );
  }
}
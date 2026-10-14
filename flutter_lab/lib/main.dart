import 'package:flutter/material.dart';

void main() {
  runApp(
    const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Grille(),
    ),
  );
}

class Grille extends StatelessWidget {
  const Grille({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Galerie')),
      body: GridView.builder(
        padding: const EdgeInsets.all(2),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          mainAxisSpacing: 2,
          crossAxisSpacing: 2,
          mainAxisExtent: 130,
        ),
        itemCount: 30,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('Photo ${index + 1} sélectionnée'),
                  duration: const Duration(seconds: 1),
                ),
              );
            },
            child: Image.network(
              'https://picsum.photos/seed/$index/200/200',
              fit: BoxFit.cover,
            ),
          );
        },
      ),
    );
  }
}
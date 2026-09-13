import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(
            children: [
              CarteVisite(nom: 'Charlie', metier: 'Développeur', ville: 'Paris'),
              const SizedBox(height: 20),
              CarteVisite(nom: 'Bob Martin', metier: 'Designer', ville: 'Lyon'),
            ],
          ),
        ),
      ),
    ),
  );
}

class CarteVisite extends StatefulWidget {
  final String nom;
  final String metier;
  final String ville;

  const CarteVisite({
    super.key,
    required this.nom,
    required this.metier,
    required this.ville,
  });

  @override
  State<CarteVisite> createState() => _CarteVisiteState();
}

class _CarteVisiteState extends State<CarteVisite> {
  int likes = 0;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(widget.nom),
                const SizedBox(width: 10),
                Text(widget.metier),
                const SizedBox(width: 10),
                Text(widget.ville),
              ],
            ),
            const SizedBox(height: 10),
            Text('❤️ $likes j\'aime'),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  likes++;
                });
              },
              child: const Text('J\'aime'),
            ),
          ],
        ),
      ),
    );
  }
}
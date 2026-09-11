import 'package:flutter/material.dart';

class CarteVisite extends StatelessWidget {
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
  Widget build(BuildContext context) {
    return Card(
  child: Center(
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
  children: [
    Text(nom),
    SizedBox(width: 10),
    Text(metier),
    SizedBox(width: 10),
    Text(ville),
  ],
),
  ),
);
  }
}

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(
            children: [
            CarteVisite(nom: 'Charlie', metier: 'Devloppeur', ville: 'Paris'),
            SizedBox(height: 20),
            CarteVisite(nom: 'Bob Martin', metier: 'Designer', ville: 'Lyon'),
          ],
          ),
        ),
      ),
    ),
  );
}

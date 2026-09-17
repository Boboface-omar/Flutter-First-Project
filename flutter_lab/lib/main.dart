import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        body: Center(child: Padding(padding: EdgeInsets.all(20),
        child : Row(children: [Carte(nom: 'Diallo', metier: 'Developpeur'),
        SizedBox(width: 20,), Carte(nom: 'Pierre', metier: 'Electricien')]))),
      ),
    ),
  );
}

class Carte extends StatelessWidget {
  final String nom;
  final String metier;
  const Carte({super.key, required this.nom, required this.metier});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Card(child: Column(children: [Text(nom), Text(metier)]));
  }
}

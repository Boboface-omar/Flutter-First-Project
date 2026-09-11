import 'package:flutter/material.dart';

class MaCarte extends StatelessWidget {
  final String titre;
  final String sousTitre;

  const MaCarte({super.key, required this.titre, required this.sousTitre});

  @override
  Widget build(BuildContext context) {
    return Center(child: Column(children: [Text(titre), Text(sousTitre)]));
  }
}

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        body: MaCarte(titre: 'StatelessWidget', sousTitre: 'Lesson 6'),
      ),
    ),
  );
}

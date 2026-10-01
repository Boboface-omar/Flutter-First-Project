import 'package:flutter/material.dart';

void main() {
  runApp(
    const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SafeArea(child: Filtre()),
      ),
    ),
  );
}

class Filtre extends StatelessWidget {
  const Filtre({super.key});

  @override
  Widget build(BuildContext context) {
    final categories = [
      'Tout', 'Sweats', 'Vestes', 'Pantalons', 'Chaussures',
      'Accessoires', 'Bonnets', 'Gants', 'Sacs', 'Promos',
    ];

    return Padding(
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // ─────────────────────────────────────
          // TITRE
          // ─────────────────────────────────────
          const Text(
            'Filtrer par :',
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 20),

          // ─────────────────────────────────────
          // WRAP DES FILTRES
          // ─────────────────────────────────────
          Wrap(
            alignment: WrapAlignment.start,
            spacing: 10,
            runSpacing: 10,
            children: categories.map((categorie) {
              return ChoiceChip(
                label: Text(categorie),
                selected: categorie == 'Tout',  // "Tout" sélectionné par défaut
                onSelected: (value) {},
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
import 'package:flutter/material.dart';

void main() {
  runApp(
    const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(body: SafeArea(child: Filtre())),
    ),
  );
}

class Filtre extends StatefulWidget {
  const Filtre({super.key});

  @override
  State<Filtre> createState() => _FiltreState();
}

class _FiltreState extends State<Filtre> {
  String _categorieSelectionnee = 'Tout';

  final List<String> _categories = [
    'Tout', 'Sweats', 'Vestes', 'Pantalons', 'Chaussures',
    'Accessoires', 'Bonnets', 'Gants', 'Sacs', 'Promos',
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Filtrer par :',
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 20),

          Wrap(
            alignment: WrapAlignment.start,
            spacing: 10,
            runSpacing: 10,
            children: _categories.map((categorie) {
              return ChoiceChip(
                label: Text(categorie),
                selected: _categorieSelectionnee == categorie,
                onSelected: (value) {
                  setState(() {
                    _categorieSelectionnee = categorie;
                  });
                },
              );
            }).toList(),
          ),

          const SizedBox(height: 30),
          Text(
            'Sélection : $_categorieSelectionnee',
            style: const TextStyle(fontSize: 16, color: Colors.grey),
          ),
        ],
      ),
    );
  }
}
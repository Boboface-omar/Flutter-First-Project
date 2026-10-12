import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(home: Scaffold(body: SafeArea(child: ListeProduits()))));
}

class ListeProduits extends StatelessWidget {
  const ListeProduits({super.key});

  final List<Map<String, String>> produits = const [
    {'nom': 'Veste polaire', 'prix': '149,99 €'},
    {'nom': 'Sweat à capuche', 'prix': '89,99 €'},
    {'nom': 'Bonnet chaud', 'prix': '39,99 €'},
    {'nom': 'Chaussures trail', 'prix': '129,99 €'},
    {'nom': 'Gants thermiques', 'prix': '29,99 €'},
    // ... tu peux en mettre 1000
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: produits.length,
      itemBuilder: (context, index) {
        final produit = produits[index];
        return Card(
          margin: const EdgeInsets.only(bottom: 12),
          child: ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.blue.shade100,
              child: Text('${index + 1}'),
            ),
            title: Text(
              produit['nom']!,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: Text(produit['prix']!),
            trailing: const Icon(Icons.chevron_right),
            onTap: () {
              print('Clic sur ${produit['nom']}');
            },
          ),
        );
      },
    );
  }
}
import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(home: Scaffold(body: SafeArea(child: GalerieProduits()))));
}

class GalerieProduits extends StatelessWidget {
  const GalerieProduits({super.key});

  final List<Map<String, String>> produits = const [
    {'nom': 'Veste polaire', 'prix': '149,99 €'},
    {'nom': 'Sweat à capuche', 'prix': '89,99 €'},
    {'nom': 'Bonnet chaud', 'prix': '39,99 €'},
    {'nom': 'Chaussures trail', 'prix': '129,99 €'},
    {'nom': 'Gants thermiques', 'prix': '29,99 €'},
    {'nom': 'Écharpe laine', 'prix': '49,99 €'},
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.all(16),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
        mainAxisExtent: 240,  // ← Hauteur fixe
      ),
      itemCount: produits.length,
      itemBuilder: (context, index) {
        final produit = produits[index];
        return Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            boxShadow: const [
              BoxShadow(color: Colors.black12, blurRadius: 8),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Image
              Expanded(
                child: ClipRRect(
                  borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
                  child: Image.network(
                    'https://picsum.photos/seed/$index/300/300',
                    fit: BoxFit.cover,
                    width: double.infinity,
                  ),
                ),
              ),
              // Contenu
              Padding(
                padding: const EdgeInsets.all(8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      produit['nom']!,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 4),
                    Text(
                      produit['prix']!,
                      style: const TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
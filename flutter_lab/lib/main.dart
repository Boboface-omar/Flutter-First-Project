import 'package:flutter/material.dart';

void main() {
  runApp(
    const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ProductListPage(),
    ),
  );
}

// ═════════════════════════════════════════════
// PAGE 1 : Liste des produits
// ═════════════════════════════════════════════
class ProductListPage extends StatelessWidget {
  final Map<String, double> produits;

  const ProductListPage({
    super.key,
    this.produits = const {
      'Veste polaire': 149.99,
      'Sweat à capuche': 89.99,
      'Bonnet chaud': 39.99,
      'Chaussures trail': 129.99,
      'Gants thermiques': 29.99,
      'Écharpe laine': 49.99,
      'Sac à dos': 79.99,
      'Gourde isotherme': 24.99,
    },
  });

  @override
  Widget build(BuildContext context) {
    // Transforme la Map en liste indexable
    final entries = produits.entries.toList();

    return Scaffold(
      appBar: AppBar(title: const Text('Produits')),
      body: ListView.builder(
        itemCount: entries.length,
        itemBuilder: (context, index) {
          final entry = entries[index];
          final nom = entry.key;
          final prix = entry.value;

          return ListTile(
            leading: const Icon(Icons.shopping_bag),
            title: Text(nom),
            subtitle: Text('${prix.toStringAsFixed(2)} €'),
            trailing: const Icon(Icons.chevron_right),
            onTap: () async {
              final result = await Navigator.push<String>(
                context,
                MaterialPageRoute(
                  builder: (context) => ProductDetailPage(nom: nom, prix: prix),
                ),
              );

              // Affiche le SnackBar si un résultat a été renvoyé
              if (result != null && context.mounted) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(result),
                    duration: const Duration(seconds: 2),
                  ),
                );
              }
            },
          );
        },
      ),
    );
  }
}

// ═════════════════════════════════════════════
// PAGE 2 : Détail du produit
// ═════════════════════════════════════════════
class ProductDetailPage extends StatelessWidget {
  final String nom;
  final double prix;

  const ProductDetailPage({
    super.key,
    required this.nom,
    required this.prix,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(nom)),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Icône "image" en grand
              const Icon(Icons.image, size: 100, color: Colors.grey),
              const SizedBox(height: 24),

              // Nom
              Text(
                nom,
                style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 8),

              // Prix
              Text(
                '${prix.toStringAsFixed(2)} €',
                style: const TextStyle(
                  fontSize: 20,
                  color: Colors.blue,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 32),

              // Bouton
              ElevatedButton.icon(
                onPressed: () {
                  Navigator.pop(context, 'Produit ajouté au panier');
                },
                icon: const Icon(Icons.shopping_cart),
                label: const Text('Ajouter au panier'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
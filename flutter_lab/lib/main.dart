import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

// ═════════════════════════════════════════════
// WIDGET RACINE (thème + MaterialApp)
// ═════════════════════════════════════════════
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.teal,
          brightness: Brightness.dark,
        ),
      ),
      home: const Homepage(),
    );
  }
}

// ═════════════════════════════════════════════
// PAGE 1 : Liste des produits
// ═════════════════════════════════════════════
class Homepage extends StatelessWidget {
  const Homepage({super.key});

  final List<Map<String, String>> produits = const [
    {'nom': 'Veste', 'prix': '89,99 €'},
    {'nom': 'Sweat', 'prix': '49,99 €'},
    {'nom': 'Bonnet', 'prix': '19,99 €'},
    {'nom': 'Chaussures', 'prix': '119,99 €'},
    {'nom': 'Gants', 'prix': '24,99 €'},
    {'nom': 'Écharpe', 'prix': '29,99 €'},
    {'nom': 'Sac', 'prix': '59,99 €'},
    {'nom': 'Gourde', 'prix': '14,99 €'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Produits'),
        leading: const Icon(Icons.shop),
        centerTitle: true,
      ),
      bottomNavigationBar: NavigationBar(
        destinations: const [
          NavigationDestination(icon: Icon(Icons.home), label: 'Home'),
          NavigationDestination(icon: Icon(Icons.list), label: 'Liste'),
        ],
      ),
      body: ListView.builder(
        itemCount: produits.length,
        itemBuilder: (context, index) {
          final produit = produits[index];

          return ListTile(
            leading: const Icon(Icons.shopping_bag),
            title: Text(produit['nom'] ?? ''),
            subtitle: Text(produit['prix'] ?? ''),
            trailing: const Icon(Icons.chevron_right),
            onTap: () async {
              // Attendre le retour de la page de détail
              final result = await Navigator.push<String>(
                context,
                MaterialPageRoute(
                  builder: (context) => ProductDetailPage(
                    nom: produit['nom'] ?? '',
                    prix: produit['prix'] ?? '',
                  ),
                ),
              );

              // Afficher le SnackBar si un résultat a été renvoyé
              if (result != null && context.mounted) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(result),
                    duration: const Duration(seconds: 1),
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
  final String prix;

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
          padding: const EdgeInsets.all(20),
          child: Card(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(Icons.image, size: 100),
                  const SizedBox(height: 10),
                  Text(nom, style: const TextStyle(fontSize: 20)),
                  const SizedBox(height: 10),
                  Text(prix, style: const TextStyle(fontSize: 15)),
                  const SizedBox(height: 20),
                  ElevatedButton.icon(
                    onPressed: () {
                      // On renvoie juste le résultat au parent
                      Navigator.pop(context, 'Produit ajouté au panier');
                    },
                    icon: const Icon(Icons.shopping_cart),
                    label: const Text('Ajouter au panier'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
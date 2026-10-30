import 'package:flutter/material.dart';

class Product {
  final String nom;
  final double prix;
  final String imageUrl;

  const Product({
    required this.nom,
    required this.prix,
    required this.imageUrl,
  });
}

const List<Product> produitsDisponibles = [
  Product(
    nom: 'Veste polaire',
    prix: 89.99,
    imageUrl: 'https://assets.thenorthface.eu/images/t_img/c_fill,ar_4:5,f_auto,h_2500,e_sharpen:60,w_2000/v1789486435/NF0A8KCC3X3-HERO/TNF-X-Aim-Leon-Dore-Fleece-12-Zip-95-Denali-Jacket-TNF-Tea-Green-HERO.png',
  ),
  Product(
    nom: 'Sweat à capuche',
    prix: 49.99,
    imageUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSGNF0oEQW98N7JZe7xhSqib87sMUwMwxK3GM9ImHdNbX6xA2mqAcajvaaO&s=10',
  ),
  Product(
    nom: 'Bonnet',
    prix: 19.99,
    imageUrl: 'https://cdna.lystit.com/520/650/n/photos/farfetch/8ff731d0/aime-leon-dore-green-X-Porsche-Logo-Detail-Beanie.jpeg',
  ),
  Product(
    nom: 'Chaussures',
    prix: 119.99,
    imageUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQQMWKjl4cZL_2ZZYMSztKNck1DL4N1DLlrQpWsTC17vw&s=10',
  ),
  Product(
    nom: 'Gants',
    prix: 24.99,
    imageUrl: 'https://assets.thenorthface.eu/images/t_img/c_fill,f_auto,h_2500,e_sharpen:60,w_2000/v1789486571/NF0A8KE58K2-HERO/TNF-X-Aim-Leon-Dore-Fleece-Gloves-TNF-Summit-Navy-HERO.png',
  ),
  Product(
    nom: 'Écharpe',
    prix: 29.99,
    imageUrl: 'https://assets.thenorthface.eu/images/t_img/c_fill,ar_4:5,f_auto,h_625,e_sharpen:60,w_500/dpr_2.0/v1789486602/NF0A8KFE930-HERO/TNF-X-Aim-Leon-Dore-Jacquard-Scarf-TNF-MultiColor-HERO.png',
  ),
];

final ValueNotifier<List<Product>> panierGlobal = ValueNotifier<List<Product>>(
  [],
);

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Boutique'),
        actions: [
          ValueListenableBuilder<List<Product>>(
            valueListenable: panierGlobal,
            builder: (context, panier, child) {
              return Padding(
                padding: const EdgeInsets.only(right: 15), // ⚠️ FIX 4
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const CartPage()),
                    );
                  },
                  child: Row(
                    children: [
                      const Icon(Icons.shopping_cart),
                      const SizedBox(width: 8),
                      Text(
                        '${panier.length}',
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 12,
            mainAxisSpacing: 12,
            mainAxisExtent: 230, // On augmente un peu pour le confort
          ),
          itemCount: produitsDisponibles.length,
          itemBuilder: (context, index) {
            // ⚠️ FIX 1 : On récupère le produit
            final product = produitsDisponibles[index];

            return GestureDetector(
              // ⚠️ FIX 5 : Le clic
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ProductDetailPage(product: product),
                  ),
                );
              },
              child: Card(
                clipBehavior: Clip.antiAlias, // Permet de couper l'image aux bords de la carte
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // ⚠️ FIX 3 : L'image prend l'espace restant
                    Expanded(
                      child: Image.network(
                        product.imageUrl,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // ⚠️ FIX 2 : Syntaxe Objet
                          Text(
                            product.nom,
                            style: const TextStyle(fontWeight: FontWeight.bold),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                          const SizedBox(height: 4),
                          Text(
                            '${product.prix.toStringAsFixed(2)} €',
                            style: TextStyle(
                              color: Theme.of(context).colorScheme.primary,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class ProductDetailPage extends StatelessWidget {
  // ⚠️ FIX 1 : C'est un objet Product, pas un String
  final Product product;

  const ProductDetailPage({required this.product, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(product.nom), centerTitle: true),
      body: SingleChildScrollView(
        // Ajout d'un scroll pour éviter l'overflow
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AspectRatio(
              aspectRatio: 1.0,
              child: Image.network(product.imageUrl, fit: BoxFit.cover),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product.nom,
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),

                  // ⚠️ FIX 2 : Formatage du prix
                  Text(
                    '${product.prix.toStringAsFixed(2)} €',
                    style: TextStyle(
                      fontSize: 22,
                      color: Colors.blueAccent.shade200,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 20),

                  const Text(
                    'Description',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'Un produit de qualité supérieure, parfait pour toutes vos aventures. Conçu pour durer et résister aux conditions les plus extrêmes.',
                    style: TextStyle(height: 1.5, color: Colors.grey),
                  ),
                  const SizedBox(height: 30),

                  // ⚠️ FIX 3 : La logique du bouton
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton.icon(
                      onPressed: () {
                        // 1. On copie la liste actuelle
                        final List<Product> currentPanier = List<Product>.from(
                          panierGlobal.value,
                        );

                        // 2. On ajoute le produit
                        currentPanier.add(product);

                        // 3. On met à jour le ValueNotifier global
                        panierGlobal.value = currentPanier;

                        // 4. On affiche un SnackBar
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('${product.nom} ajouté !')),
                        );

                        // 5. On ferme la page
                        Navigator.pop(context);
                      },
                      icon: const Icon(Icons.shopping_cart),
                      label: const Text('Ajouter au panier'),
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 16),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CartPage extends StatelessWidget {
  // ⚠️ FIX 1 : Plus de paramètre Product ici !
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Mon Panier'), centerTitle: true),
      body: ValueListenableBuilder<List<Product>>(
        valueListenable: panierGlobal,
        builder: (context, panier, child) {
          // 1. Panier vide
          if (panier.isEmpty) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Icon(
                    Icons.remove_shopping_cart_outlined,
                    size: 80,
                    color: Colors.grey,
                  ),
                  SizedBox(height: 16),
                  Text(
                    'Votre panier est vide',
                    style: TextStyle(fontSize: 18, color: Colors.grey),
                  ),
                ],
              ),
            );
          }

          // 2. Panier avec articles
          return Column(
            children: [
              // La liste des produits
              Expanded(
                child: ListView.separated(
                  padding: const EdgeInsets.all(10.0),
                  itemCount: panier.length,
                  separatorBuilder: (context, index) => const Divider(),
                  itemBuilder: (context, index) {
                    // ⚠️ FIX 2 : On récupère l'article à l'index courant
                    final item = panier[index];

                    return ListTile(
                      // ⚠️ FIX 4 : Image avec taille et arrondi
                      leading: ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.network(
                          item.imageUrl,
                          width: 50,
                          height: 50,
                          fit: BoxFit.cover,
                        ),
                      ),
                      title: Text(
                        item.nom,
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text('${item.prix.toStringAsFixed(2)} €'),
                      // ⚠️ FIX 3 : Suppression correcte
                      trailing: IconButton(
                        icon: const Icon(
                          Icons.delete_outline,
                          color: Colors.red,
                        ),
                        onPressed: () {
                          // On crée une nouvelle liste sans l'élément
                          final List<Product> nouveauPanier =
                              List<Product>.from(panier);
                          nouveauPanier.removeAt(index);

                          // On met à jour le ValueNotifier
                          panierGlobal.value = nouveauPanier;
                        },
                      ),
                    );
                  },
                ),
              ),

              // ⚠️ FIX 5 : Le Total en bas
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.surfaceVariant,
                  borderRadius: const BorderRadius.vertical(
                    top: Radius.circular(20),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Total',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      // Calcul du total
                      '${panier.fold(0.0, (sum, item) => sum + item.prix).toStringAsFixed(2)} €',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

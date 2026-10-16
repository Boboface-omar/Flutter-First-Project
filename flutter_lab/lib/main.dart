import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

// ═════════════════════════════════════════════
// APP RACINE + THÈME
// ═════════════════════════════════════════════
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Ma Boutique',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.teal,
          brightness: Brightness.dark,
        ),
      ),
      home: const MainPage(),
    );
  }
}

// ═════════════════════════════════════════════
// MODÈLE : Product
// ═════════════════════════════════════════════
class Product {
  final String id;
  final String nom;
  final double prix;
  final String imageUrl;
  final String categorie;

  const Product({
    required this.id,
    required this.nom,
    required this.prix,
    required this.imageUrl,
    required this.categorie,
  });
}

// ═════════════════════════════════════════════
// DONNÉES DE TEST
// ═════════════════════════════════════════════
const List<Product> produits = [
  Product(id: '1', nom: 'Veste polaire', prix: 89.99, imageUrl: 'https://picsum.photos/seed/1/300/300', categorie: 'Vêtements'),
  Product(id: '2', nom: 'Sweat à capuche', prix: 49.99, imageUrl: 'https://picsum.photos/seed/2/300/300', categorie: 'Vêtements'),
  Product(id: '3', nom: 'Bonnet chaud', prix: 19.99, imageUrl: 'https://picsum.photos/seed/3/300/300', categorie: 'Hiver'),
  Product(id: '4', nom: 'Chaussures trail', prix: 119.99, imageUrl: 'https://picsum.photos/seed/4/300/300', categorie: 'Sport'),
  Product(id: '5', nom: 'Gants thermiques', prix: 24.99, imageUrl: 'https://picsum.photos/seed/5/300/300', categorie: 'Hiver'),
  Product(id: '6', nom: 'Écharpe laine', prix: 29.99, imageUrl: 'https://picsum.photos/seed/6/300/300', categorie: 'Hiver'),
  Product(id: '7', nom: 'Sac à dos', prix: 59.99, imageUrl: 'https://picsum.photos/seed/7/300/300', categorie: 'Rando'),
  Product(id: '8', nom: 'Gourde isotherme', prix: 14.99, imageUrl: 'https://picsum.photos/seed/8/300/300', categorie: 'Rando'),
];

// ═════════════════════════════════════════════
// ÉTAT GLOBAL : Panier
// ═════════════════════════════════════════════
class Cart {
  // ValueNotifier : liste écoutable qui notifie ses abonnés à chaque changement
  final ValueNotifier<List<Product>> items = ValueNotifier([]);

  void add(Product product) {
    items.value = [...items.value, product];
  }

  void remove(Product product) {
    items.value = items.value.where((p) => p != product).toList();
  }

  void clear() {
    items.value = [];
  }

  double get total {
    return items.value.fold(0, (sum, p) => sum + p.prix);
  }

  int get count => items.value.length;
}

// Instance globale du panier, accessible partout
final Cart cart = Cart();

// ═════════════════════════════════════════════
// PAGE PRINCIPALE : BottomNavigationBar
// ═════════════════════════════════════════════
class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // IndexedStack garde l'état des onglets quand on navigue
      body: IndexedStack(
        index: _index,
        children: const [
          HomeTab(),
          CartTab(),
          ProfileTab(),
        ],
      ),
      bottomNavigationBar: ValueListenableBuilder<List<Product>>(
        valueListenable: cart.items,
        builder: (context, items, _) {
          return NavigationBar(
            selectedIndex: _index,
            onDestinationSelected: (i) => setState(() => _index = i),
            destinations: [
              const NavigationDestination(
                icon: Icon(Icons.home_outlined),
                selectedIcon: Icon(Icons.home),
                label: 'Accueil',
              ),
              // Badge avec le nombre d'articles
              NavigationDestination(
                icon: Badge(
                  isLabelVisible: items.isNotEmpty,
                  label: Text('${items.length}'),
                  child: const Icon(Icons.shopping_cart_outlined),
                ),
                selectedIcon: Badge(
                  isLabelVisible: items.isNotEmpty,
                  label: Text('${items.length}'),
                  child: const Icon(Icons.shopping_cart),
                ),
                label: 'Panier',
              ),
              const NavigationDestination(
                icon: Icon(Icons.person_outline),
                selectedIcon: Icon(Icons.person),
                label: 'Profil',
              ),
            ],
          );
        },
      ),
    );
  }
}

// ═════════════════════════════════════════════
// ONGLET 1 : ACCUEIL
// ═════════════════════════════════════════════
class HomeTab extends StatelessWidget {
  const HomeTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 12),

              // ─────────────────────────────────────
              // BARRE DE RECHERCHE
              // ─────────────────────────────────────
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: _SearchBar(),
              ),
              const SizedBox(height: 16),

              // ─────────────────────────────────────
              // BANNIÈRE PROMO
              // ─────────────────────────────────────
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: PromoBanner(),
              ),
              const SizedBox(height: 24),

              // ─────────────────────────────────────
              // TITRE CATÉGORIES
              // ─────────────────────────────────────
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Text(
                  'Catégories',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(height: 12),
              const CategoriesRow(),
              const SizedBox(height: 24),

              // ─────────────────────────────────────
              // TITRE PRODUITS
              // ─────────────────────────────────────
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Text(
                  'Nouveautés',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(height: 12),

              // ─────────────────────────────────────
              // GRILLE DE PRODUITS (GridView.builder)
              // ─────────────────────────────────────
              GridView.builder(
                // Important : shrinkWrap + physics pour que la grille s'intègre
                // dans le SingleChildScrollView parent
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                padding: const EdgeInsets.symmetric(horizontal: 16),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 12,
                  mainAxisExtent: 260,
                ),
                itemCount: produits.length,
                itemBuilder: (context, index) {
                  return ProductCard(product: produits[index]);
                },
              ),
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }
}

// ═════════════════════════════════════════════
// WIDGET : Barre de recherche
// ═════════════════════════════════════════════
class _SearchBar extends StatelessWidget {
  const _SearchBar();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 46,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surfaceContainerHighest,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Row(
        children: [
          Icon(Icons.search, color: Theme.of(context).colorScheme.onSurfaceVariant),
          const SizedBox(width: 8),
          Text(
            'Rechercher un produit...',
            style: TextStyle(color: Theme.of(context).colorScheme.onSurfaceVariant),
          ),
        ],
      ),
    );
  }
}

// ═════════════════════════════════════════════
// WIDGET : Bannière promo (AspectRatio + Stack)
// ═════════════════════════════════════════════
class PromoBanner extends StatelessWidget {
  const PromoBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 16 / 9,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [Color(0xFF7B2FF7), Color(0xFFF107A3)],
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Stack(
              fit: StackFit.expand,
              children: [
                const Align(
                  alignment: Alignment.topLeft,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'MÉGA SOLDES',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 0.5,
                        ),
                      ),
                      SizedBox(height: 8),
                      Text(
                        '-50% sur tout le store',
                        style: TextStyle(color: Colors.white70, fontSize: 14),
                      ),
                    ],
                  ),
                ),
                Align(
                  alignment: Alignment.bottomRight,
                  child: ElevatedButton.icon(
                    onPressed: () {},
                    icon: const Icon(Icons.arrow_forward, size: 16),
                    label: const Text('VOIR'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: const Color(0xFF7B2FF7),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// ═════════════════════════════════════════════
// WIDGET : Row de catégories
// ═════════════════════════════════════════════
class CategoriesRow extends StatelessWidget {
  const CategoriesRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: const [
          _CategoryItem(icon: Icons.checkroom, label: 'Vêtements'),
          _CategoryItem(icon: Icons.directions_run, label: 'Sport'),
          _CategoryItem(icon: Icons.hiking, label: 'Rando'),
          _CategoryItem(icon: Icons.ac_unit, label: 'Hiver'),
        ],
      ),
    );
  }
}

class _CategoryItem extends StatelessWidget {
  final IconData icon;
  final String label;

  const _CategoryItem({required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Column(
      children: [
        Container(
          width: 64,
          height: 64,
          decoration: BoxDecoration(
            color: colorScheme.primaryContainer,
            shape: BoxShape.circle,
          ),
          child: Icon(icon, size: 28, color: colorScheme.onPrimaryContainer),
        ),
        const SizedBox(height: 8),
        Text(
          label,
          style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
        ),
      ],
    );
  }
}

// ═════════════════════════════════════════════
// WIDGET : Carte produit
// ═════════════════════════════════════════════
class ProductCard extends StatelessWidget {
  final Product product;

  const ProductCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ProductDetailPage(product: product),
          ),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.surfaceContainer,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Image carrée
            Expanded(
              child: ClipRRect(
                borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
                child: Image.network(
                  product.imageUrl,
                  fit: BoxFit.cover,
                  width: double.infinity,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product.nom,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    '${product.prix.toStringAsFixed(2).replaceAll('.', ',')} €',
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
  }
}

// ═════════════════════════════════════════════
// PAGE : Détail produit
// ═════════════════════════════════════════════
class ProductDetailPage extends StatelessWidget {
  final Product product;

  const ProductDetailPage({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(product.nom)),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Image en grand
            AspectRatio(
              aspectRatio: 1.0,
              child: Image.network(product.imageUrl, fit: BoxFit.cover),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Catégorie
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.primaryContainer,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      product.categorie,
                      style: const TextStyle(fontSize: 12),
                    ),
                  ),
                  const SizedBox(height: 12),

                  // Nom
                  Text(
                    product.nom,
                    style: const TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),

                  // Prix
                  Text(
                    '${product.prix.toStringAsFixed(2).replaceAll('.', ',')} €',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                  const SizedBox(height: 16),

                  // Description
                  const Text(
                    'Un produit de qualité supérieure, parfait pour toutes vos aventures en plein air. '
                    'Conçu pour durer et résister aux conditions les plus extrêmes.',
                    style: TextStyle(height: 1.5),
                  ),
                  const SizedBox(height: 32),

                  // Bouton Ajouter au panier (pleine largeur)
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton.icon(
                      onPressed: () {
                        cart.add(product);
                        Navigator.pop(context);
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('${product.nom} ajouté au panier'),
                            duration: const Duration(seconds: 2),
                          ),
                        );
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

// ═════════════════════════════════════════════
// ONGLET 2 : PANIER
// ═════════════════════════════════════════════
class CartTab extends StatelessWidget {
  const CartTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mon panier'),
        centerTitle: true,
      ),
      body: ValueListenableBuilder<List<Product>>(
        valueListenable: cart.items,
        builder: (context, items, _) {
          // Panier vide
          if (items.isEmpty) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.shopping_cart_outlined,
                    size: 80,
                    color: Theme.of(context).colorScheme.outline,
                  ),
                  const SizedBox(height: 16),
                  const Text('Votre panier est vide'),
                ],
              ),
            );
          }

          // Panier avec articles
          return Column(
            children: [
              // Liste des articles
              Expanded(
                child: ListView.separated(
                  itemCount: items.length,
                  separatorBuilder: (context, index) => const Divider(height: 1),
                  itemBuilder: (context, index) {
                    final product = items[index];
                    return ListTile(
                      leading: ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.network(
                          product.imageUrl,
                          width: 50,
                          height: 50,
                          fit: BoxFit.cover,
                        ),
                      ),
                      title: Text(product.nom),
                      subtitle: Text(
                        '${product.prix.toStringAsFixed(2).replaceAll('.', ',')} €',
                      ),
                      trailing: IconButton(
                        icon: const Icon(Icons.delete_outline),
                        onPressed: () => cart.remove(product),
                      ),
                    );
                  },
                ),
              ),

              // Total + bouton commande
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.surfaceContainer,
                  borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text('Total', style: TextStyle(fontSize: 18)),
                        Text(
                          '${cart.total.toStringAsFixed(2).replaceAll('.', ',')} €',
                          style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          cart.clear();
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('Commande validée !')),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(vertical: 16),
                        ),
                        child: const Text('Commander'),
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

// ═════════════════════════════════════════════
// ONGLET 3 : PROFIL
// ═════════════════════════════════════════════
class ProfileTab extends StatelessWidget {
  const ProfileTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Profil'), centerTitle: true),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 50,
              backgroundColor: Theme.of(context).colorScheme.primaryContainer,
              child: Icon(
                Icons.person,
                size: 60,
                color: Theme.of(context).colorScheme.onPrimaryContainer,
              ),
            ),
            const SizedBox(height: 16),
            const Text('Alice Dupont', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
            const Text('alice@example.com', style: TextStyle(color: Colors.grey)),
          ],
        ),
      ),
    );
  }
}
import 'package:flutter/material.dart';

void main() {
  runApp(
    const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    ),
  );
}

// ═════════════════════════════════════════════
// PAGE PRINCIPALE (StatefulWidget pour l'interactivité)
// ═════════════════════════════════════════════
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _bottomNavIndex = 0;
  String _tagSelectionne = 'Hiver';

  // Données de test
  final List<Map<String, String>> _produits = [
    {'nom': 'Veste polaire', 'prix': '149,99 €', 'image': '1'},
    {'nom': 'Sweat à capuche', 'prix': '89,99 €', 'image': '2'},
    {'nom': 'Bonnet chaud', 'prix': '39,99 €', 'image': '3'},
    {'nom': 'Chaussures trail', 'prix': '129,99 €', 'image': '4'},
  ];

  final List<String> _tags = [
    'Hiver', 'Sport', 'Urbain', 'Rando', 'Casual', 'Premium',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // ─────────────────────────────────────
              // 1. BARRE DE RECHERCHE + PANIER
              // ─────────────────────────────────────
              const Padding(
                padding: EdgeInsets.fromLTRB(16, 16, 16, 8),
                child: SearchBarWidget(),
              ),

              // ─────────────────────────────────────
              // 2. BANNIÈRE PROMO
              // ─────────────────────────────────────
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: PromoBanner(),
              ),

              const SizedBox(height: 24),

              // ─────────────────────────────────────
              // 3. CATÉGORIES
              // ─────────────────────────────────────
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Text(
                  'Catégories',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(height: 12),
              const CategoriesRow(),

              const SizedBox(height: 24),

              // ─────────────────────────────────────
              // 4. PRODUITS (grille 2x2)
              // ─────────────────────────────────────
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Text(
                  'Nouveautés',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(height: 12),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(child: ProductCard.fromMap(_produits[0])),
                        const SizedBox(width: 12),
                        Expanded(child: ProductCard.fromMap(_produits[1])),
                      ],
                    ),
                    const SizedBox(height: 12),
                    Row(
                      children: [
                        Expanded(child: ProductCard.fromMap(_produits[2])),
                        const SizedBox(width: 12),
                        Expanded(child: ProductCard.fromMap(_produits[3])),
                      ],
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 24),

              // ─────────────────────────────────────
              // 5. TAGS POPULAIRES
              // ─────────────────────────────────────
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Text(
                  'Tags populaires',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(height: 12),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  alignment: WrapAlignment.start,
                  children: _tags.map((tag) {
                    return ChoiceChip(
                      label: Text(tag),
                      selected: _tagSelectionne == tag,
                      onSelected: (value) {
                        setState(() {
                          _tagSelectionne = tag;
                        });
                      },
                    );
                  }).toList(),
                ),
              ),

              const SizedBox(height: 32),
            ],
          ),
        ),
      ),

      // ─────────────────────────────────────
      // BOTTOM NAVIGATION BAR
      // ─────────────────────────────────────
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _bottomNavIndex,
        onTap: (index) {
          setState(() {
            _bottomNavIndex = index;
          });
        },
        type: BottomNavigationBarType.fixed,
        selectedItemColor: const Color(0xFF7B2FF7),
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Accueil'),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Recherche'),
          BottomNavigationBarItem(icon: Icon(Icons.favorite), label: 'Favoris'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profil'),
        ],
      ),
    );
  }
}

// ═════════════════════════════════════════════
// WIDGET : Barre de recherche + panier avec badge
// ═════════════════════════════════════════════
class SearchBarWidget extends StatelessWidget {
  const SearchBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // Champ de recherche
        Expanded(
          child: Container(
            height: 44,
            padding: const EdgeInsets.symmetric(horizontal: 12),
            decoration: BoxDecoration(
              color: Colors.grey.shade100,
              borderRadius: BorderRadius.circular(30),
            ),
            child: Row(
              children: const [
                Icon(Icons.search, color: Colors.grey, size: 20),
                SizedBox(width: 8),
                Text(
                  'Rechercher...',
                  style: TextStyle(color: Colors.grey, fontSize: 14),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(width: 12),

        // Panier avec badge
        Stack(
          clipBehavior: Clip.none,
          children: [
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.shopping_bag_outlined, size: 26),
            ),
            Positioned(
              top: 6,
              right: 6,
              child: Container(
                width: 16,
                height: 16,
                decoration: const BoxDecoration(
                  color: Colors.red,
                  shape: BoxShape.circle,
                ),
                child: const Center(
                  child: Text(
                    '3',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

// ═════════════════════════════════════════════
// WIDGET : Bannière promotionnelle
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
                // Titre + sous-titre
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
                        style: TextStyle(color: Colors.white70, fontSize: 15),
                      ),
                    ],
                  ),
                ),

                // Bouton "SHOPPER"
                Align(
                  alignment: Alignment.bottomRight,
                  child: ElevatedButton.icon(
                    onPressed: () {},
                    icon: const Icon(Icons.arrow_forward, size: 16),
                    label: const Text('SHOPPER'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: const Color(0xFF7B2FF7),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 14,
                        vertical: 10,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      textStyle: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
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
// WIDGET : Row de 4 catégories
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
          _CategorieItem(
            icon: Icons.checkroom,
            label: 'Vêtements',
            color: Color(0xFFE3F2FD),
          ),
          _CategorieItem(
            icon: Icons.directions_run,
            label: 'Sport',
            color: Color(0xFFE8F5E9),
          ),
          _CategorieItem(
            icon: Icons.hiking,
            label: 'Rando',
            color: Color(0xFFFFF3E0),
          ),
          _CategorieItem(
            icon: Icons.ac_unit,
            label: 'Hiver',
            color: Color(0xFFE1F5FE),
          ),
        ],
      ),
    );
  }
}

// Item de catégorie (privé, utilisé uniquement dans CategoriesRow)
class _CategorieItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final Color color;

  const _CategorieItem({
    required this.icon,
    required this.label,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 64,
          height: 64,
          decoration: BoxDecoration(
            color: color,
            shape: BoxShape.circle,
          ),
          child: Icon(icon, size: 28, color: Colors.black87),
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
// WIDGET : Carte produit réutilisable
// ═════════════════════════════════════════════
class ProductCard extends StatelessWidget {
  final String nom;
  final String prix;
  final String imageUrl;

  const ProductCard({
    super.key,
    required this.nom,
    required this.prix,
    required this.imageUrl,
  });

  // Constructeur nommé : crée une ProductCard depuis une Map
  factory ProductCard.fromMap(Map<String, String> data) {
    return ProductCard(
      nom: data['nom'] ?? '',
      prix: data['prix'] ?? '',
      imageUrl: 'https://picsum.photos/seed/${data['image']}/300/300',
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Image carrée
        AspectRatio(
          aspectRatio: 1.0,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.network(
              imageUrl,
              fit: BoxFit.cover,
              loadingBuilder: (context, child, progress) {
                if (progress == null) return child;
                return Container(
                  color: Colors.grey.shade200,
                  child: const Center(
                    child: CircularProgressIndicator(strokeWidth: 2),
                  ),
                );
              },
            ),
          ),
        ),
        const SizedBox(height: 8),

        // Nom
        Text(
          nom,
          style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        const SizedBox(height: 2),

        // Note
        Row(
          children: List.generate(
            5,
            (_) => const Icon(Icons.star, color: Colors.amber, size: 12),
          ),
        ),
        const SizedBox(height: 4),

        // Prix avec FittedBox pour qu'il tienne toujours
        SizedBox(
          width: double.infinity,
          height: 20,
          child: FittedBox(
            fit: BoxFit.scaleDown,
            alignment: Alignment.centerLeft,
            child: Text(
              prix,
              style: const TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
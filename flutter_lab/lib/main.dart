import 'package:flutter/material.dart';

void main() {
  runApp(
    const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.all(20),
            child: PromoPage(),
          ),
        ),
      ),
    ),
  );
}

class PromoPage extends StatelessWidget {
  const PromoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const BannierePromo(),
          const SizedBox(height: 24),

          const Text(
            'Catégories populaires',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 12),

          // Grille de carrés avec IMAGES
          Row(
            children: [
              Expanded(child: _buildCarreImage(0)),
              const SizedBox(width: 8),
              Expanded(child: _buildCarreImage(1)),
              const SizedBox(width: 8),
              Expanded(child: _buildCarreImage(2)),
              const SizedBox(width: 8),
              Expanded(child: _buildCarreImage(3)),
            ],
          ),

          const SizedBox(height: 24),

          // BONUS : Les prix avec FittedBox
          const Text(
            'Meilleures ventes',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 12),

          Row(
            children: const [
              Expanded(child: _PrixCard(prix: '29,99 €', nom: 'Casque')),
              SizedBox(width: 8),
              Expanded(child: _PrixCard(prix: '149,99 €', nom: 'Veste')),
              SizedBox(width: 8),
              Expanded(child: _PrixCard(prix: '1299,00 €', nom: 'Ordinateur')),
            ],
          ),
        ],
      ),
    );
  }

  // Carré avec Image de fond
  Widget _buildCarreImage(int index) {
    return AspectRatio(
      aspectRatio: 1.0,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Image.network(
          'https://picsum.photos/seed/$index/200/200',
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

// ─────────────────────────────────────
// CARTE PRIX AVEC FittedBox
// ─────────────────────────────────────
class _PrixCard extends StatelessWidget {
  final String prix;
  final String nom;

  const _PrixCard({required this.prix, required this.nom});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // FittedBox pour que le prix tienne toujours
        SizedBox(
          width: double.infinity,
          height: 24,
          child: FittedBox(
            fit: BoxFit.scaleDown,
            alignment: Alignment.centerLeft,
            child: Text(
              prix,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
          ),
        ),
        const SizedBox(height: 4),
        Text(nom, style: const TextStyle(fontSize: 13, color: Colors.grey)),
      ],
    );
  }
}

// (La BannierePromo reste identique à la version précédente)
class BannierePromo extends StatelessWidget {
  const BannierePromo({super.key});

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
                Align(
                  alignment: Alignment.bottomRight,
                  child: ElevatedButton.icon(
                    onPressed: () {},
                    icon: const Icon(Icons.arrow_forward, size: 18),
                    label: const Text('SHOPPER'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: const Color(0xFF7B2FF7),
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      textStyle: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
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
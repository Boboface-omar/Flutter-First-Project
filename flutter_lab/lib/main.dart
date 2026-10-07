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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // ─────────────────────────────────────
        // 1. BANNIÈRE PROMOTIONNELLE
        // ─────────────────────────────────────
        const BannierePromo(),

        const SizedBox(height: 24),

        // ─────────────────────────────────────
        // 2. TITRE DE SECTION
        // ─────────────────────────────────────
        const Text(
          'Catégories populaires',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 12),

        // ─────────────────────────────────────
        // 3. GRILLE DE 4 CARRÉS
        // ─────────────────────────────────────
        Row(
          children: [
            Expanded(child: _buildCarre(Icons.image)),
            const SizedBox(width: 8),
            Expanded(child: _buildCarre(Icons.shopping_bag)),
            const SizedBox(width: 8),
            Expanded(child: _buildCarre(Icons.local_offer)),
            const SizedBox(width: 8),
            Expanded(child: _buildCarre(Icons.star)),
          ],
        ),
      ],
    );
  }

  // Méthode helper pour les carrés
  Widget _buildCarre(IconData icon) {
    return AspectRatio(
      aspectRatio: 1.0,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.grey.shade200,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Icon(icon, size: 32, color: Colors.grey.shade700),
      ),
    );
  }
}

// ═════════════════════════════════════════════
// BANNIÈRE PROMOTIONNELLE
// ═════════════════════════════════════════════
class BannierePromo extends StatelessWidget {
  const BannierePromo({super.key});

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 16 / 9,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: Container(
          // Le dégradé violet → rose
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Color(0xFF7B2FF7),  // Violet
                Color(0xFFF107A3),  // Rose vif
              ],
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Stack(
              fit: StackFit.expand,
              children: [
                // ─────────────────────────────────────
                // COUCHE 1 : Titre + Sous-titre
                // ─────────────────────────────────────
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
                        style: TextStyle(
                          color: Colors.white70,
                          fontSize: 15,
                        ),
                      ),
                    ],
                  ),
                ),

                // ─────────────────────────────────────
                // COUCHE 2 : Bouton "SHOPPER"
                // ─────────────────────────────────────
                Align(
                  alignment: Alignment.bottomRight,
                  child: ElevatedButton.icon(
                    onPressed: () {},
                    icon: const Icon(Icons.arrow_forward, size: 18),
                    label: const Text('SHOPPER'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: const Color(0xFF7B2FF7),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 12,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      textStyle: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 13,
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
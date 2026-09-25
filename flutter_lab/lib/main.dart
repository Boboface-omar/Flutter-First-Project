import 'package:flutter/material.dart';

void main() {
  runApp(
    const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SafeArea(child: Center(child: CarteProduit())),
      ),
    ),
  );
}

class CarteProduit extends StatelessWidget {
  const CarteProduit({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: const [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 10,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // ─────────────────────────────────────
            // IMAGE DU PRODUIT (fond gris + icône)
            // ─────────────────────────────────────
            Container(
              width: double.infinity,
              height: 150,
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Center(
                child: Icon(Icons.headphones, size: 60, color: Colors.grey),
              ),
            ),
            const SizedBox(height: 16),

            // ─────────────────────────────────────
            // TITRE
            // ─────────────────────────────────────
            const Text(
              'Casque Audio',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 4),

            // ─────────────────────────────────────
            // PRIX
            // ─────────────────────────────────────
            const Text(
              '129,99 €',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
            const SizedBox(height: 12),

            // ─────────────────────────────────────
            // NOTE + FAVORI (Row)
            // ─────────────────────────────────────
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // 5 étoiles
                Row(
                  children: List.generate(
                    5,
                    (i) =>
                        const Icon(Icons.star, color: Colors.amber, size: 18),
                  ),
                ),
                // Favori
                const Icon(Icons.favorite_border, color: Colors.red, size: 24),
              ],
            ),
            const SizedBox(height: 16),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {},
                child: const Text('Ajouter au panier'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

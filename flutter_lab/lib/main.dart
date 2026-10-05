import 'package:flutter/material.dart';

void main() {
  runApp(
    const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.all(24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Article(),
                SizedBox(height: 16),
                // ─────────────────────────────────────
                // LIGNE AUTEUR
                // ─────────────────────────────────────
                Row(
                  children: [
                    const CircleAvatar(
                      radius: 16,
                      child: Icon(Icons.person, size: 20),
                    ),
                    const SizedBox(width: 8),
                    const Text(
                      'Par Alice Dupont',
                      style: TextStyle(fontSize: 14),
                    ),
                    const Spacer(),
                    const Text(
                      '25 Sept 2026',
                      style: TextStyle(fontSize: 14, color: Colors.grey),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    ),
  );
}

class Article extends StatelessWidget {
  const Article({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 250,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: Stack(
          fit: StackFit.expand,
          children: [
            // ─────────────────────────────────────
            // COUCHE 1 : IMAGE DE FOND
            // ─────────────────────────────────────
            Image.network(
              'https://picsum.photos/400/300',
              fit: BoxFit.cover,
            ),

            // ─────────────────────────────────────
            // COUCHE 2 : DÉGRADÉ SOMBRE EN BAS
            // ─────────────────────────────────────
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.transparent,
                    Colors.black.withValues(alpha: 0.7),
                  ],
                  stops: const [0.5, 1.0],
                ),
              ),
            ),

            // ─────────────────────────────────────
            // COUCHE 3 : BADGE "NEW"
            // ─────────────────────────────────────
            Positioned(
              top: 12,
              left: 12,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(6),
                ),
                child: const Text(
                  'NEW',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),

            // ─────────────────────────────────────
            // COUCHE 4 : ICÔNE FAVORI
            // ─────────────────────────────────────
            const Positioned(
              top: 12,
              right: 12,
              child: Icon(Icons.favorite_border, color: Colors.white, size: 28),
            ),

            // ─────────────────────────────────────
            // COUCHE 5 : TITRE + DESCRIPTION
            // ─────────────────────────────────────
            const Positioned(
              left: 16,
              right: 16,
              bottom: 16,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Les nouvelles collections hiver',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    'Découvrez les tendances de la saison',
                    style: TextStyle(color: Colors.white70, fontSize: 14),
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
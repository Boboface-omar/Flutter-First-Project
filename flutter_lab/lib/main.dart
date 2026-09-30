import 'package:flutter/material.dart';

void main() {
  runApp(
    const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(body: ProfilePage()),
    ),
  );
}

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            // ─────────────────────────────────────
            // BARRE DU HAUT
            // ─────────────────────────────────────
            Row(
              children: [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.arrow_back),
                ),
                const Spacer(),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.more_vert),
                ),
              ],
            ),

            // ─────────────────────────────────────
            // CONTENU CENTRÉ
            // ─────────────────────────────────────
            const Spacer(),  // ← Pousse le contenu au centre

            const CircleAvatar(
              radius: 50,
              child: Icon(Icons.person, size: 60),
            ),
            const SizedBox(height: 16),

            const Text(
              'Alice Dupont',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),

            const Text(
              'Développeuse Flutter',
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
            const SizedBox(height: 24),

            // ─────────────────────────────────────
            // STATS
            // ─────────────────────────────────────
            Row(
              children: [
                Expanded(child: _buildStat('128', 'Posts')),
                Expanded(child: _buildStat('2.4k', 'Follow')),
                Expanded(child: _buildStat('512', 'Likes')),
              ],
            ),
            const SizedBox(height: 24),

            // ─────────────────────────────────────
            // BOUTON SUIVRE
            // ─────────────────────────────────────
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {},
                child: const Text('Suivre'),
              ),
            ),
            const SizedBox(height: 16),

            // ─────────────────────────────────────
            // BIO
            // ─────────────────────────────────────
            const Text(
              'Passionnée par Flutter et le développement mobile. '
              'J\'aime créer des interfaces élégantes et performantes.',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 14, color: Colors.grey),
            ),

            const Spacer(),  // ← Équilibre le Spacer du haut (optionnel)
          ],
        ),
      ),
    );
  }

  // ─────────────────────────────────────
  // MÉTHODE HELPER
  // ─────────────────────────────────────
  Widget _buildStat(String value, String label) {
    return Column(
      children: [
        Text(
          value,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        Text(
          label,
          style: const TextStyle(color: Colors.grey),
        ),
      ],
    );
  }
}
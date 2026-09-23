import 'package:flutter/material.dart';

void main() {
  runApp(
    const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    ),
  );
}

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  // Palette de couleurs relevée sur le design
  static const Color _fond = Color(0xFFF0EFEA);
  static const Color _texte = Color(0xFF111111);
  static const Color _dotInactif = Color(0xFFC8C8C8);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    final margeGauche = size.width * 0.09; // 9% de marge à gauche

    return Scaffold(
      backgroundColor: _fond,
      body: Stack(
        fit: StackFit.expand,
        children: [
          // ─────────────────────────────────────────────────
          // COUCHE 1 : IMAGE DU PERSONNAGE (derrière les textes)
          // ─────────────────────────────────────────────────
          Positioned(
            right: -200,
            bottom: 0,
            width: size.width * 0.95,
            height: size.height * 0.95,
            child: Image.asset(
              'assets/images/splash_person.png',
              fit: BoxFit.contain,
              alignment: Alignment.bottomRight,
            ),
          ),

          // ─────────────────────────────────────────────────
          // COUCHE 2 : DOTS DE PAGINATION (en haut, centrés)
          // ─────────────────────────────────────────────────
          Positioned(
            top: size.height * 0.085,
            left: 0,
            right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildDot(active: true),
                const SizedBox(width: 8),
                _buildDot(active: false),
                const SizedBox(width: 8),
                _buildDot(active: false),
              ],
            ),
          ),

          // ─────────────────────────────────────────────────
          // COUCHE 3 : TITRE PRINCIPAL
          // ─────────────────────────────────────────────────
          Positioned(
            top: size.height * 0.21,
            left: margeGauche,
            right: size.width * 0.30, // Largeur max : 70% de l'écran
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Découvrez.',
                  style: TextStyle(
                    fontSize: 38,
                    fontWeight: FontWeight.w800,
                    color: _texte,
                    height: 1.0,
                    letterSpacing: -1.5,
                  ),
                ),
                SizedBox(height: 2),
                Text(
                  'Les exclusivités.',
                  style: TextStyle(
                    fontSize: 38,
                    fontWeight: FontWeight.w300,
                    color: _texte,
                    height: 1.0,
                    letterSpacing: -1.2,
                  ),
                ),
              ],
            ),
          ),

          // ─────────────────────────────────────────────────
          // COUCHE 4 : SOUS-TITRE
          // ─────────────────────────────────────────────────
          Positioned(
            top: size.height * 0.330,
            left: margeGauche,
            right: size.width * 0.28,
            child: const Text(
              'Explorez des collections rares '
              'et des collaborations uniques '
              'de marques comme The '
              'North Face.',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w400,
                color: _texte,
                height: 1.45,
                letterSpacing: 0.1,
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Méthode helper pour éviter la répétition
  Widget _buildDot({required bool active}) {
    return Container(
      width: 7,
      height: 7,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: active ? _texte : _dotInactif,
      ),
    );
  }
}
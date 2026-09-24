import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,  // Bonus : enlève le bandeau "DEBUG"
      home: Scaffold(
        body: SafeArea(                    // ⭐ FIX N°1
          child: Stack(
            children: [
              // ─────────────────────────────────────
              // CENTRE
              // ─────────────────────────────────────
              Center(
                child: Container(
                  width: 150,
                  height: 150,
                  decoration: BoxDecoration(
                    color: Colors.purple.shade200,
                    borderRadius: BorderRadius.circular(20),  // ⭐ FIX N°2
                  ),
                  child: const Center(
                    child: Text(
                      'CENTRE',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),

              // ─────────────────────────────────────
              // COIN HAUT-GAUCHE (bleu)
              // ─────────────────────────────────────
              Align(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: const Text(
                    'Coin haut-Gauche',
                    style: TextStyle(fontSize: 16, color: Colors.blue),
                  ),
                ),
              ),

              // ─────────────────────────────────────
              // COIN HAUT-DROIT (rouge)
              // ─────────────────────────────────────
              Align(
                alignment: Alignment.topRight,
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: const Text(
                    'Coin haut-droit',
                    style: TextStyle(fontSize: 16, color: Colors.red),
                  ),
                ),
              ),

              // ─────────────────────────────────────
              // COIN BAS-GAUCHE (vert)
              // ─────────────────────────────────────
              Align(
                alignment: Alignment.bottomLeft,
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: const Text(
                    'Coin Bas-Gauche',
                    style: TextStyle(fontSize: 16, color: Colors.green),
                  ),
                ),
              ),

              // ─────────────────────────────────────
              // COIN BAS-DROIT (ambre)
              // ─────────────────────────────────────
              Align(
                alignment: Alignment.bottomRight,
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: const Text(
                    'Coin Bas-Droite',
                    style: TextStyle(fontSize: 16, color: Colors.amber),
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
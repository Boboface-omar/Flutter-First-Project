import 'package:flutter/material.dart';

void main() {
  runApp(
    const MaterialApp(
      home: Scaffold(
        body: FicheJoueur(nom: 'Aragon'),
      ),
    ),
  );
}

// --- Widget Titre (Stateless) ---
class Titre extends StatelessWidget {
  final String titre;

  const Titre({super.key, required this.titre});

  @override
  Widget build(BuildContext context) {
    return Text(
      titre,
      style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
    );
  }
}

// --- Widget FicheJoueur (Stateful) ---
class FicheJoueur extends StatefulWidget {
  final String nom;

  const FicheJoueur({super.key, required this.nom});

  @override
  State<FicheJoueur> createState() => _FicheJoueurState();
}

class _FicheJoueurState extends State<FicheJoueur> {
  int niveau = 1;
  int pv = 100;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // 1. Le titre
          const Titre(titre: '🎮 FICHE DU JOUEUR'),
          const SizedBox(height: 20),

          // 2. Le nom
          Text('Nom : ${widget.nom}', style: const TextStyle(fontSize: 20)),
          const SizedBox(height: 20),

          // 3. Le niveau avec ses boutons
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Niveau : $niveau', style: const TextStyle(fontSize: 18)),
              const SizedBox(width: 10),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    if (niveau > 1) niveau--;
                  });
                },
                child: const Text('-'),
              ),
              const SizedBox(width: 5),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    niveau++;
                  });
                },
                child: const Text('+'),
              ),
            ],
          ),
          const SizedBox(height: 10),

          // 4. Les PV avec leurs boutons
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('PV : $pv/100', style: const TextStyle(fontSize: 18)),
              const SizedBox(width: 10),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    if (pv > 0) pv--;
                  });
                },
                child: const Text('-'),
              ),
              const SizedBox(width: 5),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    if (pv < 100) pv++;
                  });
                },
                child: const Text('+'),
              ),
            ],
          ),
          const SizedBox(height: 20),

          // 5. Le statut conditionnel
          Text(
            pv > 0 ? '💚 Vivant' : '💀 Mort',
            style: TextStyle(
              fontSize: 22,
              color: pv > 0 ? Colors.green : Colors.red,
            ),
          ),
        ],
      ),
    );
  }
}
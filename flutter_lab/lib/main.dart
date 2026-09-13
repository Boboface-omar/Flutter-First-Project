// Importe la bibliothèque Flutter Material Design
// Material Design = un style de design moderne avec des boutons, couleurs, animations, etc.
import 'package:flutter/material.dart';

// La fonction main() est le point d'entrée de l'application
// C'est la première fonction qui s'exécute au démarrage de l'app
void main() {
  // runApp() lance l'application en affichant le widget passé en paramètre
  runApp(
    const MaterialApp(
      // MaterialApp = la structure de base d'une app Flutter
      home: Scaffold(
        // Scaffold = un conteneur avec barre d'appli, corps, etc.
        // body = la zone principale où on affiche le contenu
        body: FicheJoueur(nom: 'Aragon'),
        // On crée une instance du widget FicheJoueur en passant le nom 'Aragon'
      ),
    ),
  );
}

// --- Widget Titre (Stateless) ---
// Un widget STATELESS = un widget qui ne change jamais son apparence
// Il reçoit des données (titre) et les affiche toujours de la même façon
class Titre extends StatelessWidget {
  // "final" = cette variable ne peut pas changer après sa création
  // Le titre est reçu de l'extérieur du widget
  final String titre;

  // Le constructeur (constructeur const = on ne peut pas modifier les variables)
  // "required" = ce paramètre est obligatoire
  // "super.key" = on passe la clé au widget parent (pour identifier les widgets)
  const Titre({super.key, required this.titre});

  // build() = la méthode qui construit et retourne l'interface du widget
  // Elle prend en paramètre "context" = le contexte de l'écran (couleurs, tailles, etc.)
  @override
  Widget build(BuildContext context) {
    // On retourne un widget Text qui affiche le titre
    return Text(
      titre,
      // TextStyle = l'apparence du texte (taille, poids, etc.)
      style: const TextStyle(
        fontSize: 24, // La taille du texte (en pixels)
        fontWeight: FontWeight.bold, // Le texte est en gras (bold)
      ),
    );
  }
}

// --- Widget FicheJoueur (Stateful) ---
// Un widget STATEFUL = un widget qui PEUT changer son apparence
// Par exemple : quand on clique sur un bouton, les chiffres changent
class FicheJoueur extends StatefulWidget {
  // Le nom du joueur passé au widget
  final String nom;

  // Le constructeur du widget
  const FicheJoueur({super.key, required this.nom});

  // createState() = crée l'objet qui gère l'état (les données qui changent)
  // Les <> indiquent le type : l'état va être de type _FicheJoueurState
  @override
  State<FicheJoueur> createState() => _FicheJoueurState();
}

// --- L'État du widget FicheJoueur ---
// Cette classe gère TOUTES les données qui peuvent changer
// Elle est appelée _FicheJoueurState (privée, car elle commence par _)
class _FicheJoueurState extends State<FicheJoueur> {
  // Les VARIABLES D'ÉTAT = les données qui peuvent changer
  // Quand on modifie ces variables, l'écran se réaffiche automatiquement

  int niveau = 1; // Le niveau du joueur, commence à 1
  int pv = 100; // Les points de vie du joueur, commence à 100

  // build() = la méthode qui construit l'interface visuellement
  @override
  Widget build(BuildContext context) {
    // Center = centre tout le contenu à l'écran
    return Center(
      // Column = une colonne verticale (empile les widgets de haut en bas)
      child: Column(
        // mainAxisAlignment = comment aligner les éléments verticalement
        // MainAxisAlignment.center = les éléments sont centrés verticalement
        mainAxisAlignment: MainAxisAlignment.center,
        // children = la liste des widgets à afficher dans la colonne
        children: [
          // 1. Le titre avec les emojis
          const Titre(titre: '🎮 FICHE DU JOUEUR'),
          // SizedBox = un petit espace invisible (hauteur de 20 pixels)
          const SizedBox(height: 20),

          // 2. Le nom du joueur
          // ${widget.nom} = affiche la variable nom du widget
          // widget = référence au FicheJoueur (le widget parent)
          Text('Nom : ${widget.nom}', style: const TextStyle(fontSize: 20)),
          const SizedBox(height: 20),

          // 3. Le niveau avec deux boutons (-  et +)
          // Row = une ligne horizontale (empile les widgets de gauche à droite)
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Affiche le niveau actuel
              Text('Niveau : $niveau', style: const TextStyle(fontSize: 18)),
              const SizedBox(width: 10), // Espace horizontal
              // Bouton MOINS pour diminuer le niveau
              ElevatedButton(
                // onPressed = ce qui se passe quand on clique
                onPressed: () {
                  // setState() = dit à Flutter que les données ont changé
                  // Tous les widgets vont se réafficher avec les nouvelles valeurs
                  setState(() {
                    // Si le niveau est supérieur à 1, on le diminue de 1
                    if (niveau > 1) niveau--;
                  });
                },
                // Le texte à afficher sur le bouton
                child: const Text('-'),
              ),
              const SizedBox(width: 5),

              // Bouton PLUS pour augmenter le niveau
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    // On augmente le niveau de 1 (pas de limite)
                    niveau++;
                  });
                },
                child: const Text('+'),
              ),
            ],
          ),
          const SizedBox(height: 10),

          // 4. Les PV (points de vie) avec deux boutons (- et +)
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Affiche les PV actuels sur 100
              Text('PV : $pv/100', style: const TextStyle(fontSize: 18)),
              const SizedBox(width: 10),

              // Bouton MOINS pour perdre des PV
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    // Si les PV sont supérieurs à 0, on les diminue de 1
                    if (pv > 0) pv--;
                  });
                },
                child: const Text('-'),
              ),
              const SizedBox(width: 5),

              // Bouton PLUS pour récupérer des PV
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    // Si les PV sont inférieurs à 100, on les augmente de 1
                    if (pv < 100) pv++;
                  });
                },
                child: const Text('+'),
              ),
            ],
          ),
          const SizedBox(height: 20),

          // 5. Le statut du joueur (conditionnel)
          // ? : = opérateur ternaire (si condition ? valeur vraie : valeur fausse)
          Text(
            // Si pv > 0 : affiche "💚 Vivant", sinon affiche "💀 Mort"
            pv > 0 ? '💚 Vivant' : '💀 Mort',
            style: TextStyle(
              fontSize: 22,
              // Si pv > 0 : le texte est VERT, sinon il est ROUGE
              color: pv > 0 ? Colors.green : Colors.red,
            ),
          ),
        ],
      ),
    );
  }
}

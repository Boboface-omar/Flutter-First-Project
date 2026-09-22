import 'package:flutter/material.dart';

void main() {
  runApp(
    const MaterialApp(
      home: Scaffold(
        body: Center(
          child: CarteProfil(),
        ),
      ),
    ),
  );
}

class CarteProfil extends StatelessWidget {
  const CarteProfil({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: const [
          BoxShadow(color: Colors.black12, blurRadius: 10),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,  // Prend seulement la hauteur nécessaire
        children: [
          // --- Avatar ---
          const CircleAvatar(
            radius: 40,
            backgroundColor: Colors.blue,
            child: Icon(Icons.person, size: 40, color: Colors.white),
          ),
          const SizedBox(height: 15),

          // --- Nom ---
          const Text(
            'Alice Dupont',
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 5),

          // --- Métier ---
          const Text(
            'Développeuse Flutter',
            style: TextStyle(color: Colors.grey),
          ),
          const SizedBox(height: 20),

          // --- Boutons (Row) ---
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: () {},
                child: const Text('Suivre'),
              ),
              OutlinedButton(
                onPressed: () {},
                child: const Text('Message'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
import 'package:flutter/material.dart';

void main() {
  runApp(
    const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ContactsPage(),
    ),
  );
}

class ContactsPage extends StatelessWidget {
  const ContactsPage({super.key});

  final List<Map<String, String>> contacts = const [
    {'nom': 'Alice Dupont', 'statut': 'En ligne'},
    {'nom': 'Bob Martin', 'statut': 'Occupé'},
    {'nom': 'Charlie Dubois', 'statut': 'Absent'},
    {'nom': 'Diane Leroy', 'statut': 'En ligne'},
    {'nom': 'Eve Moreau', 'statut': 'Occupé'},
    {'nom': 'Frank Petit', 'statut': 'En ligne'},
    {'nom': 'Grace Roux', 'statut': 'Absent'},
    {'nom': 'Henry Blanc', 'statut': 'En ligne'},
    {'nom': 'Iris Garnier', 'statut': 'Occupé'},
    {'nom': 'Jack Faure', 'statut': 'En ligne'},
    {'nom': 'Kate Girard', 'statut': 'Absent'},
    {'nom': 'Léo Mercier', 'statut': 'En ligne'},
    {'nom': 'Marie Bonnet', 'statut': 'Occupé'},
    {'nom': 'Noah Dupuis', 'statut': 'En ligne'},
    {'nom': 'Olga Lambert', 'statut': 'Absent'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Contacts')),
      body: ListView.separated(
        itemCount: contacts.length,
        itemBuilder: (context, index) {
          final contact = contacts[index];
          final nom = contact['nom']!;
          final statut = contact['statut']!;

          return ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.blue.shade100,
              child: Text(
                nom[0],  // Première lettre du nom
                style: const TextStyle(
                  color: Colors.blue,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            title: Text(
              nom,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: Text(
              statut,
              style: const TextStyle(color: Colors.grey),
            ),
            trailing: const Text(
              '14h30',
              style: TextStyle(color: Colors.grey, fontSize: 12),
            ),
            onTap: () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('Contact : $nom'),
                  duration: const Duration(seconds: 1),
                ),
              );
            },
          );
        },
        separatorBuilder: (context, index) => const Divider(height: 1),
      ),
    );
  }
}
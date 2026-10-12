import 'package:flutter/material.dart';

void main() {
  runApp(
    const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MessagesPage(),
    ),
  );
}

class MessagesPage extends StatelessWidget {
  const MessagesPage({super.key});

  // Liste de messages variés
  final List<Map<String, String>> messages = const [
    {'nom': 'Oumar', 'message': 'Salut, ça va ?', 'heure': '22h'},
    {'nom': 'Alice', 'message': 'On se voit demain ?', 'heure': '21h'},
    {'nom': 'Bob', 'message': 'Merci pour hier 🙏', 'heure': '20h'},
    {'nom': 'Charlie', 'message': 'Super nouvelle !', 'heure': '19h'},
    {'nom': 'Diane', 'message': 'Je t\'envoie le fichier', 'heure': '18h'},
    {'nom': 'Eve', 'message': 'Bon week-end !', 'heure': '17h'},
    {'nom': 'Frank', 'message': 'Appelle-moi quand tu peux', 'heure': '16h'},
    {'nom': 'Grace', 'message': 'Photo envoyée 📸', 'heure': '15h'},
    {'nom': 'Henry', 'message': 'OK pour demain', 'heure': '14h'},
    {'nom': 'Iris', 'message': 'Tu es où ?', 'heure': '13h'},
    {'nom': 'Jack', 'message': 'Bien reçu ✅', 'heure': '12h'},
    {'nom': 'Kate', 'message': 'À plus tard !', 'heure': '11h'},
    {'nom': 'Léo', 'message': 'Merci beaucoup', 'heure': '10h'},
    {'nom': 'Marie', 'message': 'On mange ensemble ?', 'heure': '9h'},
    {'nom': 'Noah', 'message': 'Bonne journée', 'heure': '8h'},
    {'nom': 'Olga', 'message': 'À demain', 'heure': '7h'},
    {'nom': 'Paul', 'message': 'Reçu 5/5', 'heure': '6h'},
    {'nom': 'Quinn', 'message': 'Trop cool !', 'heure': '5h'},
    {'nom': 'Rose', 'message': 'Bisous 😘', 'heure': '4h'},
    {'nom': 'Sam', 'message': 'Bye', 'heure': '3h'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Messages'),
      ),
      body: ListView.separated(
        itemCount: messages.length,
        itemBuilder: (context, index) {
          final msg = messages[index];
          final nom = msg['nom']!;

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
              msg['message']!,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            trailing: Text(
              msg['heure']!,
              style: const TextStyle(fontSize: 12, color: Colors.grey),
            ),
            onTap: () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('Message de $nom ouvert'),
                  duration: const Duration(seconds: 2),
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
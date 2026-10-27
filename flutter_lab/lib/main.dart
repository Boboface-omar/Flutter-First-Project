import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.teal,
          brightness: Brightness.dark,
        ),
      ),
      home:  ApiPage(),
    );
  }
}

class ApiPage extends StatelessWidget {
   ApiPage({super.key});

  // ⚠️ FIX 4 : Le Future est stocké une seule fois
  late final Future<List<Map<String, dynamic>>> _futureUsers = _recupUsers();

  Future<List<Map<String, dynamic>>> _recupUsers() async {
    final response = await http.get(
      Uri.parse('https://jsonplaceholder.typicode.com/users'),
    );

    if (response.statusCode == 200) {
      final decoded = jsonDecode(response.body);
      return List<Map<String, dynamic>>.from(decoded);
    } else {
      throw Exception('Erreur HTTP : ${response.statusCode}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Utilisateurs'),
        centerTitle: true,
        leading: const Icon(Icons.person_search),
        backgroundColor: Colors.blueAccent,
      ),
      body: FutureBuilder<List<Map<String, dynamic>>>(
        future: _futureUsers,
        builder: (context, AsyncSnapshot<List<Map<String, dynamic>>> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            return Center(
              child: Text(
                'Erreur : ${snapshot.error}',
                style: const TextStyle(color: Colors.red),
              ),
            );
          }

          final users = snapshot.data!;

          return ListView.separated(
            padding: const EdgeInsets.all(15.0),
            itemCount: users.length, // ⚠️ FIX 2 : length
            itemBuilder: (context, index) {
              final user = users[index];
              
              return Card(
                margin: EdgeInsets.zero, // On gère l'espace avec le separator
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Row(
                    children: [
                      // ⚠️ FIX 3 : NetworkImage
                      CircleAvatar(
                        radius: 25,
                        backgroundImage: NetworkImage(
                          'https://i.pravatar.cc/150?u=${user['id']}',
                        ),
                      ),
                      const SizedBox(width: 16),
                      
                      // ⚠️ FIX 5 : Structure Column demandée
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              user['name'] ?? 'Sans nom',
                              style: const TextStyle(
                                fontSize: 18, 
                                fontWeight: FontWeight.bold
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              user['email'] ?? 'Pas d\'email',
                              style: const TextStyle(color: Colors.grey),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              user['address']['city'] ?? 'Ville inconnue',
                              style: const TextStyle(color: Colors.grey),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
            // ⚠️ FIX 5 (suite) : SizedBox au lieu de Divider
            separatorBuilder: (context, index) => const SizedBox(height: 10),
          );
        },
      ),
    );
  }
}
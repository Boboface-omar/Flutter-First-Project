import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ApiTestPage(),
    );
  }
}

class ApiTestPage extends StatelessWidget {
  const ApiTestPage({super.key});

  // ⚠️ FIX 1 : On stocke le FUTURE (le résultat), pas la fonction
  // On l'appelle une seule fois ici.
  Future<String> get _futurePosts => _recupPosts();

  Future<String> _recupPosts() async {
    final response = await http.get(
      Uri.parse('https://jsonplaceholder.typicode.com/posts'),
    );

    if (response.statusCode == 200) {
      return response.body;
    } else {
      // Message d'erreur plus clair
      throw Exception('Erreur serveur : code ${response.statusCode}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Test API'),
        centerTitle: true,
        leading: const Icon(Icons.api),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: FutureBuilder<String>(
          // ⚠️ FIX 1 (suite) : On passe la variable _futurePosts SANS parenthèses
          future: _futurePosts,
          builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
            // 1. En cours de chargement
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            }

            // 2. Erreur
            if (snapshot.hasError) {
              return Center(
                child: Text(
                  '${snapshot.error}',
                  style: const TextStyle(color: Colors.red),
                ),
              );
            }

            // 3. Succès
            // ⚠️ FIX 2 : Le SingleChildScrollView évite l'overflow
            return SingleChildScrollView(
              child: Text(snapshot.data ?? 'Aucune donnée'),
            );
          },
        ),
      ),
    );
  }
}
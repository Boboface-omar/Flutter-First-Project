import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;   // ← Alias ajouté

void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
   MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ApiTestpage(),
    );
  }
}

class ApiTestpage extends StatelessWidget {
   ApiTestpage({super.key});

  // ⚠️ Le Future est créé UNE SEULE FOIS ici
  late final Future<String> _futurePosts = _recupPost();

  Future<String> _recupPost() async {
    final response = await http.get(
      Uri.parse('https://jsonplaceholder.typicode.com/posts'),
    );

    if (response.statusCode == 200) {
      return response.body;
    } else {
      throw Exception('Erreur HTTP : ${response.statusCode}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Test API'),   // ← const
        centerTitle: true,
        leading: const Icon(Icons.api),   // ← const
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),   // ← const
          child: FutureBuilder<String>(
            future: _futurePosts,   // ← Utilisation de la variable
            builder: (context, snapshot) {
              // État 1 : Chargement
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              }

              // État 2 : Erreur
              if (snapshot.hasError) {
                return Center(child: Text('Erreur HTTP : ${snapshot.error}'));
              }

              // État 3 : Succès
              return SingleChildScrollView(
                child: Text('SUCCÈS : ${snapshot.data}'),
              );
            },
          ),
        ),
      ),
    );
  }
}
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
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ApiTest(),
    );
  }
}

class ApiTest extends StatelessWidget {
   ApiTest({super.key});

  // ⚠️ Le Future est stocké une seule fois
  Future<List<Map<String, dynamic>>> get _futurePosts => _recupPosts();

  Future<List<Map<String, dynamic>>> _recupPosts() async {
    final response = await http.get(
      Uri.parse('https://jsonplaceholder.typicode.com/posts'),
    );

    if (response.statusCode == 200) {
      final decoded = jsonDecode(response.body);
      return List<Map<String, dynamic>>.from(decoded);
    } else {
      throw Exception('Erreur serveur : ${response.statusCode}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea( // SafeArea à l'extérieur car pas d'AppBar
        child: FutureBuilder<List<Map<String, dynamic>>>(
          future: _futurePosts,
          // ⚠️ Snapshot typé
          builder: (context, AsyncSnapshot<List<Map<String, dynamic>>> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            }
            if (snapshot.hasError) {
              return Center(child: Text('Erreur : ${snapshot.error}'));
            }

            final posts = snapshot.data!;

            return ListView.builder(
              padding: const EdgeInsets.all(15.0), // ⚠️ Padding dans le ListView
              itemCount: posts.length,
              itemBuilder: (context, index) {
                final post = posts[index];
                
                return ListTile(
                  leading: CircleAvatar(child: Text('${index + 1}')),
                  title: Text(
                    post['title'] ?? 'Sans titre', // ⚠️ Sécurité
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  subtitle: Text(
                    post['body'] ?? 'Pas de description',
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  onTap: () => ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(post['title'] ?? 'Sans titre'),
                      duration: const Duration(seconds: 2),
                    ),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
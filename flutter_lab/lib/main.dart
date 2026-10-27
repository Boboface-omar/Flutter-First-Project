import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'dart:convert';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: ApiTest());
  }
}

class ApiTest extends StatelessWidget {
  ApiTest({super.key});
  Future<List<Map<String, dynamic>>> get _futurePosts => _recupPosts();

  Future<List<Map<String, dynamic>>> _recupPosts() async {
    final response = await http.get(
      Uri.parse('https://jsonplaceholder.typicode.com/posts'),
    );

    if (response.statusCode == 200) {
      // 1. On décode le texte JSON
      final decoded = jsonDecode(response.body);
      // 2. On le convertit en liste de Maps typée
      return List<Map<String, dynamic>>.from(decoded);
    } else {
      throw Exception(response.statusCode);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<List<Map<String, dynamic>>>(
        future: _futurePosts,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Center(child: Text('Erreur du serveur : ${snapshot.error}'));
          }

          // 3. Succès
          final posts = snapshot.data!; // Le '!' dit "je suis sûr que ce n'est pas null"

          return SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: ListView.builder( 
                itemCount: posts.length, // Il y a 100 posts dans l'API
                itemBuilder: (context, index) {
                  final post = posts[index];
              
                  return ListTile(
                    leading: CircleAvatar(child: Text('${index + 1}')),
                    title: Text(
                      post['title'], // On accède à la clé 'title'
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    subtitle: Text(
                      post['body'],
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    onTap: () => ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(post['title']), duration: Duration(seconds: 2),)),
                  );
                },
              ),
            ),
          );
        },
      ),
    );
  }
}

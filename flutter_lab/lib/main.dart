import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'dart:convert';

// ⚠️ FIX 1 : C'est une LISTE d'IDs (int), pas un seul int
final ValueNotifier<List<int>> _favoris = ValueNotifier<List<int>>([]);

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: PostsPage());
  }
}

class PostsPage extends StatelessWidget {
  PostsPage({super.key});

  // ⚠️ FIX 4 : On stocke le Future UNE SEULE FOIS
  Future<List<Map<String, dynamic>>> get _futurePosts => _recupPosts();

  Future<List<Map<String, dynamic>>> _recupPosts() async {
    final response = await http.get(
      Uri.parse('https://jsonplaceholder.typicode.com/posts'),
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
        title: const Text('Publications'),
        actions: [
          // ⚠️ FIX 1 (suite) : On écoute une List<int>
          ValueListenableBuilder<List<int>>(
            valueListenable: _favoris,
            builder: (context, favoris, _) {
              return Padding(
                padding: const EdgeInsets.only(right: 16),
                child: Center(
                  child: Row(
                    children: [
                      const Icon(Icons.favorite, color: Colors.red),
                      const SizedBox(width: 4),
                      Text(
                        '${favoris.length}',
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ],
      ),
      body: FutureBuilder<List<Map<String, dynamic>>>(
        future: _futurePosts, // ⚠️ FIX 4 : Sans parenthèses
        builder: (context, AsyncSnapshot<List<Map<String, dynamic>>> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            return Center(child: Text('Erreur : ${snapshot.error}'));
          }

          final posts = snapshot.data!;

          return Padding(
            padding: const EdgeInsets.all(15),
            child: ListView.builder(
              itemCount: posts.length,
              itemBuilder: (context, index) {
                final post = posts[index];
                final int postId = post['id']; // On cast l'ID en int

                return Card(
                  margin: const EdgeInsets.only(bottom: 8),
                  child: ListTile(
                    // ⚠️ FIX 2 : On utilise les bonnes clés de l'API /posts
                    leading: const Icon(Icons.article),
                    title: Text(
                      post['title'] ?? 'Sans titre',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    subtitle: Text(
                      post['body'] ?? 'Pas de description',
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    // ⚠️ FIX 3 : Le bouton favori
                    trailing: ValueListenableBuilder<List<int>>(
                      valueListenable: _favoris,
                      builder: (context, favoris, _) {
                        // On vérifie si l'ID du post est dans la liste
                        final bool isFav = favoris.contains(postId);

                        return IconButton(
                          onPressed: () {
                            // On crée une copie de la liste
                            final List<int> currentFavoris = List<int>.from(
                              favoris,
                            );

                            if (isFav) {
                              currentFavoris.remove(postId); // Retirer
                            } else {
                              currentFavoris.add(postId); // Ajouter
                            }

                            // On met à jour la ValueNotifier globale
                            _favoris.value = currentFavoris;
                          },
                          // L'icône change selon l'état
                          icon: Icon(
                            isFav ? Icons.favorite : Icons.favorite_border,
                            color: isFav ? Colors.red : null,
                          ),
                        );
                      },
                    ),
                    onTap: () {
                      ScaffoldMessenger.of(context)
                          .showSnackBar(SnackBar(content: Text(post['title'])));
                    },
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}

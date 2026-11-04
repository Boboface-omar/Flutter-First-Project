import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      home: CommentPage(),
    );
  }
}

class CommentPage extends StatelessWidget {
   CommentPage({super.key});

  // ⚠️ FIX 1 : final, pas get
  late final Future<List<Map<String, dynamic>>> _futureComments = _recupComments();

  Future<List<Map<String, dynamic>>> _recupComments() async {
    final response = await http.get(
      Uri.parse('https://jsonplaceholder.typicode.com/comments'),
    );

    if (response.statusCode == 200) {
      final decoded = jsonDecode(response.body);
      return List<Map<String, dynamic>>.from(decoded);
    } else {
      throw Exception('Erreur HTTP : ${response.statusCode}');
    }
  }

  Widget _buildLoader() {
    return const Center(child: CircularProgressIndicator());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Commentaires'), centerTitle: true),
      body: FutureBuilder<List<Map<String, dynamic>>>(
        future: _futureComments,
        // ⚠️ FIX 4 : Typage du snapshot
        builder: (context, AsyncSnapshot<List<Map<String, dynamic>>> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return _buildLoader();
          }

          if (snapshot.hasError) {
            return Center(
              child: Text(
                '${snapshot.error}',
                style: const TextStyle(color: Colors.red, fontSize: 20),
              ),
            );
          }
          
          final comments = snapshot.data!;

          return ListView.separated(
            itemCount: comments.length,
            padding: const EdgeInsets.all(20),
            itemBuilder: (context, index) {
              final comment = comments[index];

              return ListTile(
                // J'ai gardé ton excellent choix de l'initiale
                leading: CircleAvatar(child: Text(comment['name'][0])),
                // ⚠️ FIX 2 : L'email comme demandé
                title: Text(
                  comment['email'],
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: Text(
                  comment['body'],
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                onTap: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text(comment['name'])),
                  );
                },
              );
            },
            separatorBuilder: (context, index) => const Divider(),
          );
        },
      ),
    );
  }
}
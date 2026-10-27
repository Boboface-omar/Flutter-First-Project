import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

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
  Future<String> get _futurePosts => _recupPosts();

  Future<String> _recupPosts() async {
    final response = await http.get(
      Uri.parse('https://jsonplaceholder.typicode.com/posts'),
    );

    if (response.statusCode == 200) {
      return response.body;
    } else {
      throw Exception(response.statusCode);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: _futurePosts,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Center(child: Text('Erreur du serveur : ${snapshot.error}'),);
          }
          return SingleChildScrollView(child: Text(snapshot.data, style: TextStyle(color: Colors.red),));
        },
      ),
    );
  }
}

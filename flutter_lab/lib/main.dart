import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'dart:convert';

void main() {
  runApp(Myapp());
}

class Myapp extends StatelessWidget {
  const Myapp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: apiTestPage());
  }
}

class apiTestPage extends StatelessWidget {
   apiTestPage({super.key});

  late final _futurePosts = _recupPosts;

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
      appBar: AppBar(title: Text('Api Testes'),centerTitle: true, leading: Icon(Icons.api_sharp),),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: FutureBuilder(
            future: _futurePosts(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return CircularProgressIndicator();
              }
          
              if (snapshot.hasError) {
                return Center(child: Text('${snapshot.error}'),);
              }
              return Text(snapshot.data);
            },
          ),
        ),
      ),
    );
  }
}

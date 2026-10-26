import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  Future<void> recupererDonnees() async {
    // Requette
    final response = await http.get(
      Uri.parse('https://jsonplaceholder.typicode.com/users'),
    );

    //Verification
    if (response.statusCode == 200) {
      print('Succes');
      print(response.body);
    } else {
      print('Erreur ${response.statusCode}');
    }
  }

  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SafeArea(
          child: FutureBuilder(
            future: recupererDonnees(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator());
              }

              if (snapshot.hasError) {
                return Center(child: Text('ERROR : ${snapshot.error}'),);
              }

              return Text('Succes : ${snapshot.data}');
            },
          ),
        ),
      ),
    ),
  );
}

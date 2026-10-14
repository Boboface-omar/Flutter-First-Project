import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(debugShowCheckedModeBanner: false, home: Grille()));
}

class Grille extends StatelessWidget {
  const Grille({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(title: Text('Galerie')),
      body: SafeArea(
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            mainAxisSpacing: 2,
            crossAxisSpacing: 2,
            mainAxisExtent: 130,
          ),
          padding: EdgeInsets.all(2),
          itemCount: 30,
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
              child: Image.network('https://picsum.photos/seed/$index/200/200', fit: BoxFit.cover,),
              onTap: () => ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Photo ${index + 1} sélectionnée'), duration: Duration(seconds: 5),)),
            );
          },
        ),
      ),
    );
  }
}

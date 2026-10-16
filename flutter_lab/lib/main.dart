import 'package:flutter/material.dart';

void main() {
  runApp(Myapp());
}

class Myapp extends StatelessWidget {
  const Myapp({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.teal,
          brightness: Brightness.dark,
        ),
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Revision'),
          backgroundColor: Colors.green,
          centerTitle: true,
          // leading: Icon(Icons.person),
          actions: [Icon(Icons.book)],
        ),
        drawer: SafeArea(
          child: Drawer(
            child: Column(
              children: [
                // Image.asset('assets/images/logo.png'),
                // SizedBox(height: 10.0,),
                ListTile(title: Text('data'),),
              ],
            ),
          ),
        ),
        floatingActionButton: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            FloatingActionButton(
              onPressed: () {
                print('Clicked');
              },
              child: Icon(Icons.chat_bubble),
            ),
            SizedBox(height: 10.0,)
            ,
            FloatingActionButton(
              onPressed: () {
                print('Clicked');
              },
              child: Icon(Icons.chat_bubble),
            )
          ],
        ),
        bottomNavigationBar: NavigationBar(
          destinations: [
            NavigationDestination(icon: Icon(Icons.home), label: 'Acceuil'),
            NavigationDestination(icon: Icon(Icons.person), label: 'Profil'),
          ],
        ),
      ),
    );
  }
}

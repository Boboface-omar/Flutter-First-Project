import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.teal,
          brightness: Brightness.dark,
        ),
      ),
      home: Homepage(),
    ),
  );
}

class Homepage extends StatelessWidget {
  Homepage({super.key});
  final List<Map<String, String>> produits = [
    {'nom': 'Veste', 'prix': '89,99 €'},
    {'nom': 'Sweat', 'prix': '49,99 €'},
    {'nom': 'Bonnet', 'prix': '19,99 €'},
    {'nom': 'Chaussures', 'prix': '119,99 €'},
    {'nom': 'Gants', 'prix': '24,99 €'},
    {'nom': 'Écharpe', 'prix': '29,99 €'},
    {'nom': 'Sac', 'prix': '59,99 €'},
    {'nom': 'Gourde', 'prix': '14,99 €'},
  ];

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('Produits'),
        leading: Icon(Icons.shop),
        centerTitle: true,
      ),
      bottomNavigationBar: NavigationBar(
        destinations: [
          NavigationDestination(icon: Icon(Icons.home), label: 'Home'),
          NavigationDestination(icon: Icon(Icons.list), label: 'Liste'),
        ],
      ),
      body: ListView.builder(
        itemCount: produits.length,
        itemBuilder: (BuildContext context, int index) {
          final produit = produits[index];
          return ListTile(
            leading: Icon(Icons.shopping_bag),
            title: Text(produit['nom'] ?? ''),
            subtitle: Text(produit['prix'] ?? ''),
            trailing: Icon(Icons.chevron_right),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) =>  ProductDetailPage(
                  nom: produit['nom'] ?? '',
                  prix: produit['prix'] ?? '',
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class ProductDetailPage extends StatelessWidget {
  final String nom;
  final String prix;
  ProductDetailPage({super.key, required this.nom, required this.prix});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(title: Text(nom),),
      body: Center(
        child: Padding(padding: EdgeInsets.all(10),
        child: Card(
          child: Padding(padding: EdgeInsets.all(10),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.image, size: 100,),
              SizedBox(height: 10,),
              Text(nom, style: TextStyle(fontSize: 20),),
              SizedBox(height: 10,),
             Text(prix, style: TextStyle(fontSize: 15),)
             ,
              SizedBox(height: 10,),
              ElevatedButton(onPressed: () {
                Navigator.pop(context, 'Produit Ajoute');
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Produit ajouté'), duration: Duration(seconds: 1),));
              }, child: Text('Ajouter Au Panier'))
            ],
          ),
          ),
        ),
        ),
      ),
    );
  }
}

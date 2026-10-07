import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SafeArea(
          child: Center(
            child: Padding(padding: EdgeInsets.all(16), child: ProductCard()),
          ),
        ),
      ),
    ),
  );
}

class ProductCard extends StatelessWidget {
  const ProductCard({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Card(
      child: Padding(padding: EdgeInsets.all(15), child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          AspectRatio(aspectRatio: 16/9,
          child: Image.asset('assets/images/logo.png'),
          ),
          Positioned(bottom: 0, left: 0,child: Padding(padding: EdgeInsets.all(15), child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Produit Flutter'),
              SizedBox(height: 15,),
              Text('Développement mobile'),
              SizedBox(height: 15,),
              Wrap(
                spacing: 8,
                runSpacing: 8,
                children: [
                  Chip(label: Text('Flutter')),
                  Chip(label: Text('Dart')),
                  Chip(label: Text('Mobile')),
                ],
              ),
              SizedBox(height: 15,),
              Align(
                alignment: Alignment.bottomRight,
                child: Text('25 000 F'),
              )
            ],
          ),))
        ],
      ),)
    );
  }
}

import 'package:flutter/material.dart';

void main() {
  runApp(
    const MaterialApp(
      home: Scaffold(
        body: Center(child: CarteProfil()),
      ),
    ),
  );
}

class CarteProfil extends StatelessWidget {
  const CarteProfil({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        // Sur petit écran (< 400px), on empile
        final bool petitEcran = constraints.maxWidth < 400;

        return Container(
          width: petitEcran ? constraints.maxWidth : 300,
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
            boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 10)],
          ),
          child: petitEcran
              ? _buildColonne()
              : _buildLigne(),
        );
      },
    );
  }

  Widget _buildColonne() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const CircleAvatar(radius: 40, child: Icon(Icons.person)),
        const SizedBox(height: 10),
        const Text('Alice', style: TextStyle(fontSize: 20)),
      ],
    );
  }

  Widget _buildLigne() {
    return Row(
      children: [
        const CircleAvatar(radius: 30, child: Icon(Icons.person)),
        const SizedBox(width: 15),
        const Text('Alice', style: TextStyle(fontSize: 20)),
      ],
    );
  }
}
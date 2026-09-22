import 'package:flutter/material.dart';

void main() {
  runApp(
    const MaterialApp(
      home: Scaffold(
        body: Center(child: AvatarAvecBadge()),
      ),
    ),
  );
}

class AvatarAvecBadge extends StatelessWidget {
  const AvatarAvecBadge({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // 1. L'avatar (calque du bas)
        const CircleAvatar(
          radius: 50,
          backgroundColor: Colors.blue,
          child: Icon(Icons.person, size: 50, color: Colors.white),
        ),

        // 2. Le badge "en ligne" en bas à droite
        Positioned(
          bottom: 0,
          right: 0,
          child: Container(
            width: 25,
            height: 25,
            decoration: BoxDecoration(
              color: Colors.green,
              shape: BoxShape.circle,        // Rond
              border: Border.all(color: Colors.white, width: 3),  // Contour blanc
            ),
          ),
        ),
      ],
    );
  }
}
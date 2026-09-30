import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SafeArea(
          child: Center(
            child: Padding(
              padding: EdgeInsets.all(24),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                    Padding(padding: EdgeInsets.all(15),
                    child: Row(
                        children: [
                            Icon(Icons.arrow_back),
                            Spacer(),
                            Icon(Icons.more_vert),
                        ],
                    ),
                    ),
                    
                  CircleAvatar(radius: 50, child: Icon(Icons.person)),
                  Text(
                    'Alice Dupont',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Développeuse Flutter',
                    style: TextStyle(fontSize: 16, color: Colors.grey),
                  ),
                  SizedBox(height: 24),
                  Row(
                    children: [
                      Expanded(child: _buildStat('128', 'Posts')),
                      Expanded(child: _buildStat('2.4k', 'Follow')),
                      Expanded(child: _buildStat('512', 'Likes')),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {},
                          child: Text('Suivre'),
                        ),
                      ),
                    ],
                  ),
                  Flexible(
                    child: Text(
                      'Passionnée par Flutter et le développement mobile. '
                      'J\'aime créer des interfaces élégantes et performantes.',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 14, color: Colors.grey),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    ),
  );
}

Widget _buildStat(String value, String label) {
  return Column(
    children: [
      Text(value, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
      Text(label, style: TextStyle(color: Colors.grey)),
    ],
  );
}

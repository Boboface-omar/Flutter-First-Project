
import 'package:flutter/material.dart';

void main() {
  runApp(
    const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SafeArea(
          child: Center(
            child: Padding(
              padding: EdgeInsets.all(16),
              child: ResponsiveProductCard(),
            ),
          ),
        ),
      ),
    ),
  );
}

class ResponsiveProductCard extends StatelessWidget {
  const ResponsiveProductCard({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isMobile = constraints.maxWidth < 600;

        final image = AspectRatio(
          aspectRatio: 16 / 9,
          child: Container(
            color: Colors.grey.shade300,
            child: const Center(
              child: Icon(Icons.image, size: 48),
            ),
          ),
        );

        final details = Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                'Produit Flutter',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              const Text('Développement mobile'),
              const SizedBox(height: 12),
              const Wrap(
                spacing: 8,
                runSpacing: 8,
                children: [
                  Chip(label: Text('Flutter')),
                  Chip(label: Text('Dart')),
                  Chip(label: Text('Mobile')),
                ],
              ),
              const SizedBox(height: 12),
              const Align(
                alignment: Alignment.centerRight,
                child: Text('25 000 F'),
              ),
            ],
          ),
        );

        return Card(
          clipBehavior: Clip.antiAlias,
          child: isMobile
              ? Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    image,
                    details,
                  ],
                )
              : Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      flex: 1,
                      child: image,
                    ),
                    Expanded(
                      flex: 1,
                      child: details,
                    ),
                  ],
                ),
        );
      },
    );
  }
}

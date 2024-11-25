// components/result_card.dart
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'EcoScan',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: const ScanResultScreen(),
    );
  }
}

class ResultCard extends StatelessWidget {
  final String title;
  final Widget content;

  const ResultCard({
    super.key,
    required this.title,
    required this.content,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 12),
          content,
        ],
      ),
    );
  }
}

// components/recycling_method_item.dart
class RecyclingMethodItem extends StatelessWidget {
  final IconData icon;
  final Color color;

  const RecyclingMethodItem({
    super.key,
    required this.icon,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 80,
      height: 80,
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Icon(
        icon,
        size: 40,
        color: color,
      ),
    );
  }
}

class ScanResultScreen extends StatelessWidget {
  const ScanResultScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: Row(
          children: [
            Image.asset(
              'assets/logo.png',
              height: 24,
            ),
            const SizedBox(width: 8),
            const Text('EcoScan'),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () {},
            child: const Text('Home'),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Scan Results Card
            ResultCard(
              title: 'Scan Results',
              content: Row(
                children: [
                  Image.asset(
                    'assets/waste_bin.png',
                    height: 80,
                  ),
                  const SizedBox(width: 16),
                  const Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Type: Organic Waste',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(height: 4),
                        Text(
                          'Impact: Low Environmental Impact',
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            // Recycling Methods Card
            const ResultCard(
              title: 'Recycling Methods',
              content: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  RecyclingMethodItem(
                    icon: Icons.compost,
                    color: Colors.green,
                  ),
                  RecyclingMethodItem(
                    icon: Icons.delete_outline,
                    color: Colors.blue,
                  ),
                  RecyclingMethodItem(
                    icon: Icons.recycling,
                    color: Colors.teal,
                  ),
                ],
              ),
            ),

            // Environmental Impact Card
            const ResultCard(
              title: 'Environmental Impact',
              content: Text(
                'This organic waste can be composted, which enriches soil and reduces landfill waste, contributing to a healthier environment.',
                style: TextStyle(
                  fontSize: 14,
                  height: 1.5,
                ),
              ),
            ),

            // Bottom Buttons
            Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black,
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: const Text('Scan More'),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: OutlinedButton(
                      onPressed: () {},
                      style: OutlinedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: const Text('Back to Home'),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

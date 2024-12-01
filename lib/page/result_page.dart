import 'package:ecoscan/main.dart';
import 'package:ecoscan/page/camera_page.dart';
import 'package:flutter/material.dart';

// Komponen untuk kartu hasil
class ResultCard extends StatelessWidget {
  final String title;
  final Widget content;

  const ResultCard({
    Key? key,
    required this.title,
    required this.content,
  }) : super(key: key);

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
              fontSize: 24,
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

// Komponen untuk metode daur ulang
class RecyclingMethodItem extends StatelessWidget {
  final IconData icon;
  final Color color;
  // final double iconSize;

  const RecyclingMethodItem({
    Key? key,
    required this.icon,
    required this.color,
    // this.iconSize = 60.0,
  }) : super(key: key);

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

// Halaman hasil pemindaian
class ResultPage extends StatelessWidget {
  final dynamic result;
  const ResultPage({
    Key? key,
    required this.result,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.black,
        title: const Row(
          children: [
            Icon(
              Icons.eco,
              size: 35,
              color: Color.fromARGB(255, 31, 240, 170),
            ),
            SizedBox(width: 8),
            Text(
              'EcoScan',
              style: TextStyle(
                color: Colors.white, // Mengubah warna teks menjadi putih
              ),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Kartu Hasil Pemindaian
            ResultCard(
              title: 'Scan Results',
              content: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset(
                    'assets/trash.png',
                    height: 100,
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Type: ${result['type']}',
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                        SizedBox(height: 4),
                        Text(
                          'Impact: Low Environmental Impact',
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight
                                .w500, // Mengatur ketebalan menjadi normal
                            color: Colors
                                .grey, // Mengubah warna teks menjadi abu-abu
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            // Kartu Metode Daur Ulang
            // const ResultCard(
            //   title: 'Recycling Methods',
            //   content: SingleChildScrollView(
            //     scrollDirection: Axis.horizontal,
            //     child: Row(
            //       mainAxisAlignment: MainAxisAlignment.start,
            //       children: [
            //         RecyclingMethodItem(
            //           icon: Icons.compost,
            //           color: Colors.green,
            //         ),
            //         SizedBox(width: 16),
            //         RecyclingMethodItem(
            //           icon: Icons.delete_outline,
            //           color: Colors.blue,
            //         ),
            //         SizedBox(width: 16),
            //         RecyclingMethodItem(
            //           icon: Icons.recycling,
            //           color: Colors.teal,
            //         ),
            //       ],
            //     ),
            //   ),
            // ),

            const ResultCard(
              title: 'Recycling Methods',
              content: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RecyclingMethodItem(
                    icon: Icons.compost,
                    color: Colors.green,
                  ),
                  SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using ',
                          style: TextStyle(
                            fontSize: 14,
                            height: 1.5,
                          ),
                          textAlign:
                              TextAlign.justify, // Justify text alignment
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            // Kartu Dampak Lingkungan
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

            // Tombol Bawah
            Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        // Navigasi ke halaman hasil setelah preview
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const CameraPage(),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black,
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: const Text(
                        'Scan More',
                        style: TextStyle(
                          color: Color.fromARGB(255, 31, 240, 170),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: OutlinedButton(
                      onPressed: () {
                        // Navigasi ke halaman hasil setelah preview
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const HomePage(),
                          ),
                        );
                      },
                      style: OutlinedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: const Text(
                        'Back to Home',
                        style: TextStyle(
                          color: Color.fromARGB(
                              255, 0, 0, 0), // Mengubah warna teks menjadi biru
                        ),
                      ),
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

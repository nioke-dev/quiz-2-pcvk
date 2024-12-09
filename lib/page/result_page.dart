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
                          'Type: ${getTranslatedType(result['predicted_class'])}',
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                        SizedBox(height: 4),
                        Text(
                          'Impact: ${getImpact(result['predicted_class'])}',
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

            ResultCard(
              title: 'Recycling Methods',
              content: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RecyclingMethodItem(
                    icon: Icons.recycling,
                    color: Colors.green,
                  ),
                  SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(width: 10),
                        Text(
                          getRecyclingMethod(result['predicted_class']),
                          style: TextStyle(
                            fontSize: 14,
                            height: 1.5,
                          ),
                          textAlign: TextAlign.justify,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            // Kartu Dampak Lingkungan
            ResultCard(
              title: 'Environmental Impact',
              content: Text(
                getEnvironmentalImpact(result['predicted_class']),
                style: TextStyle(
                  fontSize: 14,
                  height: 1.5,
                ),
                textAlign: TextAlign.justify,
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

  String getTranslatedType(String predictedClass) {
    switch (predictedClass) {
      case 'Organic':
        return 'Organic';
      case 'botol plastik':
        return 'Plastic Bottle';
      case 'kaca':
        return 'Glass';
      case 'kardus':
        return 'Cardboard';
      case 'kertas':
        return 'Paper';
      case 'metal':
        return 'Metal';
      case 'plastic':
        return 'Plastic';
      default:
        return 'Unknown';
    }
  }

  String getImpact(String predictedClass) {
    switch (predictedClass.toLowerCase()) {
      case 'organic':
        return 'Low Environmental Impact';
      case 'botol plastik':
      case 'plastic':
        return 'High Environmental Impact';
      case 'kaca':
      case 'kardus':
      case 'kertas':
        return 'Mid Environmental Impact';
      case 'metal':
        return 'Low Environmental Impact';
      default:
        return 'Unknown Impact';
    }
  }

  String getRecyclingMethod(String predictedClass) {
    switch (predictedClass.toLowerCase()) {
      case 'organic':
        return 'Organic waste, such as food scraps and paper, can be composted through microbial decomposition. This process transforms organic matter into nutrient-rich compost, which can be used as a natural fertilizer for agriculture or gardening.';
      case 'botol plastik':
        return 'Plastic bottles, typically made of PET, are collected, cleaned, shredded, and melted to produce plastic pellets. These pellets can be reused to manufacture new bottles, textiles, or other plastic products, reducing the need for virgin plastic production.';
      case 'kaca':
        return 'Glass is sorted by color, cleaned, and melted down to be remolded into new glass products or used in construction. This process helps conserve raw materials and reduces energy consumption compared to producing new glass.';
      case 'kardus':
        return 'Cardboard is shredded, mixed with water to create pulp, and processed into new cardboard or paper products. This recycling method reduces waste and conserves resources like wood and water.';
      case 'kertas':
        return 'Recycling paper involves breaking it down into pulp, removing ink, and forming it into new paper sheets. The recycled paper can be used for printing, packaging, or making tissue products, reducing deforestation and water usage.';
      case 'metal':
        return 'Metals like aluminum and steel are collected, melted, and reshaped into new products. Since metals can be recycled indefinitely without losing quality, this process saves energy and reduces the need for mining new ores.';
      case 'plastic':
        return 'Other types of plastic (HDPE, LDPE, PP) are sorted by resin type, cleaned, shredded, and melted into reusable material. The recycled plastic is then used to create new products such as containers, toys, or construction materials, though not all plastic types can be efficiently recycled.';
      default:
        return 'No recycling information available for this material.';
    }
  }

  String getEnvironmentalImpact(String predictedClass) {
    switch (predictedClass.toLowerCase()) {
      case 'organic':
        return 'Organic waste can be composted, enriching the soil, reducing landfill waste, and decreasing greenhouse gas emissions, contributing to a healthier environment.';
      case 'botol plastik':
        return 'Plastic bottles have a high environmental impact due to their long decomposition time and contribution to ocean pollution. Recycling them reduces waste and conserves resources but requires significant energy.';
      case 'kaca':
        return 'Glass has a moderate environmental impact. Recycling it reduces the need for raw materials and energy, as it can be reused indefinitely without loss of quality.';
      case 'kardus':
        return 'Cardboard recycling reduces deforestation and waste. It conserves resources like wood and water, minimizing environmental degradation and energy usage in paper production.';
      case 'kertas':
        return 'Paper recycling lowers deforestation and water usage while reducing waste in landfills. However, the process consumes energy and water, making it a moderate-impact material.';
      case 'metal':
        return 'Metals like aluminum and steel have a low environmental impact when recycled. Recycling saves energy, reduces the need for mining, and prevents resource depletion, as metals can be recycled indefinitely.';
      case 'plastic':
        return 'Other types of plastic have a high environmental impact due to limited recycling capabilities and potential harm to ecosystems. Recycling reduces landfill waste but is often energy-intensive.';
      default:
        return 'No environmental impact information available for this material.';
    }
  }
}

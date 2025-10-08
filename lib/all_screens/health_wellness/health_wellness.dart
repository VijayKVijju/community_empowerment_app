import 'package:flutter/material.dart';

class HealthWellnessPage extends StatefulWidget {
  const HealthWellnessPage({Key? key}) : super(key: key);

  @override
  State<HealthWellnessPage> createState() => _HealthWellnessPageState();
}

class _HealthWellnessPageState extends State<HealthWellnessPage> {
  String selectedCategory = "General";
  String? selectedArticle;

  final List<String> categories = ["General", "Men", "Women", "Child"];

  final Map<String, List<String>> articles = {
    "General": [
      "Importance of Regular Exercise",
      "Balanced Diet for Healthy Life"
    ],
    "Men": [
      "Prostate Health Awareness",
      "Stress Management for Working Men"
    ],
    "Women": [
      "Maternal Health & Nutrition",
      "Breast Cancer Awareness"
    ],
    "Child": [
      "Vaccination Timeline (Birth to 4 years)",
    ],
  };

  final List<Map<String, String>> vaccinationTimeline = [
    {
      "age": "Birth",
      "vaccine": "BCG, OPV-0, Hep-B1",
      "purpose": "Protection against TB, Polio, Hepatitis-B",
      "lastDate": "Within 15 days"
    },
    {
      "age": "6 Weeks",
      "vaccine": "DPT1, IPV1, Hib1, Hep-B2, Rotavirus1, PCV1",
      "purpose": "Prevention from Diphtheria, Polio, Hepatitis B",
      "lastDate": "8 Weeks"
    },
    {
      "age": "10 Weeks",
      "vaccine": "DPT2, IPV2, Hib2, Rotavirus2, PCV2",
      "purpose": "Boost protection started at 6 weeks",
      "lastDate": "12 Weeks"
    },
    {
      "age": "14 Weeks",
      "vaccine": "DPT3, IPV3, Hib3, Hep-B3, Rotavirus3, PCV3",
      "purpose": "Complete primary vaccination",
      "lastDate": "16 Weeks"
    },
    {
      "age": "9-12 Months",
      "vaccine": "Measles1 / MR1, Yellow Fever, JE1",
      "purpose": "Protection from Measles, Rubella, JE",
      "lastDate": "12 Months"
    },
    {
      "age": "15-18 Months",
      "vaccine": "DPT booster1, Hib booster, MR2, Varicella1, Hep-A1",
      "purpose": "Long-term immunity & booster doses",
      "lastDate": "18 Months"
    },
    {
      "age": "4-6 Years",
      "vaccine": "DPT booster2, OPV booster, Varicella2, Typhoid booster",
      "purpose": "Extended protection till early childhood",
      "lastDate": "6 Years"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Health & Wellness"),
        backgroundColor: Colors.deepPurple,
        leading: BackButton(onPressed: () => Navigator.pop(context)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            DropdownButton<String>(
              value: selectedCategory,
              isExpanded: true,
              onChanged: (val) {
                setState(() {
                  selectedCategory = val!;
                  selectedArticle = null;
                });
              },
              items: categories
                  .map((c) => DropdownMenuItem(value: c, child: Text(c)))
                  .toList(),
            ),
            const SizedBox(height: 10),
            Text(
              "Note: These are not final, always contact your family doctor or advisor.",
              style: TextStyle(color: Colors.red.shade700, fontSize: 12),
            ),
            const SizedBox(height: 15),

            /// Articles Section
            if (selectedArticle == null)
              Expanded(
                child: ListView.builder(
                  itemCount: articles[selectedCategory]!.length,
                  itemBuilder: (context, index) => Card(
                    child: ListTile(
                      title: Text(articles[selectedCategory]![index]),
                      trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                      onTap: () {
                        setState(() {
                          selectedArticle =
                          articles[selectedCategory]![index];
                        });
                      },
                    ),
                  ),
                ),
              ),

            /// Article Details Section
            if (selectedArticle != null)
              Expanded(
                child: selectedCategory == "Child"
                    ? _buildAnimatedVaccinationRoadmap()
                    : _buildDetails(selectedArticle!),
              ),
          ],
        ),
      ),
    );
  }

  /// Simple details for Men & Women articles
  Widget _buildDetails(String article) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Text(
          "$article\n\nThis is detailed information related to $article. "
              "Please consult your doctor for proper advice.",
          style: const TextStyle(fontSize: 16),
        ),
      ),
    );
  }

  /// Animated Roadmap for Vaccination
  Widget _buildAnimatedVaccinationRoadmap() {
    return Stack(
      children: [
        /// Curved Road Background
        Positioned.fill(
          child: CustomPaint(
            painter: RoadPainter(),
          ),
        ),

        /// Milestones
        ListView.builder(
          itemCount: vaccinationTimeline.length,
          itemBuilder: (context, index) {
            final item = vaccinationTimeline[index];
            return TweenAnimationBuilder(
              duration: Duration(milliseconds: 800 + index * 200),
              tween: Tween<double>(begin: 0, end: 1),
              curve: Curves.easeInOut,
              builder: (context, double value, child) {
                return Opacity(
                  opacity: value,
                  child: Transform.translate(
                    offset: Offset(0, (1 - value) * 40),
                    child: Card(
                      margin: EdgeInsets.symmetric(vertical: 20, horizontal: 60),
                      elevation: 6,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      child: Padding(
                        padding: const EdgeInsets.all(12),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("${item['age']} → ${item['vaccine']}",
                                style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.deepPurple)),
                            const SizedBox(height: 6),
                            Text("Purpose: ${item['purpose']}"),
                            Text("Last Date: ${item['lastDate']}"),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
            );
          },
        ),
      ],
    );
  }
}

/// Draws curved roadmap background
class RoadPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.grey.shade300
      ..style = PaintingStyle.stroke
      ..strokeWidth = 10;

    final path = Path();
    path.moveTo(0, size.height * 0.1);
    path.quadraticBezierTo(
        size.width * 0.5, size.height * 0.3, size.width, size.height * 0.2);
    path.quadraticBezierTo(
        size.width * 0.5, size.height * 0.6, 0, size.height * 0.8);
    path.quadraticBezierTo(
        size.width * 0.5, size.height * 1.0, size.width, size.height * 0.95);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}

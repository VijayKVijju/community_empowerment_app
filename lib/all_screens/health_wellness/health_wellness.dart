import 'package:flutter/material.dart';

class HealthWellnessPage extends StatefulWidget {
  const HealthWellnessPage({Key? key}) : super(key: key);

  @override
  State<HealthWellnessPage> createState() => _HealthWellnessPageState();
}

class _HealthWellnessPageState extends State<HealthWellnessPage> {
  String selectedCategory = "General";

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
      "Vaccination Importance",
      "Healthy Eating Habits for Kids"
    ],
  };

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
                setState(() => selectedCategory = val!);
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
            Expanded(
              child: ListView.builder(
                itemCount: articles[selectedCategory]!.length,
                itemBuilder: (context, index) => Card(
                  child: ListTile(
                    title: Text(articles[selectedCategory]![index]),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

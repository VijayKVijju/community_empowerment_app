import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart'; // 📤 For share button

class ScholarshipApplyPage extends StatelessWidget {
  final String scholarshipName;
  final String eligibility;
  final String startDate;
  final String endDate;
  final List<String> documents;
  final String howToApply;

  const ScholarshipApplyPage({
    Key? key,
    required this.scholarshipName,
    required this.eligibility,
    required this.startDate,
    required this.endDate,
    required this.documents,
    required this.howToApply,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      // ✅ AppBar
      appBar: AppBar(
        backgroundColor: const Color(0xFF5F259F), // PhonePe Purple
        automaticallyImplyLeading: true,
        title: Text(
          scholarshipName,
          style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.share, color: Colors.white),
            onPressed: () {
              Share.share(
                  "📢 Scholarship: $scholarshipName\n\n"
                      "🎯 Eligibility: $eligibility\n"
                      "📅 Start Date: $startDate\n"
                      "⏳ End Date: $endDate\n\n"
                      "📑 How to Apply: $howToApply");
            },
          ),
        ],
      ),

      // ✅ Details in scrollable body
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              sectionTitle("📖 Detail about the Scheme"),
              const SizedBox(height: 10),

              infoRow(Icons.school, "Scholarship Name", scholarshipName),
              infoRow(Icons.verified_user, "Eligibility Criteria", eligibility),
              infoRow(Icons.calendar_today, "Starting Date", startDate),
              infoRow(Icons.event, "Ending Date", endDate),

              const SizedBox(height: 20),
              sectionTitle("📑 Documents Required"),
              ...documents.map((doc) => ListTile(
                leading: const Icon(Icons.file_present, color: Color(0xFF5F259F)),
                title: Text(doc),
              )),

              const SizedBox(height: 20),
              sectionTitle("📝 How to Apply"),
              Text(
                howToApply,
                style: const TextStyle(fontSize: 15, color: Colors.black87),
              ),
              const SizedBox(height: 100), // space for bottom button
            ],
          ),
        ),
      ),

      // ✅ Fixed "Apply Now" button at bottom
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ElevatedButton.icon(
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFF5F259F),
            padding: const EdgeInsets.symmetric(vertical: 16),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          icon: const Icon(Icons.check_circle, color: Colors.white),
          label: const Text(
            "Apply Now",
            style: TextStyle(fontSize: 16, color: Colors.white, fontWeight: FontWeight.bold),
          ),
          onPressed: () {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text("✅ Applied for $scholarshipName")),
            );
          },
        ),
      ),
    );
  }

  // 🔹 Section Title Widget
  Widget sectionTitle(String text) {
    return Text(
      text,
      style: const TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.bold,
        color: Color(0xFF5F259F),
      ),
    );
  }

  // 🔹 Info Row Widget with Icon
  Widget infoRow(IconData icon, String title, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: const Color(0xFF5F259F), size: 20),
          const SizedBox(width: 8),
          Text("$title: ",
              style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 15)),
          Expanded(
            child: Text(
              value,
              style: const TextStyle(fontSize: 15, color: Colors.black87),
            ),
          ),
        ],
      ),
    );
  }
}

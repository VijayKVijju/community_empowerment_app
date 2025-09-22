import 'package:flutter/material.dart';
import 'localization.dart';

class SchemeDetailsPage extends StatelessWidget {
  final Map<String, dynamic> scheme;
  final String selectedLanguage;

  const SchemeDetailsPage({
    Key? key,
    required this.scheme,
    required this.selectedLanguage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Map<String, String> translations =
    localizedStrings[selectedLanguage]!;
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        title: Text(translations['detailsTitle']!),
        backgroundColor: Colors.deepPurple,
        actions: [
          IconButton(
            icon: const Icon(Icons.share),
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                    content: Text(
                        '${translations['share']!} ${scheme['name']!}')),
              );
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildDetailCard(
                context,
                title: translations['schemeName']!,
                content: scheme['name']!,
              ),
              _buildDetailCard(
                context,
                title: translations['sectorLabel']!,
                content: scheme['sector']!,
              ),
              _buildDetailCard(
                context,
                title: translations['startDate']!,
                content: scheme['started']!,
              ),
              _buildDetailCard(
                context,
                title: translations['benefits']!,
                content: scheme['benefits']!,
              ),
              _buildDetailCard(
                context,
                title: translations['eligibility']!,
                content: scheme['eligible']!,
              ),
              const SizedBox(height: 24),
              Center(
                child: ElevatedButton.icon(
                  onPressed: () {
                    // This can be a link to a website or an internal page
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                          content: Text(
                              '${translations['moreDetails']!} for ${scheme['name']!}...')),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.deepPurple.shade700,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 24, vertical: 12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  icon: const Icon(Icons.open_in_new, size: 20),
                  label: Text(translations['moreDetails']!),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDetailCard(BuildContext context,
      {required String title, required String content}) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.deepPurple.shade50.withOpacity(0.5),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.deepPurple,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            content,
            style: const TextStyle(fontSize: 14, color: Colors.black87),
          ),
        ],
      ),
    );
  }
}

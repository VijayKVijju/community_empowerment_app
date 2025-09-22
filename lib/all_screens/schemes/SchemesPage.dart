import 'package:flutter/material.dart';
import 'scheme_details_page.dart';
import 'localization.dart';

// Dummy data for schemes
final List<Map<String, dynamic>> allSchemes = [
  {
    'name': 'PM-KISAN',
    'sector': 'Agriculture',
    'type': 'Central Govt',
    'year': '2024',
    'started': '24 Feb 2019',
    'benefits':
    'Financial support of ₹6,000 per year to all landholding farmer families.',
    'eligible': 'Small and marginal farmers.',
    'language': 'English'
  },
  {
    'name': 'ಕೃಷಿ ಭಾಗ್ಯ ಯೋಜನೆ',
    'sector': 'Agriculture',
    'type': 'State Govt',
    'year': '2023',
    'started': '14 July 2014',
    'benefits': 'ಬರ ಪೀಡಿತ ಪ್ರದೇಶಗಳ ರೈತರಿಗೆ ಮಳೆಯ ನೀರು ಸಂಗ್ರಹಣೆಗೆ ಸಹಾಯ.',
    'eligible': 'ಕರ್ನಾಟಕದ ರೈತರು.',
    'language': 'Kannada'
  },
  {
    'name': 'Startup India Seed Fund Scheme',
    'sector': 'Startups',
    'type': 'Central Govt',
    'year': '2024',
    'started': '21 Jan 2021',
    'benefits':
    'Financial assistance to startups for proof of concept, prototype development, product trials, etc.',
    'eligible': 'Startups recognized by DPIIT.',
    'language': 'English'
  },
  {
    'name': 'ಉದ್ಯೋಗಿನಿ ಯೋಜನೆ',
    'sector': 'Business',
    'type': 'Women\'s Schemes',
    'year': '2024',
    'started': '2020',
    'benefits': 'ಮಹಿಳಾ ಉದ್ಯಮಿಗಳಿಗೆ ವ್ಯಾಪಾರ ಆರಂಭಿಸಲು ಸಾಲ ಸೌಲಭ್ಯ.',
    'eligible': '18 ರಿಂದ 45 ವಯಸ್ಸಿನ ಮಹಿಳೆಯರು.',
    'language': 'Kannada'
  },
  {
    'name': 'Upcoming Entrepreneur Scheme',
    'sector': 'Business',
    'type': 'Central Govt',
    'year': 'Upcoming Schemes',
    'started': 'TBD',
    'benefits':
    'Future financial incentives for new business ventures. More details will be announced soon.',
    'eligible': 'Entrepreneurs with a viable business plan.',
    'language': 'English'
  },
  {
    'name': 'ಗ್ರಾಮ ಒನ್',
    'sector': 'Business',
    'type': 'State Govt',
    'year': '2023',
    'started': '30 Dec 2021',
    'benefits':
    'ಗ್ರಾಮೀಣ ಪ್ರದೇಶಗಳಲ್ಲಿ ನಾಗರಿಕ ಸೇವೆಗಳನ್ನು ಒದಗಿಸಲು ಕೇಂದ್ರಗಳನ್ನು ಸ್ಥಾಪಿಸುವುದು.',
    'eligible': 'ಗ್ರಾಮೀಣ ಉದ್ಯಮಿಗಳು.',
    'language': 'Kannada'
  },
];

class SchemesPage extends StatefulWidget {
  final String selectedLanguage;

  const SchemesPage({Key? key, required this.selectedLanguage})
      : super(key: key);

  @override
  State<SchemesPage> createState() => _SchemesPageState();
}

class _SchemesPageState extends State<SchemesPage> {
  String? selectedType;
  String? selectedSector;
  String? selectedYear;

  List<String> schemeTypes = [
    'Central Govt',
    'State Govt',
    'Private Schems',
  ];
  List<String> sectors = [
    'Agriculture',
    'Business',
    'Startups',
    'Women\'s Schemes'
  ];
  List<String> years = ['2023', '2024', '2025', 'Upcoming Schemes'];

  List<Map<String, dynamic>> get filteredSchemes {
    return allSchemes.where((scheme) {
      final matchesLanguage = scheme['language'] == widget.selectedLanguage;
      final matchesType =
          selectedType == null || scheme['type'] == selectedType;
      final matchesSector =
          selectedSector == null || scheme['sector'] == selectedSector;
      final matchesYear =
          selectedYear == null || scheme['year'] == selectedYear;
      return matchesLanguage && matchesType && matchesSector && matchesYear;
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    final Map<String, String> translations =
    localizedStrings[widget.selectedLanguage]!;

    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        title: Text(translations['schemesTitle']!),
        backgroundColor: Colors.deepPurple,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              _buildDropdown(
                label: translations['schemeType']!,
                value: selectedType,
                items: schemeTypes,
                onChanged: (value) {
                  setState(() {
                    selectedType = value;
                  });
                },
              ),
              const SizedBox(height: 16),
              _buildDropdown(
                label: translations['sector']!,
                value: selectedSector,
                items: sectors,
                onChanged: (value) {
                  setState(() {
                    selectedSector = value;
                  });
                },
              ),
              const SizedBox(height: 16),
              _buildDropdown(
                label: translations['year']!,
                value: selectedYear,
                items: years,
                onChanged: (value) {
                  setState(() {
                    selectedYear = value;
                  });
                },
              ),
              const SizedBox(height: 24),
              ...filteredSchemes.map((scheme) {
                return SchemeCard(
                  scheme: scheme,
                  selectedLanguage: widget.selectedLanguage,
                );
              }).toList(),
              if (filteredSchemes.isEmpty)
                Center(
                  child: Text(
                    translations['noSchemes']!,
                    style: const TextStyle(
                        fontSize: 16, color: Colors.grey, height: 2),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDropdown({
    required String label,
    required String? value,
    required List<String> items,
    required Function(String?) onChanged,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
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
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          isExpanded: true,
          value: value,
          hint: Text(
            label,
            style: const TextStyle(color: Colors.deepPurple),
          ),
          icon: const Icon(Icons.arrow_drop_down, color: Colors.deepPurple),
          items: [
            DropdownMenuItem<String>(
              value: null,
              child: Text('All $label'),
            ),
            ...items.map((String item) {
              return DropdownMenuItem<String>(
                value: item,
                child: Text(item),
              );
            }),
          ],
          onChanged: onChanged,
        ),
      ),
    );
  }
}

class SchemeCard extends StatelessWidget {
  final Map<String, dynamic> scheme;
  final String selectedLanguage;

  const SchemeCard({
    Key? key,
    required this.scheme,
    required this.selectedLanguage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Map<String, String> translations =
    localizedStrings[selectedLanguage]!;

    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      elevation: 4,
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              scheme['name']!,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.deepPurple,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              '${translations['sectorLabel']!}: ${scheme['sector']!}',
              style: const TextStyle(fontSize: 14, color: Colors.grey),
            ),
            const SizedBox(height: 16),
            Align(
              alignment: Alignment.centerRight,
              child: ElevatedButton.icon(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SchemeDetailsPage(
                        scheme: scheme,
                        selectedLanguage: selectedLanguage,
                      ),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.deepPurple,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                icon: const Icon(Icons.search, size: 18),
                label: Text(translations['explore']!),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

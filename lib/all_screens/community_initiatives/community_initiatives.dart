import 'package:flutter/material.dart';

class CommunityInitiativesScreen extends StatefulWidget {
  final String selectedLanguage;
  final Function(String) setLanguage;

  const CommunityInitiativesScreen({
    super.key,
    required this.selectedLanguage,
    required this.setLanguage,
  });

  @override
  State<CommunityInitiativesScreen> createState() =>
      _CommunityInitiativesScreenState();
}

class _CommunityInitiativesScreenState
    extends State<CommunityInitiativesScreen> {
  String searchQuery = "";
  String selectedYear = "2025";
  String selectedMonth = "January";
  int currentPage = 1;

  final List<String> years = ["2023", "2024", "2025"];
  final List<String> months = [
    "January",
    "February",
    "March",
    "April",
    "May",
    "June",
    "July",
    "August",
    "September",
    "October",
    "November",
    "December"
  ];

  // Sample initiatives (English + Kannada)
  final Map<String, List<Map<String, String>>> initiativesByMonth = {
    "January": [
      {
        "title_en": "Blood Donation Camp",
        "title_kn": "ರಕ್ತದಾನ ಶಿಬಿರ",
        "place_en": "Bangalore City Hall",
        "place_kn": "ಬೆಂಗಳೂರು ನಗರ ಸಭಾಂಗಣ",
        "uses_en": "Save lives through blood donation",
        "uses_kn": "ರಕ್ತದಾನದ ಮೂಲಕ ಜೀವಗಳನ್ನು ಉಳಿಸಿ",
        "date": "2025-01-20",
      }
    ],
    "February": [
      {
        "title_en": "Eye Checkup Camp",
        "title_kn": "ಕಣ್ಣು ತಪಾಸಣೆ ಶಿಬಿರ",
        "place_en": "Mysore Clinic",
        "place_kn": "ಮೈಸೂರು ಕ್ಲಿನಿಕ್",
        "uses_en": "Free eye checkup for citizens",
        "uses_kn": "ನಾಗರಿಕರಿಗೆ ಉಚಿತ ಕಣ್ಣು ತಪಾಸಣೆ",
        "date": "2025-02-15",
      }
    ],
    "March": [
      {
        "title_en": "Dental Health Camp",
        "title_kn": "ಹಲ್ಲು ಆರೋಗ್ಯ ಶಿಬಿರ",
        "place_en": "Hubli Hospital",
        "place_kn": "ಹುಬ್ಬಳ್ಳಿ ಆಸ್ಪತ್ರೆ",
        "uses_en": "Free dental consultation",
        "uses_kn": "ಉಚಿತ ಹಲ್ಲು ಸಲಹೆ",
        "date": "2025-03-10",
      }
    ],
    // Add for other months similarly...
  };

  @override
  Widget build(BuildContext context) {
    // Pick correct language
    bool isKannada = widget.selectedLanguage == "Kannada";

    // Filter initiatives based on year, month and search
    List<Map<String, String>> monthData =
        initiativesByMonth[selectedMonth] ?? [];
    List<Map<String, String>> filtered = monthData
        .where((item) =>
        (isKannada
            ? item["title_kn"]!
            : item["title_en"]!)
            .toLowerCase()
            .contains(searchQuery.toLowerCase()))
        .toList();

    // Pagination
    int itemsPerPage = 10;
    int totalPages = (filtered.length / itemsPerPage).ceil();
    if (totalPages == 0) totalPages = 1;
    int startIndex = (currentPage - 1) * itemsPerPage;
    int endIndex = (startIndex + itemsPerPage).clamp(0, filtered.length);
    final currentItems = filtered.sublist(startIndex, endIndex);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Community Initiatives"),
        backgroundColor: Colors.deepPurple,
        leading: BackButton(onPressed: () => Navigator.pop(context)),
        actions: [
          IconButton(
            icon: const Icon(Icons.language),
            onPressed: () => _showLanguageSelector(context),
          ),
        ],
      ),
      body: Column(
        children: [
          // Search
          Padding(
            padding: const EdgeInsets.all(8),
            child: TextField(
              decoration: InputDecoration(
                hintText: isKannada
                    ? "ಪ್ರವರ್ತನೆಗಳನ್ನು ಹುಡುಕಿ..."
                    : "Search initiatives...",
                prefixIcon: const Icon(Icons.search),
                border: const OutlineInputBorder(),
              ),
              onChanged: (val) => setState(() => searchQuery = val),
            ),
          ),

          // Year & Month filter + Search button
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            child: Row(
              children: [
                Expanded(
                  child: DropdownButton<String>(
                    isExpanded: true,
                    value: selectedYear,
                    items: years
                        .map((y) =>
                        DropdownMenuItem(value: y, child: Text(y)))
                        .toList(),
                    onChanged: (val) =>
                        setState(() => selectedYear = val!),
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: DropdownButton<String>(
                    isExpanded: true,
                    value: selectedMonth,
                    items: months
                        .map((m) =>
                        DropdownMenuItem(value: m, child: Text(m)))
                        .toList(),
                    onChanged: (val) =>
                        setState(() => selectedMonth = val!),
                  ),
                ),
                const SizedBox(width: 8),
                ElevatedButton(
                  onPressed: () => setState(() {
                    currentPage = 1; // reset page
                  }),
                  child: Text(isKannada ? "ಹುಡುಕಿ" : "Search"),
                ),
              ],
            ),
          ),

          // Initiative List
          Expanded(
            child: ListView.builder(
              itemCount: currentItems.length,
              itemBuilder: (context, index) {
                final item = currentItems[index];
                return Card(
                  margin: const EdgeInsets.all(8),
                  child: ListTile(
                    title: Text(
                        isKannada ? item['title_kn']! : item['title_en']!),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(isKannada
                            ? "ಸ್ಥಳ: ${item['place_kn']}"
                            : "Place: ${item['place_en']}"),
                        Text(isKannada
                            ? "ಬಳಕೆ: ${item['uses_kn']}"
                            : "Uses: ${item['uses_en']}"),
                        Text("Date: ${item['date']}"),
                      ],
                    ),
                    trailing: ElevatedButton(
                      onPressed: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                              content: Text(isKannada
                                  ? "ಜ್ಞಾಪನೆ ಹೊಂದಿಸಲಾಗಿದೆ ${item['title_kn']} (2 ದಿನಗಳ ಹಿಂದೆ)"
                                  : "Reminder set for ${item['title_en']} (2 days before)")),
                        );
                      },
                      child: Text(isKannada ? "ನನಗೆ ಜ್ಞಾಪನೆ ನೀಡಿ" : "Remind Me"),
                    ),
                  ),
                );
              },
            ),
          ),

          // Pagination
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: currentPage > 1
                    ? () => setState(() => currentPage--)
                    : null,
              ),
              ...List.generate(totalPages, (i) {
                final pageNum = i + 1;
                return TextButton(
                  onPressed: () =>
                      setState(() => currentPage = pageNum),
                  child: Text(
                    "$pageNum",
                    style: TextStyle(
                      fontWeight: currentPage == pageNum
                          ? FontWeight.bold
                          : FontWeight.normal,
                    ),
                  ),
                );
              }),
              IconButton(
                icon: const Icon(Icons.arrow_forward),
                onPressed: currentPage < totalPages
                    ? () => setState(() => currentPage++)
                    : null,
              ),
            ],
          ),
        ],
      ),
    );
  }

  void _showLanguageSelector(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) => Wrap(
        children: [
          ListTile(
            leading: const Icon(Icons.language),
            title: const Text("English"),
            onTap: () {
              widget.setLanguage("English");
              Navigator.pop(context);
              setState(() {});
            },
          ),
          ListTile(
            leading: const Icon(Icons.language),
            title: const Text("ಕನ್ನಡ (Kannada)"),
            onTap: () {
              widget.setLanguage("Kannada");
              Navigator.pop(context);
              setState(() {});
            },
          ),
        ],
      ),
    );
  }
}

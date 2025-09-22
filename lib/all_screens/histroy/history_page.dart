import 'package:flutter/material.dart';

class HistoryPage extends StatelessWidget {
  final String language;

  const HistoryPage({required this.language});

  @override
  Widget build(BuildContext context) {
    // 🔹 History content (split into sections)
    final Map<String, List<String>> englishHistory = {
      "Origins & Legacy": [
        "The Ediga (Eediga) community has a long history mentioned in ancient epics and Puranas such as the Mahabharata, Ramayana, Skandapurana, Shivapurana, and Matsyapurana.",
        "They are considered descendants of Gowda and are spread across Karnataka in about 26 denominations, with variations in language, culture, and traditions.",
      ],
      "Historical Roles": [
        "Edigas were engaged in liquor preparation and supply, and some served as 'Dandu Edigars' (supporting armies).",
        "They are mentioned during the reigns of Chandragupta, Adi Shankaracharya, Prataparudra, Basaveshwara, the Vijayanagara rulers, and Aurangzeb.",
      ],
      "Social Awakening": [
        "1927: Karnataka Andhra Eediga Conference was held.",
        "1944: Under K. N. Guruswamy’s leadership, a hostel was started for students in Bangalore.",
        "1958: Jayachamarajendra Wodeyar inaugurated a large community conference, uniting 26 Ediga sub-groups under the Mysore Region Arya Ediga Sangh.",
      ],
      "Prominent Leaders": [
        "Rao Saheba Kanekal Nettakallappa, K. Venkataswamy, E. Hanumanthaiah, Moola Rangappa, M. K. Narayanaswamy, K. Dhoomappa, and many others.",
        "Political representatives include Murari Kamalamma, Damodara Mulki, Somappa Suvarna, and more.",
      ],
      "Challenges & Progress": [
        "Despite being the 7th largest community in Karnataka by population, development has been uneven due to illiteracy, superstition, and lack of early unity.",
        "The community continues to work towards progress in education, politics, and social reforms.",
      ],
    };

    final Map<String, List<String>> kannadaHistory = {
      "ಮೂಲಗಳು ಮತ್ತು ಪರಂಪರೆ": [
        "ಎಡಿಗ (ಈಡಿಗ) ಸಮುದಾಯದ ಇತಿಹಾಸವನ್ನು ಮಹಾಭಾರತ, ರಾಮಾಯಣ, ಸ್ಕಂದಪುರಾಣ, ಶಿವಪುರಾಣ, ಮತ್ಸ್ಯಪುರಾಣ ಮೊದಲಾದ ಪ್ರಾಚೀನ ಪುರಾಣಗಳಲ್ಲಿ ಉಲ್ಲೇಖಿಸಲಾಗಿದೆ.",
        "ಇವರು ಗೌಡರ ವಂಶಜರೆಂದು ಪರಿಗಣಿಸಲ್ಪಟ್ಟಿದ್ದು, ಕರ್ನಾಟಕದಾದ್ಯಂತ 26 ಪ್ರಭೇದಗಳಲ್ಲಿ ಹರಡಿಕೊಂಡಿದ್ದಾರೆ.",
      ],
      "ಇತಿಹಾಸಿಕ ಪಾತ್ರಗಳು": [
        "ಎಡಿಗರು ಮದ್ಯ ತಯಾರಿಕೆ ಮತ್ತು ಪೂರೈಕೆ, ಹಾಗೂ 'ದಂಡು ಎಡಿಗರು' (ಸೇನೆಯೊಂದಿಗಿನ ಬೆಂಬಲ) ಆಗಿ ಕಾರ್ಯ ನಿರ್ವಹಿಸುತ್ತಿದ್ದರು.",
        "ಚಂದ್ರಗುಪ್ತ, ಆದಿ ಶಂಕರಾಚಾರ್ಯ, ಪ್ರತಾಪರುದ್ರ, ಬಸವೇಶ್ವರ, ವಿಜಯನಗರ ಸಾಮ್ರಾಟರು, ಔರಂಗಜೇಬ್ ಇತ್ಯಾದಿ ಕಾಲಘಟ್ಟಗಳಲ್ಲಿ ಇವರ ಉಲ್ಲೇಖವಿದೆ.",
      ],
      "ಸಾಮಾಜಿಕ ಜಾಗೃತಿ": [
        "1927: ಕರ್ನಾಟಕ ಆಂಧ್ರ ಈಡಿಗರ ಮಹಾಸಭೆ ನಡೆಯಿತು.",
        "1944: ಕೆ. ಎನ್. ಗುರುಸ್ವಾಮಿ ಅವರ ನೇತೃತ್ವದಲ್ಲಿ ಬೆಂಗಳೂರು ಚಿಕ್ಕವಳ್ಳಿಯಲ್ಲಿ ವಿದ್ಯಾರ್ಥಿಗಳಿಗೆ ವಸತಿ ನಿಲಯ ಆರಂಭವಾಯಿತು.",
        "1958: ಜಯಚಾಮರಾಜೇಂದ್ರ ವೋಡೇಯರ್ ಅವರು ಭಾರೀ ಸಮ್ಮೇಳನವನ್ನು ಉದ್ಘಾಟಿಸಿ, 26 ಪ್ರಭೇದಗಳನ್ನು 'ಮೈಸೂರು ಪ್ರಾಂತ ಆರ್ಯ ಈಡಿಗ ಸಂಘ' ಹೆಸರಿನಲ್ಲಿ ಏಕೀಕರಿಸಿದರು.",
      ],
      "ಪ್ರಮುಖ ನಾಯಕರು": [
        "ರಾವ್ ಸಾಹೇಬ ಕಣೇಕಲ್ ನೆಟ್ಟಕಲ್ಲಪ್ಪ, ಕೆ. ವೆಂಕಟಸ್ವಾಮಿ, ಇ. ಹನುಮಂತಯ್ಯ, ಮೂಲ ರಂಗಪ್ಪ, ಎಂ. ಕೆ. ನರಾಯಣಸ್ವಾಮಿ, ಕೆ. ಧೂಮಪ್ಪ ಮೊದಲಾದವರು.",
        "ರಾಜಕೀಯವಾಗಿ ಮುರಾರಿ ಕಾಮಲಮ್ಮ, ದಾಮೋದರ ಮುಲ್ಕಿ, ಸೋಮಪ್ಪ ಸುರ್ವಣ ಮುಂತಾದವರು ಶಾಸಕರಾಗಿ, ಸಂಸದರಾಗಿಯೂ ಸೇವೆ ಸಲ್ಲಿಸಿದ್ದಾರೆ.",
      ],
      "ಸವಾಲುಗಳು ಮತ್ತು ಪ್ರಗತಿ": [
        "ಜನಸಂಖ್ಯೆಯಲ್ಲಿ ಕರ್ನಾಟಕದ 7ನೇ ಅತಿ ದೊಡ್ಡ ಸಮುದಾಯವಾಗಿದ್ದರೂ, ಅಕ್ಷರಾಸಕ್ತಿಯ ಕೊರತೆ, ಮೂಢನಂಬಿಕೆ, ಪ್ರಾರಂಭಿಕ ಏಕತೆ ಕೊರತೆ ಇತ್ಯಾದಿ ಕಾರಣಗಳಿಂದ ಅಭಿವೃದ್ಧಿ ನಿಧಾನವಾಗಿದೆ.",
        "ಇಂದಿಗೂ ಶಿಕ್ಷಣ, ರಾಜಕೀಯ ಮತ್ತು ಸಾಮಾಜಿಕ ಸುಧಾರಣೆಯತ್ತ ಪ್ರಯತ್ನಗಳು ಸಾಗುತ್ತಿವೆ.",
      ],
    };

    final historySections =
    language == "Kannada" ? kannadaHistory : englishHistory;

    // 🔹 Sample leaders images (replace with real asset URLs or local images)
    final List<Map<String, String>> leaders = [
      {
        "name": "Dr. Rajkumar",
        "image":
        "https://upload.wikimedia.org/wikipedia/commons/5/57/Rajkumar_in_2000.jpg"
      },
      {
        "name": "Puneeth Rajkumar",
        "image":
        "https://upload.wikimedia.org/wikipedia/commons/f/fc/PuneethRajkumar.jpg"
      },
      {
        "name": "K. N. Guruswamy",
        "image":
        "https://via.placeholder.com/150.png?text=K+N+Guruswamy"
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text(language == "Kannada" ? "ನಮ್ಮ ಇತಿಹಾಸ" : "Our History"),
        backgroundColor: Colors.deepPurple,
        leading: BackButton(color: Colors.white),
      ),
      body: ListView(
        padding: EdgeInsets.all(16),
        children: [
          // 🔹 Display Leaders in Round Cards
          Text(
            language == "Kannada"
                ? "ಪ್ರಮುಖ ವ್ಯಕ್ತಿಗಳು"
                : "Prominent Personalities",
            style: TextStyle(
                fontSize: 20, fontWeight: FontWeight.bold, color: Colors.deepPurple),
          ),
          SizedBox(height: 12),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: leaders.map((leader) {
                return Container(
                  margin: EdgeInsets.symmetric(horizontal: 8),
                  child: Column(
                    children: [
                      CircleAvatar(
                        radius: 40,
                        backgroundImage: NetworkImage(leader['image']!),
                      ),
                      SizedBox(height: 6),
                      Text(
                        leader['name']!,
                        style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
                      )
                    ],
                  ),
                );
              }).toList(),
            ),
          ),
          SizedBox(height: 20),

          // 🔹 Display History in Stanza Cards
          ...historySections.entries.map((entry) {
            return Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              elevation: 4,
              margin: EdgeInsets.only(bottom: 16),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      entry.key,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.deepPurple,
                      ),
                    ),
                    SizedBox(height: 10),
                    ...entry.value.map(
                          (para) => Padding(
                        padding: const EdgeInsets.only(bottom: 8.0),
                        child: Text(
                          para,
                          style: TextStyle(fontSize: 15, height: 1.5),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          }),
        ],
      ),
    );
  }
}

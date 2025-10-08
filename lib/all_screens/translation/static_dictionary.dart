// lib/all_screens/translation/static_dictionary.dart
class StaticDictionary {
  static final Map<String, Map<String, String>> _dict = {
    'Our history': {'kn': 'ನಮ್ಮ ಇತಿಹಾಸ'},
    'Membership': {'kn': 'ಸದಸ್ಯತ್ವ'},
    'Job Searching': {'kn': 'ಕೆಲಸದ ಹುಡುಕಾಟ'},
    'Scholarships': {'kn': 'ವಿದ್ಯಾವೇತನಗಳು'},
    'Hostel Details': {'kn': 'ಹಾಸ್ಟೆಲ್ ವಿವರಗಳು'},
    'Contact Us': {'kn': 'ನಮ್ಮನ್ನು ಸಂಪರ್ಕಿಸಿ'},
    'Notifications': {'kn': 'ಅಧಿಸೂಚನೆಗಳು'},
    'Health & Wellness': {'kn': 'ಆರೋಗ್ಯ ಮತ್ತು ಕಲ್ಯಾಣ'},
    'Schemes': {'kn': 'ಯೋಜನೆಗಳು'},
    'Community Initiatives': {'kn': 'ಸಮುದಾಯ ಮುಂದಾಳುತ್ವಗಳು'},
    'Community Empowerment': {'kn': 'ಸಮುದಾಯ ಶಕ್ತಿ ವೃದ್ಧಿ'},
    'Submit': {'kn': 'ಸಲ್ಲಿಸು'},
    'Cancel': {'kn': 'ರದ್ದುಮಾಡು'},
    'Back': {'kn': 'ಹಿಂದೆ'},
    'Next': {'kn': 'ಮುಂದೆ'},
    'Done': {'kn': 'ಮುಗಿದಿದೆ'},
  };

  // ✅ Must be public static getter
  static Map<String, Map<String, String>> get entries => _dict;

  static String translateOffline(String key, String lang) {
    return _dict[key]?[lang] ?? key;
  }
}

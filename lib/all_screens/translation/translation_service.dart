import 'dart:convert';
import 'package:http/http.dart' as http;
import 'static_dictionary.dart'; // Must match actual file path

class TranslationService {
  /// Translate [text] from [from] to [to]
  /// Uses MyMemory API, falls back to StaticDictionary if offline or API fails
  static Future<String> translate({
    required String text,
    required String from,
    required String to,
  }) async {
    // 1️⃣ Try offline dictionary first
    final local = _getLocalTranslation(text, to);
    if (local != null) return local;

    // 2️⃣ Prepare API URL
    final url = Uri.parse(
      'https://api.mymemory.translated.net/get?q=${Uri.encodeComponent(text)}&langpair=$from|$to',
    );

    try {
      final response = await http.get(url);

      if (response.statusCode == 200) {
        final Map<String, dynamic> data = json.decode(response.body);

        // Safely access nested map
        final translated =
        (data['responseData'] as Map<String, dynamic>?)?['translatedText']
            ?.toString();

        return translated != null && translated.isNotEmpty ? translated : text;
      } else {
        return text; // API returned error
      }
    } catch (e) {
      return text; // Network or parsing error
    }
  }

  /// Get translation from offline dictionary
  static String? _getLocalTranslation(String text, String targetLang) {
    // Ensure StaticDictionary has a static getter for entries
    final dictionary = StaticDictionary.entries;

    // Match key case-insensitively
    final key = dictionary.keys
        .firstWhere((k) => k.toLowerCase() == text.toLowerCase(),
        orElse: () => '');
    if (key.isNotEmpty) {
      return dictionary[key]?[targetLang];
    }
    return null;
  }
}

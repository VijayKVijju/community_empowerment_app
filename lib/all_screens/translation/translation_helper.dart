import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'language_provider.dart';
import 'translation_service.dart';

/// Returns translated text based on current language
/// Example usage in widget:
/// String label = await translatedText('Submit', ref);
Future<String> translatedText(String key, WidgetRef ref) async {
  final currentLang = ref.read(languageProvider);
  if (currentLang == 'en') return key; // No translation needed

  return await TranslationService.translate(
    text: key,
    from: 'en',
    to: currentLang,
  );
}

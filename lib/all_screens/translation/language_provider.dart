import 'package:flutter_riverpod/flutter_riverpod.dart';

/// StateNotifier to manage app language
class LanguageNotifier extends StateNotifier<String> {
  LanguageNotifier() : super('en'); // Default language: English

  void changeLanguage(String newLang) {
    state = newLang;
  }
}

/// Riverpod provider for global access
final languageProvider =
StateNotifierProvider<LanguageNotifier, String>((ref) => LanguageNotifier());

import 'package:flutter/material.dart';

import 'initiative.dart';

class MyRegistrationsPage extends StatelessWidget {
  final String selectedLanguage;
  final List<Initiative> registeredInitiatives;

  const MyRegistrationsPage({
    Key? key,
    required this.selectedLanguage,
    required this.registeredInitiatives,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(selectedLanguage == "Kannada"
            ? "ನನ್ನ ನೋಂದಣಿಗಳು"
            : "My Registrations"),
        backgroundColor: Colors.deepPurple,
      ),
      body: registeredInitiatives.isEmpty
          ? Center(
        child: Text(selectedLanguage == "Kannada"
            ? "ಯಾವುದೇ ನೋಂದಣಿ ಇಲ್ಲ"
            : "No registrations yet"),
      )
          : ListView.builder(
        itemCount: registeredInitiatives.length,
        itemBuilder: (context, index) {
          final item = registeredInitiatives[index];
          return ListTile(
            leading: Image.network(item.imageUrl, width: 60),
            title: Text(selectedLanguage == "Kannada"
                ? item.titleKn
                : item.titleEn),
            subtitle: Text(item.date),
          );
        },
      ),
    );
  }
}

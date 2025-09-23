
/*

import 'package:flutter/material.dart';

import 'all_screens/home/home.dart';
import 'all_screens/hostels/explore_page.dart';
import 'all_screens/job_searching/job_searching.dart';
import 'all_screens/scholarships/scholarship.dart';

void main() => runApp(CommunityEmpowermentApp());

class CommunityEmpowermentApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Community Empowerment',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        fontFamily: 'Roboto',
      ),
      home: HomePage(),
    );
  }
}


 */
import 'package:flutter/material.dart';

import 'all_screens/home/home.dart';

void main() => runApp(CommunityEmpowermentApp());

class CommunityEmpowermentApp extends StatefulWidget {
  const CommunityEmpowermentApp({super.key});

  @override
  State<CommunityEmpowermentApp> createState() => _CommunityEmpowermentAppState();
}

class _CommunityEmpowermentAppState extends State<CommunityEmpowermentApp> {
  String _selectedLanguage = 'English';

  void _setLanguage(String language) {
    setState(() {
      _selectedLanguage = language;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Community Empowerment',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        fontFamily: 'Roboto',
      ),
      home: const HomePage(),
    );
  }
}
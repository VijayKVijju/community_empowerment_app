
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
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'all_screens/home/home.dart';

void main() {
  // ✅ Wrap the entire app with ProviderScope for Riverpod
  runApp(
    const ProviderScope(
      child: CommunityEmpowermentApp(),
    ),
  );
}

class CommunityEmpowermentApp extends StatelessWidget {
  const CommunityEmpowermentApp({super.key});

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

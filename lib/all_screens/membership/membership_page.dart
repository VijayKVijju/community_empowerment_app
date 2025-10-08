import 'package:flutter/material.dart';
import 'membership_generate_page.dart';

class MembershipPage extends StatefulWidget {
  const MembershipPage({Key? key}) : super(key: key);

  @override
  State<MembershipPage> createState() => _MembershipPageState();
}

class _MembershipPageState extends State<MembershipPage> {
  void _navigateToGenerate() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const MembershipGeneratePage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    final Color skyMagenta = const Color(0xFFFF66CC);
    final Color deepPurple = Colors.deepPurple;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Membership"),
        backgroundColor: deepPurple,
        leading: BackButton(onPressed: () => Navigator.pop(context)),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [skyMagenta.withOpacity(0.8), deepPurple.withOpacity(0.9)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Center(
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 22),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              elevation: 6,
            ),
            onPressed: _navigateToGenerate,
            child: const Text(
              "Activate Your Membership",
              style: TextStyle(fontSize: 16, color: Colors.black, fontWeight: FontWeight.w600),
            ),
          ),
        ),
      ),
    );
  }
}

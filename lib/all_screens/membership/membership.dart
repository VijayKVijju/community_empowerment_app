import 'package:flutter/material.dart';

class MembershipPage extends StatefulWidget {
  const MembershipPage({Key? key}) : super(key: key);

  @override
  State<MembershipPage> createState() => _MembershipPageState();
}

class _MembershipPageState extends State<MembershipPage> {
  bool activated = false;

  void _activateMembership() {
    setState(() {
      activated = true;
    });

    Future.delayed(Duration(milliseconds: 300), () {
      showDialog(
        context: context,
        builder: (_) => AlertDialog(
          backgroundColor: Colors.green.shade50,
          title: const Text("Membership Activated",
              style: TextStyle(color: Colors.green)),
          content: const Text(
              "🎉 You are successfully registered!\nYour Membership ID: MEM12345"),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text("OK", style: TextStyle(color: Colors.green)),
            )
          ],
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Membership"),
        backgroundColor: Colors.deepPurple,
        leading: BackButton(onPressed: () => Navigator.pop(context)),
      ),
      body: Center(
        child: !activated
            ? ElevatedButton(
          style: ElevatedButton.styleFrom(
              backgroundColor: Colors.deepPurple,
              padding: const EdgeInsets.symmetric(
                  vertical: 14, horizontal: 22)),
          onPressed: _activateMembership,
          child: const Text("Activate Your Membership"),
        )
            : Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.check_circle,
                color: Colors.green, size: 60),
            const SizedBox(height: 10),
            const Text("Membership Already Activated",
                style: TextStyle(fontSize: 16, color: Colors.green)),
          ],
        ),
      ),
    );
  }
}

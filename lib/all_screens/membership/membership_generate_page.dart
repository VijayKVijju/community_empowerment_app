import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'membership_certificate_page.dart';

class MembershipGeneratePage extends StatefulWidget {
  const MembershipGeneratePage({Key? key}) : super(key: key);

  @override
  State<MembershipGeneratePage> createState() => _MembershipGeneratePageState();
}

class _MembershipGeneratePageState extends State<MembershipGeneratePage> {
  bool _agreed = false;
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();

  void _generateMembership() {
    if (!_agreed || _nameController.text.isEmpty || _addressController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Please fill all fields and agree to continue.")),
      );
      return;
    }

    final String membershipId = "MEM${DateTime.now().millisecondsSinceEpoch.toString().substring(7)}";
    final String date = DateFormat('dd MMM yyyy').format(DateTime.now());

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => MembershipCertificatePage(
          name: _nameController.text,
          address: _addressController.text,
          membershipId: membershipId,
          date: date,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final Color skyMagenta = const Color(0xFFFF66CC);
    final Color deepPurple = Colors.deepPurple;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Generate Membership"),
        backgroundColor: deepPurple,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [skyMagenta.withOpacity(0.8), deepPurple.withOpacity(0.9)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              TextField(
                controller: _nameController,
                decoration: const InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  labelText: "Full Name",
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 15),
              TextField(
                controller: _addressController,
                decoration: const InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  labelText: "Address",
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 20),
              CheckboxListTile(
                value: _agreed,
                onChanged: (value) => setState(() => _agreed = value!),
                title: const Text(
                  "I agree to share my data for membership generation",
                  style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500),
                ),
                controlAffinity: ListTileControlAffinity.leading,
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _generateMembership,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 22),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: const Text(
                  "Generate Membership",
                  style: TextStyle(fontSize: 16, color: Colors.black, fontWeight: FontWeight.w600),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

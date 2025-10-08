import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';

class MembershipCertificatePage extends StatelessWidget {
  final String name;
  final String address;
  final String membershipId;
  final String date;

  const MembershipCertificatePage({
    super.key,
    required this.name,
    required this.address,
    required this.membershipId,
    required this.date,
  });

  @override
  Widget build(BuildContext context) {
    final Color skyMagenta = const Color(0xFFFF66CC);
    final Color deepPurple = Colors.deepPurple;

    final certificate = Container(
      width: double.infinity,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [skyMagenta.withOpacity(0.2), Colors.white],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
        border: Border.all(color: deepPurple, width: 3),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "🏛️ COMMUNITY EMPOWERMENT SOCIETY 🏛️",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: deepPurple,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            "Membership Certificate",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: Colors.black,
            ),
          ),
          const Divider(thickness: 1, color: Colors.black54),
          const SizedBox(height: 10),
          Text("Membership ID: $membershipId", style: const TextStyle(fontSize: 14, color: Colors.black)),
          const SizedBox(height: 5),
          Text("Name: $name", style: const TextStyle(fontSize: 14, color: Colors.black)),
          const SizedBox(height: 5),
          Text("Address: $address", style: const TextStyle(fontSize: 14, color: Colors.black)),
          const SizedBox(height: 5),
          Text("Date of Membership: $date", style: const TextStyle(fontSize: 14, color: Colors.black)),
          const SizedBox(height: 25),
          Align(
            alignment: Alignment.bottomRight,
            child: Column(
              children: [
                Image.network(
                  "https://via.placeholder.com/120x40.png?text=Signature",
                  width: 120,
                ),
                Text(
                  "Community Head",
                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500, color: deepPurple),
                ),
              ],
            ),
          ),
        ],
      ),
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text("Your Membership Certificate"),
        backgroundColor: deepPurple,
      ),
      body: PhotoView.customChild(
        child: certificate,
        backgroundDecoration: const BoxDecoration(color: Colors.white),
        minScale: PhotoViewComputedScale.contained,
        maxScale: PhotoViewComputedScale.covered * 2.5,
      ),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: skyMagenta,
        icon: const Icon(Icons.check_circle, color: Colors.black),
        label: const Text("Membership Activated!", style: TextStyle(color: Colors.black)),
        onPressed: () => ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("🎉 Your membership has been activated!")),
        ),
      ),
    );
  }
}

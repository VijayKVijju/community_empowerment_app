import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactUsPage extends StatelessWidget {
  const ContactUsPage({Key? key}) : super(key: key);

  Future<void> _launchUrl(String url) async {
    if (!await launchUrl(Uri.parse(url), mode: LaunchMode.externalApplication)) {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Contact Us"),
        backgroundColor: Colors.deepPurple,
        leading: BackButton(onPressed: () => Navigator.pop(context)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            const Text("Get in Touch",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),

            const SizedBox(height: 12),
            // Contact Form
            TextField(decoration: const InputDecoration(labelText: "Name")),
            TextField(decoration: const InputDecoration(labelText: "Email")),
            TextField(decoration: const InputDecoration(labelText: "Phone")),
            TextField(
              decoration: const InputDecoration(labelText: "Message"),
              maxLines: 3,
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                  content: Text("Message Sent!"),
                ));
              },
              child: const Text("Submit"),
            ),

            const Divider(height: 30),

            // Direct call & email
            ListTile(
              leading: const Icon(Icons.call, color: Colors.green),
              title: const Text("Call Us"),
              onTap: () => _launchUrl("tel:+911234567890"),
            ),
            ListTile(
              leading: const Icon(Icons.email, color: Colors.red),
              title: const Text("Email Us"),
              onTap: () => _launchUrl("mailto:info@community.org"),
            ),

            const Divider(height: 30),

            // Google Maps
            ListTile(
              leading: const Icon(Icons.location_on, color: Colors.blue),
              title: const Text("Find Us on Map"),
              onTap: () => _launchUrl(
                  "https://www.google.com/maps/search/?api=1&query=Community+Office"),
            ),

            const Divider(height: 30),

            // Social Media
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                    onPressed: () => _launchUrl("https://facebook.com"),
                    icon: const Icon(Icons.facebook, color: Colors.blue)),
                IconButton(
                    onPressed: () => _launchUrl("https://twitter.com"),
                    icon: const Icon(Icons.alternate_email, color: Colors.lightBlue)),
                IconButton(
                    onPressed: () => _launchUrl("https://instagram.com"),
                    icon: const Icon(Icons.camera_alt, color: Colors.purple)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

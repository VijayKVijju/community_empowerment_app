import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  bool showAge = true;
  bool showGender = false;
  bool showContactInfo = false;

  double profileCompleteness = 0.7; // Example: 70% complete

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("My Profile"),
        actions: [
          IconButton(
            icon: const Icon(Icons.edit),
            onPressed: () {
              // Navigate to Edit Profile Screen
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Profile Picture + Name + Verification Badge
            Center(
              child: Stack(
                children: [
                  const CircleAvatar(
                    radius: 50,
                    backgroundImage: NetworkImage(
                      "https://via.placeholder.com/150", // Replace with user pic
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 4,
                    child: Container(
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.blue,
                      ),
                      padding: const EdgeInsets.all(4),
                      child: const Icon(
                        Icons.verified,
                        size: 20,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 12),
            const Text(
              "John Doe",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 20),

            // Profile Completeness
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text("Profile Completeness"),
                const SizedBox(height: 6),
                LinearProgressIndicator(
                  value: profileCompleteness,
                  minHeight: 8,
                  borderRadius: BorderRadius.circular(10),
                  backgroundColor: Colors.grey[300],
                  valueColor:
                  const AlwaysStoppedAnimation<Color>(Colors.green),
                ),
                const SizedBox(height: 6),
                Text("${(profileCompleteness * 100).toInt()}% Complete"),
              ],
            ),

            const SizedBox(height: 20),

            // Basic Info
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              elevation: 2,
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Column(
                  children: const [
                    ListTile(
                      leading: Icon(Icons.person),
                      title: Text("Gender"),
                      subtitle: Text("Male"),
                    ),
                    Divider(),
                    ListTile(
                      leading: Icon(Icons.cake),
                      title: Text("Date of Birth"),
                      subtitle: Text("15 March 1995 (Age: 30)"),
                    ),
                    Divider(),
                    ListTile(
                      leading: Icon(Icons.language),
                      title: Text("Language Preference"),
                      subtitle: Text("English"),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 20),

            // Privacy Controls
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              elevation: 2,
              child: Column(
                children: [
                  const ListTile(
                    leading: Icon(Icons.lock),
                    title: Text(
                      "Privacy Controls",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  SwitchListTile(
                    title: const Text("Show Age"),
                    value: showAge,
                    onChanged: (val) {
                      setState(() => showAge = val);
                    },
                  ),
                  SwitchListTile(
                    title: const Text("Show Gender"),
                    value: showGender,
                    onChanged: (val) {
                      setState(() => showGender = val);
                    },
                  ),
                  SwitchListTile(
                    title: const Text("Show Contact Info"),
                    value: showContactInfo,
                    onChanged: (val) {
                      setState(() => showContactInfo = val);
                    },
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            // Account Actions
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              elevation: 2,
              child: Column(
                children: [
                  ListTile(
                    leading: const Icon(Icons.verified_user),
                    title: const Text("Manage Verification"),
                    trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                    onTap: () {
                      // Navigate to verification page
                    },
                  ),
                  const Divider(),
                  ListTile(
                    leading: const Icon(Icons.logout, color: Colors.red),
                    title: const Text("Logout"),
                    onTap: () {
                      // Handle logout
                    },
                  ),
                  const Divider(),
                  ListTile(
                    leading:
                    const Icon(Icons.delete_forever, color: Colors.red),
                    title: const Text("Delete Account"),
                    onTap: () {
                      // Handle account deletion
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

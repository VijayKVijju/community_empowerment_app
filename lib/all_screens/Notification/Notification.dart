import 'package:flutter/material.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  // Sample notifications (you can fetch from API or DB later)
  final List<Map<String, dynamic>> unreadNotifications = [
    {"title": "Emergency Alert", "subtitle": "Flood warning in your area", "type": "emergency"},
    {"title": "Event Reminder", "subtitle": "Community meeting tomorrow 5 PM", "type": "event"},
    {"title": "Job Alert", "subtitle": "New scholarship opportunity available", "type": "job"},
  ];

  final List<Map<String, dynamic>> readNotifications = [
    {"title": "System Update", "subtitle": "App maintenance scheduled tonight", "type": "system"},
    {"title": "General Announcement", "subtitle": "Welcome to the new community app!", "type": "general"},
    {"title": "Achievement", "subtitle": "You earned a volunteer badge!", "type": "achievement"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF6739B7), // PhonePe Purple
      appBar: AppBar(
        backgroundColor: const Color(0xFF6739B7),
        elevation: 0,
        title: const Text(
          "Notifications",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Unread Section
            const Text(
              "Unread",
              style: TextStyle(
                  color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            ...unreadNotifications.map((notif) => _buildNotificationCard(notif)),

            const SizedBox(height: 20),

            // Read Section
            const Text(
              "Read",
              style: TextStyle(
                  color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            ...readNotifications.map((notif) => _buildNotificationCard(notif)),
          ],
        ),
      ),
    );
  }

  Widget _buildNotificationCard(Map<String, dynamic> notif) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      color: Colors.white.withOpacity(0.15), // Transparent card
      elevation: 0,
      margin: const EdgeInsets.symmetric(vertical: 6),
      child: ListTile(
        leading: Icon(
          _getIconForType(notif["type"]),
          color: Colors.white,
        ),
        title: Text(
          notif["title"],
          style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        subtitle: Text(
          notif["subtitle"],
          style: const TextStyle(color: Colors.white70),
        ),
        onTap: () {
          // Handle tap → open details screen
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text("Opened: ${notif["title"]}")),
          );
        },
      ),
    );
  }

  IconData _getIconForType(String type) {
    switch (type) {
      case "emergency":
        return Icons.warning_amber_rounded;
      case "event":
        return Icons.event;
      case "job":
        return Icons.work;
      case "system":
        return Icons.settings;
      case "achievement":
        return Icons.emoji_events;
      case "general":
        return Icons.campaign;
      default:
        return Icons.notifications;
    }
  }
}

/*--------------------------------------------
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  final List<Map<String, dynamic>> modules = [
    {'title': 'Our history', 'icon': Icons.info_outline},
    {'title': 'Membership', 'icon': Icons.person_add},
    {'title': 'Job Searching', 'icon': Icons.work_outline},
    {'title': 'Scholarships', 'icon': Icons.school},
    {'title': 'Hostel Details', 'icon': Icons.house},
    {'title': 'Contact Us', 'icon': Icons.email},
    {'title': 'Notifications', 'icon': Icons.notifications},
    {'title': 'Health & Wellness', 'icon': Icons.health_and_safety},
    {'title': 'Schemes', 'icon': Icons.article},
    {'title': 'Community Initiatives', 'icon': Icons.groups},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Community Empowerment'),
        backgroundColor: Colors.deepPurple,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: GridView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
              ),
              itemCount: modules.length,
              itemBuilder: (context, index) {
                return ModuleCard(
                  title: modules[index]['title'],
                  icon: modules[index]['icon'],
                );
              },
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.deepPurple,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white60,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            label: 'Alerts',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}

class ModuleCard extends StatelessWidget {
  final String title;
  final IconData icon;

  const ModuleCard({required this.title, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.deepPurple.shade50,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      elevation: 3,
      child: InkWell(
        onTap: () {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Opening $title...')),
          );
        },
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, size: 30, color: Colors.deepPurple),
              SizedBox(height: 10),
              Text(
                title,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600),
              )
            ],
          ),
        ),
      ),
    );
  }
}

----------------------------------------------


import 'package:flutter/material.dart';
import 'scholarship.dart'; // import the new scholarship page

class HomePage extends StatelessWidget {
  final List<Map<String, dynamic>> modules = [
    {'title': 'Our history', 'icon': Icons.info_outline},
    {'title': 'Membership', 'icon': Icons.person_add},
    {'title': 'Job Searching', 'icon': Icons.work_outline},
    {'title': 'Scholarships', 'icon': Icons.school},
    {'title': 'Hostel Details', 'icon': Icons.house},
    {'title': 'Contact Us', 'icon': Icons.email},
    {'title': 'Notifications', 'icon': Icons.notifications},
    {'title': 'Health & Wellness', 'icon': Icons.health_and_safety},
    {'title': 'Schemes', 'icon': Icons.article},
    {'title': 'Community Initiatives', 'icon': Icons.groups},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Community Empowerment'),
        backgroundColor: Colors.deepPurple,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: GridView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
              ),
              itemCount: modules.length,
              itemBuilder: (context, index) {
                return ModuleCard(
                  title: modules[index]['title'],
                  icon: modules[index]['icon'],
                );
              },
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.deepPurple,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white60,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            label: 'Alerts',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}

class ModuleCard extends StatelessWidget {
  final String title;
  final IconData icon;

  const ModuleCard({required this.title, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.deepPurple.shade50,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      elevation: 3,
      child: InkWell(
        onTap: () {
          if (title == "Scholarships") {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ScholarshipPage()),
            );
          } else {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('Opening $title...')),
            );
          }
        },
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, size: 30, color: Colors.deepPurple),
              SizedBox(height: 10),
              Text(
                title,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600),
              )
            ],
          ),
        ),
      ),
    );
  }
}
-------------------------------------
import 'package:flutter/material.dart';
import '../scholarships/scholarship.dart'; // import the new scholarship page

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Map<String, dynamic>> modules = [
    {'title': 'Our history', 'icon': Icons.info_outline},
    {'title': 'Membership', 'icon': Icons.person_add},
    {'title': 'Job Searching', 'icon': Icons.work_outline},
    {'title': 'Scholarships', 'icon': Icons.school},
    {'title': 'Hostel Details', 'icon': Icons.house},
    {'title': 'Contact Us', 'icon': Icons.email},
    {'title': 'Notifications', 'icon': Icons.notifications},
    {'title': 'Health & Wellness', 'icon': Icons.health_and_safety},
    {'title': 'Schemes', 'icon': Icons.article},
    {'title': 'Community Initiatives', 'icon': Icons.groups},
  ];

  final List<String> mediaItems = [
    "https://via.placeholder.com/400x200.png?text=Image+1",
    "https://via.placeholder.com/400x200.png?text=Image+2",
    "https://via.placeholder.com/400x200.png?text=Video+1",
  ];

  int currentIndex = 0;

  void _nextMedia() {
    setState(() {
      currentIndex = (currentIndex + 1) % mediaItems.length;
    });
  }

  void _previousMedia() {
    setState(() {
      currentIndex = (currentIndex - 1 + mediaItems.length) % mediaItems.length;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        title: Text('Community Empowerment'),
        backgroundColor: Colors.deepPurple,
        actions: [
          IconButton(
            icon: Icon(Icons.language),
            onPressed: () {
              _showLanguageSelector(context);
            },
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              // 🔹 Media carousel with arrows
              Container(
                height: 200,
                margin: const EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  color: Colors.deepPurple.shade50,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Stack(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Image.network(
                        mediaItems[currentIndex],
                        fit: BoxFit.cover,
                        width: double.infinity,
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: IconButton(
                        icon: Icon(Icons.arrow_back_ios, color: Colors.white),
                        onPressed: _previousMedia,
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: IconButton(
                        icon: Icon(Icons.arrow_forward_ios, color: Colors.white),
                        onPressed: _nextMedia,
                      ),
                    ),
                  ],
                ),
              ),

              // 🔹 Attractive Grid Options
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: GridView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, // 2 per row
                    crossAxisSpacing: 14,
                    mainAxisSpacing: 14,
                    childAspectRatio: 1.2, // reduced size
                  ),
                  itemCount: modules.length,
                  itemBuilder: (context, index) {
                    // Pick color based on index for variety but consistent psychology
                    final colors = [
                      [Colors.blue.shade400, Colors.blue.shade700],
                      [Colors.teal.shade400, Colors.teal.shade700],
                      [Colors.deepPurple.shade400, Colors.deepPurple.shade700],
                      [Colors.green.shade400, Colors.green.shade700],
                      [Colors.orange.shade400, Colors.orange.shade700],
                    ];
                    final gradient = colors[index % colors.length];

                    return ModuleCard(
                      title: modules[index]['title'],
                      icon: modules[index]['icon'],
                      gradient: gradient,
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.deepPurple,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white60,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            label: 'Alerts',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            label: 'Profile',
          ),
        ],
      ),
    );
  }

  void _showLanguageSelector(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) => Container(
        padding: EdgeInsets.all(16),
        child: Wrap(
          children: [
            ListTile(
              leading: Icon(Icons.language),
              title: Text("English"),
              onTap: () {
                Navigator.pop(context);
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text("Language changed to English")),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.language),
              title: Text("ಕನ್ನಡ (Kannada)"),
              onTap: () {
                Navigator.pop(context);
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text("ಭಾಷೆ ಕನ್ನಡಕ್ಕೆ ಬದಲಾಯಿಸಲಾಗಿದೆ")),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class ModuleCard extends StatefulWidget {
  final String title;
  final IconData icon;
  final List<Color> gradient;

  const ModuleCard({required this.title, required this.icon, required this.gradient});

  @override
  State<ModuleCard> createState() => _ModuleCardState();
}

class _ModuleCardState extends State<ModuleCard> with SingleTickerProviderStateMixin {
  bool _isPressed = false;

  @override
  Widget build(BuildContext context) {
    return AnimatedScale(
      scale: _isPressed ? 0.95 : 1.0,
      duration: Duration(milliseconds: 150),
      child: GestureDetector(
        onTapDown: (_) => setState(() => _isPressed = true),
        onTapUp: (_) => setState(() => _isPressed = false),
        onTapCancel: () => setState(() => _isPressed = false),
        onTap: () {
          if (widget.title == "Scholarships") {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ScholarshipPage()),
            );
          } else {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('Opening ${widget.title}...')),
            );
          }
        },
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: widget.gradient,
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(18),
            boxShadow: [
              BoxShadow(
                color: widget.gradient.last.withOpacity(0.4),
                blurRadius: 10,
                spreadRadius: 2,
                offset: Offset(3, 5),
              ),
            ],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(widget.icon, size: 36, color: Colors.white),
              SizedBox(height: 10),
              Text(
                widget.title,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  shadows: [
                    Shadow(
                      color: Colors.black26,
                      offset: Offset(1, 1),
                      blurRadius: 3,
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
------------------------------
import 'package:flutter/material.dart';
import '../histroy/history_page.dart';
import '../scholarships/scholarship.dart'; // Existing import

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String selectedLanguage = "English"; // ✅ To track language

  final List<Map<String, dynamic>> modules = [
    {'title': 'Our history', 'icon': Icons.info_outline},
    {'title': 'Membership', 'icon': Icons.person_add},
    {'title': 'Job Searching', 'icon': Icons.work_outline},
    {'title': 'Scholarships', 'icon': Icons.school},
    {'title': 'Hostel Details', 'icon': Icons.house},
    {'title': 'Contact Us', 'icon': Icons.email},
    {'title': 'Notifications', 'icon': Icons.notifications},
    {'title': 'Health & Wellness', 'icon': Icons.health_and_safety},
    {'title': 'Schemes', 'icon': Icons.article},
    {'title': 'Community Initiatives', 'icon': Icons.groups},
  ];

  final List<String> mediaItems = [
    "https://via.placeholder.com/400x200.png?text=Image+1",
    "https://via.placeholder.com/400x200.png?text=Image+2",
    "https://via.placeholder.com/400x200.png?text=Video+1",
  ];

  int currentIndex = 0;

  void _nextMedia() {
    setState(() {
      currentIndex = (currentIndex + 1) % mediaItems.length;
    });
  }

  void _previousMedia() {
    setState(() {
      currentIndex = (currentIndex - 1 + mediaItems.length) % mediaItems.length;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        title: Text('Community Empowerment'),
        backgroundColor: Colors.deepPurple,
        actions: [
          IconButton(
            icon: Icon(Icons.language),
            onPressed: () {
              _showLanguageSelector(context);
            },
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              // 🔹 Media carousel with arrows
              Container(
                height: 200,
                margin: const EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  color: Colors.deepPurple.shade50,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Stack(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Image.network(
                        mediaItems[currentIndex],
                        fit: BoxFit.cover,
                        width: double.infinity,
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: IconButton(
                        icon: Icon(Icons.arrow_back_ios, color: Colors.white),
                        onPressed: _previousMedia,
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: IconButton(
                        icon: Icon(Icons.arrow_forward_ios, color: Colors.white),
                        onPressed: _nextMedia,
                      ),
                    ),
                  ],
                ),
              ),

              // 🔹 Attractive Grid Options
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: GridView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, // 2 per row
                    crossAxisSpacing: 14,
                    mainAxisSpacing: 14,
                    childAspectRatio: 1.2, // reduced size
                  ),
                  itemCount: modules.length,
                  itemBuilder: (context, index) {
                    final colors = [
                      [Colors.blue.shade400, Colors.blue.shade700],
                      [Colors.teal.shade400, Colors.teal.shade700],
                      [Colors.deepPurple.shade400, Colors.deepPurple.shade700],
                      [Colors.green.shade400, Colors.green.shade700],
                      [Colors.orange.shade400, Colors.orange.shade700],
                    ];
                    final gradient = colors[index % colors.length];

                    return ModuleCard(
                      title: modules[index]['title'],
                      icon: modules[index]['icon'],
                      gradient: gradient,
                      selectedLanguage: selectedLanguage, // ✅ pass language
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.deepPurple,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white60,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            label: 'Alerts',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            label: 'Profile',
          ),
        ],
      ),
    );
  }

  void _showLanguageSelector(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) => Container(
        padding: EdgeInsets.all(16),
        child: Wrap(
          children: [
            ListTile(
              leading: Icon(Icons.language),
              title: Text("English"),
              onTap: () {
                setState(() => selectedLanguage = "English");
                Navigator.pop(context);
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text("Language changed to English")),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.language),
              title: Text("ಕನ್ನಡ (Kannada)"),
              onTap: () {
                setState(() => selectedLanguage = "Kannada");
                Navigator.pop(context);
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text("ಭಾಷೆ ಕನ್ನಡಕ್ಕೆ ಬದಲಾಯಿಸಲಾಗಿದೆ")),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class ModuleCard extends StatefulWidget {
  final String title;
  final IconData icon;
  final List<Color> gradient;
  final String selectedLanguage; // ✅ new param

  const ModuleCard({
    required this.title,
    required this.icon,
    required this.gradient,
    required this.selectedLanguage,
  });

  @override
  State<ModuleCard> createState() => _ModuleCardState();
}

class _ModuleCardState extends State<ModuleCard>
    with SingleTickerProviderStateMixin {
  bool _isPressed = false;

  @override
  Widget build(BuildContext context) {
    return AnimatedScale(
      scale: _isPressed ? 0.95 : 1.0,
      duration: Duration(milliseconds: 150),
      child: GestureDetector(
        onTapDown: (_) => setState(() => _isPressed = true),
        onTapUp: (_) => setState(() => _isPressed = false),
        onTapCancel: () => setState(() => _isPressed = false),
        onTap: () {
          if (widget.title == "Scholarships") {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ScholarshipPage()),
            );
          } else if (widget.title == "Our history") {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) =>
                    HistoryPage(language: widget.selectedLanguage),
              ),
            );
          } else {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('Opening ${widget.title}...')),
            );
          }
        },
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: widget.gradient,
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(18),
            boxShadow: [
              BoxShadow(
                color: widget.gradient.last.withOpacity(0.4),
                blurRadius: 10,
                spreadRadius: 2,
                offset: Offset(3, 5),
              ),
            ],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(widget.icon, size: 36, color: Colors.white),
              SizedBox(height: 10),
              Text(
                widget.title,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  shadows: [
                    Shadow(
                      color: Colors.black26,
                      offset: Offset(1, 1),
                      blurRadius: 3,
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
-------------------------------------

import 'package:flutter/material.dart';
import '../histroy/history_page.dart';
import '../job_searching/job_searching.dart';
import '../scholarships/scholarship.dart'; // Existing import

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String selectedLanguage = "English"; // ✅ To track language

  final List<Map<String, dynamic>> modules = [
    {'title': 'Our history', 'icon': Icons.info_outline},
    {'title': 'Membership', 'icon': Icons.person_add},
    {'title': 'Job Searching', 'icon': Icons.work_outline},
    {'title': 'Scholarships', 'icon': Icons.school},
    {'title': 'Hostel Details', 'icon': Icons.house},
    {'title': 'Contact Us', 'icon': Icons.email},
    {'title': 'Notifications', 'icon': Icons.notifications},
    {'title': 'Health & Wellness', 'icon': Icons.health_and_safety},
    {'title': 'Schemes', 'icon': Icons.article},
    {'title': 'Community Initiatives', 'icon': Icons.groups},
  ];

  final List<String> mediaItems = [
    "https://via.placeholder.com/400x200.png?text=Image+1",
    "https://via.placeholder.com/400x200.png?text=Image+2",
    "https://via.placeholder.com/400x200.png?text=Video+1",
  ];

  int currentIndex = 0;

  void _nextMedia() {
    setState(() {
      currentIndex = (currentIndex + 1) % mediaItems.length;
    });
  }

  void _previousMedia() {
    setState(() {
      currentIndex = (currentIndex - 1 + mediaItems.length) % mediaItems.length;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        title: Text('Community Empowerment'),
        backgroundColor: Colors.deepPurple,
        actions: [
          IconButton(
            icon: Icon(Icons.language),
            onPressed: () {
              _showLanguageSelector(context);
            },
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              // 🔹 Media carousel with arrows
              Container(
                height: 200,
                margin: const EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  color: Colors.deepPurple.shade50,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Stack(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Image.network(
                        mediaItems[currentIndex],
                        fit: BoxFit.cover,
                        width: double.infinity,
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: IconButton(
                        icon: Icon(Icons.arrow_back_ios, color: Colors.white),
                        onPressed: _previousMedia,
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: IconButton(
                        icon: Icon(Icons.arrow_forward_ios, color: Colors.white),
                        onPressed: _nextMedia,
                      ),
                    ),
                  ],
                ),
              ),

              // 🔹 Attractive Grid Options
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: GridView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, // 2 per row
                    crossAxisSpacing: 14,
                    mainAxisSpacing: 14,
                    childAspectRatio: 1.2,
                  ),
                  itemCount: modules.length,
                  itemBuilder: (context, index) {
                    final colors = [
                      [Colors.blue.shade400, Colors.blue.shade700],
                      [Colors.teal.shade400, Colors.teal.shade700],
                      [Colors.deepPurple.shade400, Colors.deepPurple.shade700],
                      [Colors.green.shade400, Colors.green.shade700],
                      [Colors.orange.shade400, Colors.orange.shade700],
                    ];
                    final gradient = colors[index % colors.length];

                    return ModuleCard(
                      title: modules[index]['title'],
                      icon: modules[index]['icon'],
                      gradient: gradient,
                      selectedLanguage: selectedLanguage,
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.deepPurple,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white60,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            label: 'Alerts',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            label: 'Profile',
          ),
        ],
      ),
    );
  }

  void _showLanguageSelector(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) => Container(
        padding: EdgeInsets.all(16),
        child: Wrap(
          children: [
            ListTile(
              leading: Icon(Icons.language),
              title: Text("English"),
              onTap: () {
                setState(() => selectedLanguage = "English");
                Navigator.pop(context);
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text("Language changed to English")),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.language),
              title: Text("ಕನ್ನಡ (Kannada)"),
              onTap: () {
                setState(() => selectedLanguage = "Kannada");
                Navigator.pop(context);
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text("ಭಾಷೆ ಕನ್ನಡಕ್ಕೆ ಬದಲಾಯಿಸಲಾಗಿದೆ")),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class ModuleCard extends StatefulWidget {
  final String title;
  final IconData icon;
  final List<Color> gradient;
  final String selectedLanguage;

  const ModuleCard({
    required this.title,
    required this.icon,
    required this.gradient,
    required this.selectedLanguage,
  });

  @override
  State<ModuleCard> createState() => _ModuleCardState();
}

class _ModuleCardState extends State<ModuleCard>
    with SingleTickerProviderStateMixin {
  bool _isPressed = false;

  @override
  Widget build(BuildContext context) {
    return AnimatedScale(
      scale: _isPressed ? 0.95 : 1.0,
      duration: Duration(milliseconds: 150),
      child: GestureDetector(
        onTapDown: (_) => setState(() => _isPressed = true),
        onTapUp: (_) => setState(() => _isPressed = false),
        onTapCancel: () => setState(() => _isPressed = false),
        onTap: () {
          if (widget.title == "Scholarships") {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ScholarshipPage()),
            );
          } else if (widget.title == "Our history") {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) =>
                    HistoryPage(language: widget.selectedLanguage),
              ),
            );
          } else if (widget.title == "Job Searching") {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => JobSeekerWizard()), // ✅ Open Job Searching form
            );
          } else {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('Opening ${widget.title}...')),
            );
          }
        },
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: widget.gradient,
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(18),
            boxShadow: [
              BoxShadow(
                color: widget.gradient.last.withOpacity(0.4),
                blurRadius: 10,
                spreadRadius: 2,
                offset: Offset(3, 5),
              ),
            ],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(widget.icon, size: 36, color: Colors.white),
              SizedBox(height: 10),
              Text(
                widget.title,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  shadows: [
                    Shadow(
                      color: Colors.black26,
                      offset: Offset(1, 1),
                      blurRadius: 3,
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
------------------------------


import 'package:flutter/material.dart';
import '../histroy/history_page.dart';
import '../hostels/explore_page.dart';
import '../job_searching/job_searching.dart';
import '../scholarships/scholarship.dart';


class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String selectedLanguage = "English"; // ✅ To track language

  final List<Map<String, dynamic>> modules = [
    {'title': 'Our history', 'icon': Icons.info_outline},
    {'title': 'Membership', 'icon': Icons.person_add},
    {'title': 'Job Searching', 'icon': Icons.work_outline},
    {'title': 'Scholarships', 'icon': Icons.school},
    {'title': 'Hostel Details', 'icon': Icons.house}, // ✅ Navigate to ExplorePage
    {'title': 'Contact Us', 'icon': Icons.email},
    {'title': 'Notifications', 'icon': Icons.notifications},
    {'title': 'Health & Wellness', 'icon': Icons.health_and_safety},
    {'title': 'Schemes', 'icon': Icons.article},
    {'title': 'Community Initiatives', 'icon': Icons.groups},
  ];

  final List<String> mediaItems = [
    "https://via.placeholder.com/400x200.png?text=Image+1",
    "https://via.placeholder.com/400x200.png?text=Image+2",
    "https://via.placeholder.com/400x200.png?text=Video+1",
  ];

  int currentIndex = 0;

  void _nextMedia() {
    setState(() {
      currentIndex = (currentIndex + 1) % mediaItems.length;
    });
  }

  void _previousMedia() {
    setState(() {
      currentIndex = (currentIndex - 1 + mediaItems.length) % mediaItems.length;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        title: const Text('Community Empowerment'),
        backgroundColor: Colors.deepPurple,
        actions: [
          IconButton(
            icon: const Icon(Icons.language),
            onPressed: () {
              _showLanguageSelector(context);
            },
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              // 🔹 Media carousel with arrows
              Container(
                height: 200,
                margin: const EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  color: Colors.deepPurple.shade50,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Stack(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Image.network(
                        mediaItems[currentIndex],
                        fit: BoxFit.cover,
                        width: double.infinity,
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: IconButton(
                        icon: const Icon(Icons.arrow_back_ios,
                            color: Colors.white),
                        onPressed: _previousMedia,
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: IconButton(
                        icon: const Icon(Icons.arrow_forward_ios,
                            color: Colors.white),
                        onPressed: _nextMedia,
                      ),
                    ),
                  ],
                ),
              ),

              // 🔹 Attractive Grid Options
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, // 2 per row
                    crossAxisSpacing: 14,
                    mainAxisSpacing: 14,
                    childAspectRatio: 1.2,
                  ),
                  itemCount: modules.length,
                  itemBuilder: (context, index) {
                    final colors = [
                      [Colors.blue.shade400, Colors.blue.shade700],
                      [Colors.teal.shade400, Colors.teal.shade700],
                      [Colors.deepPurple.shade400, Colors.deepPurple.shade700],
                      [Colors.green.shade400, Colors.green.shade700],
                      [Colors.orange.shade400, Colors.orange.shade700],
                    ];
                    final gradient = colors[index % colors.length];

                    return ModuleCard(
                      title: modules[index]['title'],
                      icon: modules[index]['icon'],
                      gradient: gradient,
                      selectedLanguage: selectedLanguage,
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.deepPurple,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white60,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            label: 'Alerts',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            label: 'Profile',
          ),
        ],
      ),
    );
  }

  void _showLanguageSelector(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) => Container(
        padding: const EdgeInsets.all(16),
        child: Wrap(
          children: [
            ListTile(
              leading: const Icon(Icons.language),
              title: const Text("English"),
              onTap: () {
                setState(() => selectedLanguage = "English");
                Navigator.pop(context);
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("Language changed to English")),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.language),
              title: const Text("ಕನ್ನಡ (Kannada)"),
              onTap: () {
                setState(() => selectedLanguage = "Kannada");
                Navigator.pop(context);
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("ಭಾಷೆ ಕನ್ನಡಕ್ಕೆ ಬದಲಾಯಿಸಲಾಗಿದೆ")),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class ModuleCard extends StatefulWidget {
  final String title;
  final IconData icon;
  final List<Color> gradient;
  final String selectedLanguage;

  const ModuleCard({
    required this.title,
    required this.icon,
    required this.gradient,
    required this.selectedLanguage,
  });

  @override
  State<ModuleCard> createState() => _ModuleCardState();
}

class _ModuleCardState extends State<ModuleCard>
    with SingleTickerProviderStateMixin {
  bool _isPressed = false;

  @override
  Widget build(BuildContext context) {
    return AnimatedScale(
      scale: _isPressed ? 0.95 : 1.0,
      duration: const Duration(milliseconds: 150),
      child: GestureDetector(
        onTapDown: (_) => setState(() => _isPressed = true),
        onTapUp: (_) => setState(() => _isPressed = false),
        onTapCancel: () => setState(() => _isPressed = false),
        onTap: () {
          if (widget.title == "Scholarships") {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ScholarshipPage()),
            );
          } else if (widget.title == "Our history") {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) =>
                    HistoryPage(language: widget.selectedLanguage),
              ),
            );
          } else if (widget.title == "Job Searching") {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => JobSeekerWizard()),
            );
          } else if (widget.title == "Hostel Details") {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const ExplorePage()),
            ); // ✅ Navigate to ExplorePage
          } else {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('Opening ${widget.title}...')),
            );
          }
        },
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: widget.gradient,
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(18),
            boxShadow: [
              BoxShadow(
                color: widget.gradient.last.withOpacity(0.4),
                blurRadius: 10,
                spreadRadius: 2,
                offset: const Offset(3, 5),
              ),
            ],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(widget.icon, size: 36, color: Colors.white),
              const SizedBox(height: 10),
              Text(
                widget.title,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  shadows: [
                    Shadow(
                      color: Colors.black26,
                      offset: Offset(1, 1),
                      blurRadius: 3,
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
-----------------------------*/
import 'package:flutter/material.dart';
import '../schemes/SchemesPage.dart';
import '../schemes/localization.dart';


class HomePage extends StatefulWidget {
  final String selectedLanguage;
  final Function(String) setLanguage;

  const HomePage({
    Key? key,
    required this.selectedLanguage,
    required this.setLanguage,
  }) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Map<String, dynamic>> modules = [
    {'title': 'Our history', 'icon': Icons.info_outline},
    {'title': 'Membership', 'icon': Icons.person_add},
    {'title': 'Job Searching', 'icon': Icons.work_outline},
    {'title': 'Scholarships', 'icon': Icons.school},
    {'title': 'Hostel Details', 'icon': Icons.house},
    {'title': 'Contact Us', 'icon': Icons.email},
    {'title': 'Notifications', 'icon': Icons.notifications},
    {'title': 'Health & Wellness', 'icon': Icons.health_and_safety},
    {'title': 'Schemes', 'icon': Icons.article},
    {'title': 'Community Initiatives', 'icon': Icons.groups},
  ];

  @override
  Widget build(BuildContext context) {
    String currentTitle = localizedStrings[widget.selectedLanguage]!['appTitle']!;

    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        title: Text(currentTitle),
        backgroundColor: Colors.deepPurple,
        actions: [
          IconButton(
            icon: const Icon(Icons.language),
            onPressed: () {
              _showLanguageSelector(context);
            },
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              // 🔹 Attractive Grid Options
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, // 2 per row
                    crossAxisSpacing: 14,
                    mainAxisSpacing: 14,
                    childAspectRatio: 1.2,
                  ),
                  itemCount: modules.length,
                  itemBuilder: (context, index) {
                    final colors = [
                      [Colors.blue.shade400, Colors.blue.shade700],
                      [Colors.teal.shade400, Colors.teal.shade700],
                      [Colors.deepPurple.shade400, Colors.deepPurple.shade700],
                      [Colors.green.shade400, Colors.green.shade700],
                      [Colors.orange.shade400, Colors.orange.shade700],
                    ];
                    final gradient = colors[index % colors.length];

                    return ModuleCard(
                      title: modules[index]['title'],
                      icon: modules[index]['icon'],
                      gradient: gradient,
                      selectedLanguage: widget.selectedLanguage,
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.deepPurple,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white60,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            label: 'Alerts',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            label: 'Profile',
          ),
        ],
      ),
    );
  }

  void _showLanguageSelector(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) => Container(
        padding: const EdgeInsets.all(16),
        child: Wrap(
          children: [
            ListTile(
              leading: const Icon(Icons.language),
              title: const Text("English"),
              onTap: () {
                widget.setLanguage("English");
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.language),
              title: const Text("ಕನ್ನಡ (Kannada)"),
              onTap: () {
                widget.setLanguage("Kannada");
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}

class ModuleCard extends StatefulWidget {
  final String title;
  final IconData icon;
  final List<Color> gradient;
  final String selectedLanguage;

  const ModuleCard({
    Key? key,
    required this.title,
    required this.icon,
    required this.gradient,
    required this.selectedLanguage,
  }) : super(key: key);

  @override
  State<ModuleCard> createState() => _ModuleCardState();
}

class _ModuleCardState extends State<ModuleCard>
    with SingleTickerProviderStateMixin {
  bool _isPressed = false;

  @override
  Widget build(BuildContext context) {
    return AnimatedScale(
      scale: _isPressed ? 0.95 : 1.0,
      duration: const Duration(milliseconds: 150),
      child: GestureDetector(
        onTapDown: (_) => setState(() => _isPressed = true),
        onTapUp: (_) => setState(() => _isPressed = false),
        onTapCancel: () => setState(() => _isPressed = false),
        onTap: () {
          if (widget.title == "Schemes") {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) =>
                    SchemesPage(selectedLanguage: widget.selectedLanguage),
              ),
            );
          } else {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('Opening ${widget.title}...')),
            );
          }
        },
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: widget.gradient,
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(18),
            boxShadow: [
              BoxShadow(
                color: widget.gradient.last.withOpacity(0.4),
                blurRadius: 10,
                spreadRadius: 2,
                offset: const Offset(3, 5),
              ),
            ],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(widget.icon, size: 36, color: Colors.white),
              const SizedBox(height: 10),
              Text(
                widget.title,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  shadows: [
                    Shadow(
                      color: Colors.black26,
                      offset: Offset(1, 1),
                      blurRadius: 3,
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

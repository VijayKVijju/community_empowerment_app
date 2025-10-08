/*--------------------------------------


import 'package:flutter/material.dart';
import '../Notification/Notification.dart';
import '../ProfilePage/ProfilePage.dart';
import '../community_initiatives/community_initiatives.dart';
import '../contact_us/contact_us.dart';
import '../health_wellness/health_wellness.dart';
import '../histroy/history_page.dart';
import '../hostels/explore_page.dart';
import '../membership/membership_page.dart';
import '../scholarships/scholarship.dart';
import '../schemes/SchemesPage.dart';
import '../schemes/localization.dart';

// ✅ Import new Job Searching module
import '../job_searching/job_seeker_wizard.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String selectedLanguage = "English";
  int currentIndex = 0;

  void setLanguage(String lang) {
    setState(() {
      selectedLanguage = lang;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Language changed to $lang"),
          duration: const Duration(milliseconds: 800),
        ),
      );
    });
  }

  final List<Map<String, dynamic>> modules = const [
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

  final List<String> mediaItems = const [
    "https://via.placeholder.com/400x200.png?text=Image+1",
    "https://via.placeholder.com/400x200.png?text=Image+2",
    "https://via.placeholder.com/400x200.png?text=Video+1",
  ];

  int mediaIndex = 0;

  void _nextMedia() {
    setState(() {
      mediaIndex = (mediaIndex + 1) % mediaItems.length;
    });
  }

  void _previousMedia() {
    setState(() {
      mediaIndex = (mediaIndex - 1 + mediaItems.length) % mediaItems.length;
    });
  }

  @override
  Widget build(BuildContext context) {
    String currentTitle =
        localizedStrings[selectedLanguage]?['appTitle'] ?? 'Community Empowerment';

    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        title: Text(currentTitle),
        backgroundColor: Colors.deepPurple,
        actions: [
          IconButton(
            icon: const Icon(Icons.language),
            onPressed: () => _showLanguageSelector(context),
          ),
        ],
      ),

      body: IndexedStack(
        index: currentIndex,
        children: const [
          HomeGridContent(),
          NotificationScreen(),
          ProfilePage(),
        ],
      ),

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        backgroundColor: Colors.deepPurple,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white60,
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.notifications), label: 'Alerts'),
          BottomNavigationBarItem(icon: Icon(Icons.account_circle), label: 'Profile'),
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
                setLanguage("English");
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.language),
              title: const Text("ಕನ್ನಡ (Kannada)"),
              onTap: () {
                setLanguage("Kannada");
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}

// -----------------------------------------------------------------------------
// Home Grid Content
// -----------------------------------------------------------------------------

class HomeGridContent extends StatelessWidget {
  const HomeGridContent({super.key});

  @override
  Widget build(BuildContext context) {
    final _HomePageState? homeState = context.findAncestorStateOfType<_HomePageState>();

    if (homeState == null) {
      return const Center(child: Text('Error: Home state not found.'));
    }

    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
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
                      homeState.mediaItems[homeState.mediaIndex],
                      fit: BoxFit.cover,
                      width: double.infinity,
                      errorBuilder: (context, error, stackTrace) =>
                      const Center(child: Icon(Icons.broken_image, color: Colors.grey)),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: IconButton(
                      icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
                      onPressed: homeState._previousMedia,
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: IconButton(
                      icon: const Icon(Icons.arrow_forward_ios, color: Colors.white),
                      onPressed: homeState._nextMedia,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 14,
                  mainAxisSpacing: 14,
                  childAspectRatio: 1.2,
                ),
                itemCount: homeState.modules.length,
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
                    title: homeState.modules[index]['title'] as String,
                    icon: homeState.modules[index]['icon'] as IconData,
                    gradient: gradient,
                    selectedLanguage: homeState.selectedLanguage,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// -----------------------------------------------------------------------------
// Module Card
// -----------------------------------------------------------------------------

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
    Key? key,
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
          Widget? destination;

          if (widget.title == "Scholarships") {
            destination = ScholarshipPage();
          } else if (widget.title == "Our history") {
            destination = HistoryPage(language: widget.selectedLanguage);
          } else if (widget.title == "Job Searching") {
            destination = const JobSeekerWizard(); // ✅ FIXED
          } else if (widget.title == "Notifications") {
            destination = const NotificationScreen();
          } else if (widget.title == "Hostel Details") {
            destination = const ExplorePage();
          } else if (widget.title == "Schemes") {
            destination = SchemesPage(selectedLanguage: widget.selectedLanguage);
          } else if (widget.title == "Membership") {
            destination = const MembershipPage();
          } else if (widget.title == "Health & Wellness") {
            destination = const HealthWellnessPage();
          } else if (widget.title == "Community Initiatives") {
            destination = CommunityInitiativesScreen(
                selectedLanguage: widget.selectedLanguage, setLanguage: (String ) {  },);
          } else if (widget.title == "Contact Us") {
            destination = const ContactUsPage();
          }

          if (destination != null) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => destination!),
            );
          } else {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('Opening ${widget.title} is not yet implemented.')),
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
------------------
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../translation/translation_service.dart';
import '../translation/language_provider.dart';
import '../translation/static_dictionary.dart';
import '../Notification/Notification.dart';
import '../ProfilePage/ProfilePage.dart';
import '../community_initiatives/community_initiatives.dart';
import '../contact_us/contact_us.dart';
import '../health_wellness/health_wellness.dart';
import '../histroy/history_page.dart';
import '../hostels/explore_page.dart';
import '../membership/membership_page.dart';
import '../scholarships/scholarship.dart';
import '../schemes/SchemesPage.dart';
import '../job_searching/job_seeker_wizard.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  int currentIndex = 0;
  int mediaIndex = 0;

  final List<Map<String, dynamic>> modules = const [
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

  final List<String> mediaItems = const [
    "https://via.placeholder.com/400x200.png?text=Image+1",
    "https://via.placeholder.com/400x200.png?text=Image+2",
    "https://via.placeholder.com/400x200.png?text=Video+1",
  ];

  void _nextMedia() {
    setState(() {
      mediaIndex = (mediaIndex + 1) % mediaItems.length;
    });
  }

  void _previousMedia() {
    setState(() {
      mediaIndex = (mediaIndex - 1 + mediaItems.length) % mediaItems.length;
    });
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
                ref.read(languageProvider.notifier).changeLanguage('en');
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.language),
              title: const Text("ಕನ್ನಡ (Kannada)"),
              onTap: () {
                ref.read(languageProvider.notifier).changeLanguage('kn');
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final selectedLanguage = ref.watch(languageProvider);
    final translatedTitle =
    StaticDictionary.translateOffline("Community Empowerment", selectedLanguage);

    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        title: Text(translatedTitle),
        backgroundColor: Colors.deepPurple,
        actions: [
          IconButton(
            icon: const Icon(Icons.language),
            onPressed: () => _showLanguageSelector(context),
          ),
        ],
      ),
      body: IndexedStack(
        index: currentIndex,
        children: [
          HomeGridContent(selectedLanguage: selectedLanguage, modules: modules, mediaItems: mediaItems, nextMedia: _nextMedia, previousMedia: _previousMedia),
          const NotificationScreen(),
          const ProfilePage(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        backgroundColor: Colors.deepPurple,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white60,
        onTap: (index) => setState(() => currentIndex = index),
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.notifications), label: 'Alerts'),
          BottomNavigationBarItem(icon: Icon(Icons.account_circle), label: 'Profile'),
        ],
      ),
    );
  }
}

// -----------------------------------------------------------------------------
// Home Grid Content
// -----------------------------------------------------------------------------
class HomeGridContent extends StatelessWidget {
  final String selectedLanguage;
  final List<Map<String, dynamic>> modules;
  final List<String> mediaItems;
  final VoidCallback nextMedia;
  final VoidCallback previousMedia;

  const HomeGridContent({
    required this.selectedLanguage,
    required this.modules,
    required this.mediaItems,
    required this.nextMedia,
    required this.previousMedia,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
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
                      mediaItems[0],
                      fit: BoxFit.cover,
                      width: double.infinity,
                      errorBuilder: (context, error, stackTrace) =>
                      const Center(child: Icon(Icons.broken_image, color: Colors.grey)),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: IconButton(
                      icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
                      onPressed: previousMedia,
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: IconButton(
                      icon: const Icon(Icons.arrow_forward_ios, color: Colors.white),
                      onPressed: nextMedia,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 14,
                  mainAxisSpacing: 14,
                  childAspectRatio: 1.2,
                ),
                itemCount: modules.length,
                itemBuilder: (context, index) {
                  final gradient = [
                    [Colors.blue.shade400, Colors.blue.shade700],
                    [Colors.teal.shade400, Colors.teal.shade700],
                    [Colors.deepPurple.shade400, Colors.deepPurple.shade700],
                    [Colors.green.shade400, Colors.green.shade700],
                    [Colors.orange.shade400, Colors.orange.shade700],
                  ][index % 5];

                  return ModuleCard(
                    title: modules[index]['title'] as String,
                    icon: modules[index]['icon'] as IconData,
                    gradient: gradient,
                    selectedLanguage: selectedLanguage,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// -----------------------------------------------------------------------------
// Module Card
// -----------------------------------------------------------------------------
class ModuleCard extends StatelessWidget {
  final String title;
  final IconData icon;
  final List<Color> gradient;
  final String selectedLanguage;

  const ModuleCard({
    required this.title,
    required this.icon,
    required this.gradient,
    required this.selectedLanguage,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final translatedTitle =
    StaticDictionary.translateOffline(title, selectedLanguage);

    return GestureDetector(
      onTap: () {
        Widget? destination;

        switch (title) {
          case "Scholarships":
            destination = ScholarshipPage();
            break;
          case "Our history":
            destination = HistoryPage(language: selectedLanguage);
            break;
          case "Job Searching":
            destination = const JobSeekerWizard();
            break;
          case "Notifications":
            destination = const NotificationScreen();
            break;
          case "Hostel Details":
            destination = const ExplorePage();
            break;
          case "Schemes":
            destination = SchemesPage(selectedLanguage: selectedLanguage);
            break;
          case "Membership":
            destination = const MembershipPage();
            break;
          case "Health & Wellness":
            destination = const HealthWellnessPage();
            break;
          case "Community Initiatives":
            destination = CommunityInitiativesScreen(
              selectedLanguage: selectedLanguage,
              setLanguage: (String _) {},
            );
            break;
          case "Contact Us":
            destination = const ContactUsPage();
            break;
        }

        if (destination != null) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => destination!),
          );
        }
      },
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: gradient,
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(18),
          boxShadow: [
            BoxShadow(
              color: gradient.last.withOpacity(0.4),
              blurRadius: 10,
              spreadRadius: 2,
              offset: const Offset(3, 5),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 36, color: Colors.white),
            const SizedBox(height: 10),
            Text(
              translatedTitle,
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
    );
  }
}
----------------*/
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import '../translation/language_provider.dart';
import '../translation/static_dictionary.dart';
import '../Notification/Notification.dart';
import '../ProfilePage/ProfilePage.dart';
import '../community_initiatives/community_initiatives.dart';
import '../contact_us/contact_us.dart';
import '../health_wellness/health_wellness.dart';
import '../histroy/history_page.dart';
import '../hostels/explore_page.dart';
import '../membership/membership_page.dart';
import '../scholarships/scholarship.dart';
import '../schemes/SchemesPage.dart';
import '../job_searching/job_seeker_wizard.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  int currentIndex = 0;
  int _currentMedia = 0;

  // 🔹 Mixed media items (local images + YouTube link)
  final List<String> mediaItems = const [
    "assets/images/guru.png",
    "assets/images/g.png",
    "https://www.youtube.com/watch?v=5PfuoPvFgTQ",
  ];

  late YoutubePlayerController _youtubeController;

  @override
  void initState() {
    super.initState();
    final videoId = YoutubePlayer.convertUrlToId(mediaItems[2]) ?? "";
    _youtubeController = YoutubePlayerController(
      initialVideoId: videoId,
      flags: const YoutubePlayerFlags(
        autoPlay: false,
        mute: false,
      ),
    );
  }

  @override
  void dispose() {
    _youtubeController.dispose();
    super.dispose();
  }

  void _nextMedia() {
    setState(() {
      _currentMedia = (_currentMedia + 1) % mediaItems.length;
    });
  }

  void _previousMedia() {
    setState(() {
      _currentMedia = (_currentMedia - 1 + mediaItems.length) % mediaItems.length;
    });
  }

  @override
  Widget build(BuildContext context) {
    final selectedLanguage = ref.watch(languageProvider);
    final translatedTitle =
    StaticDictionary.translateOffline("Community Empowerment", selectedLanguage);

    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        title: Text(translatedTitle),
        backgroundColor: Colors.deepPurple,
        actions: [
          IconButton(
            icon: const Icon(Icons.language),
            onPressed: () => _showLanguageSelector(context),
          ),
        ],
      ),
      body: IndexedStack(
        index: currentIndex,
        children: [
          _buildHomeContent(selectedLanguage),
          const NotificationScreen(),
          const ProfilePage(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        backgroundColor: Colors.deepPurple,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white60,
        onTap: (index) => setState(() => currentIndex = index),
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.notifications), label: 'Alerts'),
          BottomNavigationBarItem(icon: Icon(Icons.account_circle), label: 'Profile'),
        ],
      ),
    );
  }

  // 🔹 Language selector bottom sheet
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
                ref.read(languageProvider.notifier).changeLanguage('en');
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.language),
              title: const Text("ಕನ್ನಡ (Kannada)"),
              onTap: () {
                ref.read(languageProvider.notifier).changeLanguage('kn');
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }

  // ---------------------------------------------------------------------------
  // 🏠 Main Home Content
  // ---------------------------------------------------------------------------
  Widget _buildHomeContent(String selectedLanguage) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            // 🔹 Media Slider
            Stack(
              children: [
                CarouselSlider(
                  items: mediaItems.map((item) => _buildMediaItem(item)).toList(),
                  options: CarouselOptions(
                    height: 220,
                    autoPlay: false, // manual swipe only
                    enlargeCenterPage: true,
                    viewportFraction: 1,
                    enableInfiniteScroll: true,
                    onPageChanged: (index, reason) {
                      setState(() => _currentMedia = index);
                    },
                  ),
                ),
                // 🔹 Left arrow
                Positioned(
                  left: 10,
                  top: 85,
                  child: IconButton(
                    icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
                    onPressed: _previousMedia,
                  ),
                ),
                // 🔹 Right arrow
                Positioned(
                  right: 10,
                  top: 85,
                  child: IconButton(
                    icon: const Icon(Icons.arrow_forward_ios, color: Colors.white),
                    onPressed: _nextMedia,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 10),
            _buildGridModules(selectedLanguage),
          ],
        ),
      ),
    );
  }

  // ---------------------------------------------------------------------------
  // 🧩 Media Item Builder (handles both image & video)
  // ---------------------------------------------------------------------------
  Widget _buildMediaItem(String item) {
    if (item.contains("youtube.com") || item.contains("youtu.be")) {
      return ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: YoutubePlayer(
          controller: _youtubeController,
          showVideoProgressIndicator: true,
          progressIndicatorColor: Colors.deepPurple,
        ),
      );
    } else {
      return ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Image.asset(
          item,
          fit: BoxFit.cover,
          width: double.infinity,
          errorBuilder: (context, error, stackTrace) {
            return Container(
              color: Colors.grey.shade200,
              child: const Center(
                child: Icon(Icons.broken_image, color: Colors.grey, size: 50),
              ),
            );
          },
        ),
      );
    }
  }

  // ---------------------------------------------------------------------------
  // 🔹 Grid Menu for Modules
  // ---------------------------------------------------------------------------
  Widget _buildGridModules(String selectedLanguage) {
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

    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 14,
          mainAxisSpacing: 14,
          childAspectRatio: 1.2,
        ),
        itemCount: modules.length,
        itemBuilder: (context, index) {
          final gradient = [
            [Colors.blue.shade400, Colors.blue.shade700],
            [Colors.teal.shade400, Colors.teal.shade700],
            [Colors.deepPurple.shade400, Colors.deepPurple.shade700],
            [Colors.green.shade400, Colors.green.shade700],
            [Colors.orange.shade400, Colors.orange.shade700],
          ][index % 5];

          return _buildModuleCard(
            title: modules[index]['title'] as String,
            icon: modules[index]['icon'] as IconData,
            gradient: gradient,
            selectedLanguage: selectedLanguage,
          );
        },
      ),
    );
  }

  // ---------------------------------------------------------------------------
  // 🔹 Individual Module Card
  // ---------------------------------------------------------------------------
  Widget _buildModuleCard({
    required String title,
    required IconData icon,
    required List<Color> gradient,
    required String selectedLanguage,
  }) {
    final translatedTitle = StaticDictionary.translateOffline(title, selectedLanguage);

    return GestureDetector(
      onTap: () {
        Widget? destination;

        switch (title) {
          case "Scholarships":
            destination = ScholarshipPage();
            break;
          case "Our history":
            destination = HistoryPage(language: selectedLanguage);
            break;
          case "Job Searching":
            destination = const JobSeekerWizard();
            break;
          case "Notifications":
            destination = const NotificationScreen();
            break;
          case "Hostel Details":
            destination = const ExplorePage();
            break;
          case "Schemes":
            destination = SchemesPage(selectedLanguage: selectedLanguage);
            break;
          case "Membership":
            destination = const MembershipPage();
            break;
          case "Health & Wellness":
            destination = const HealthWellnessPage();
            break;
          case "Community Initiatives":
            destination = CommunityInitiativesScreen(
              selectedLanguage: selectedLanguage,
              setLanguage: (String _) {},
            );
            break;
          case "Contact Us":
            destination = const ContactUsPage();
            break;
        }

        if (destination != null) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => destination!),
          );
        }
      },
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: gradient,
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(18),
          boxShadow: [
            BoxShadow(
              color: gradient.last.withOpacity(0.4),
              blurRadius: 10,
              spreadRadius: 2,
              offset: const Offset(3, 5),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 36, color: Colors.white),
            const SizedBox(height: 10),
            Text(
              translatedTitle,
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
    );
  }
}

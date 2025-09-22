import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class HostelDetailPage extends StatefulWidget {
  final Map<String, dynamic> hostel;
  const HostelDetailPage({super.key, required this.hostel});

  @override
  State<HostelDetailPage> createState() => _HostelDetailPageState();
}

class _HostelDetailPageState extends State<HostelDetailPage> {
  int currentMediaIndex = 0;

  // Opens Google Maps for the given coordinates
  Future<void> _openMaps(double lat, double lng) async {
    final url = Uri.parse('https://www.google.com/maps/search/?api=1&query=$lat,$lng');
    if (await canLaunchUrl(url)) {
      await launchUrl(url, mode: LaunchMode.externalApplication);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Could not open Maps.')),
      );
    }
  }

  // Opens videos / external links
  Future<void> _openMedia(String urlStr) async {
    final url = Uri.parse(urlStr);
    if (await canLaunchUrl(url)) {
      await launchUrl(url, mode: LaunchMode.externalApplication);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Cannot open media.')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final hostel = widget.hostel;
    final List<dynamic> images = hostel['images'] ?? [];
    final List<dynamic> media = hostel['media'] ?? [];
    final lat = (hostel['lat'] ?? 0.0) as double;
    final lng = (hostel['lng'] ?? 0.0) as double;

    final mediaItems = [...images, ...media];

    return Scaffold(
      appBar: AppBar(
        title: Text(hostel['name']),
        backgroundColor: Colors.deepPurple,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          // 🔹 Media carousel
          SizedBox(
            height: 220,
            child: PageView.builder(
              itemCount: mediaItems.isEmpty ? 1 : mediaItems.length,
              onPageChanged: (i) => setState(() => currentMediaIndex = i),
              itemBuilder: (context, i) {
                if (mediaItems.isEmpty) {
                  return Container(
                    decoration: BoxDecoration(
                      color: Colors.grey.shade200,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Center(child: Text('No images available')),
                  );
                }
                final src = mediaItems[i] as String;
                final isVideo = src.toLowerCase().contains('.mp4') || (src.startsWith('http') && src.contains('youtube'));

                return Stack(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.network(
                        src,
                        width: double.infinity,
                        height: double.infinity,
                        fit: BoxFit.cover,
                        errorBuilder: (_, __, ___) => Container(
                          color: Colors.grey.shade300,
                          child: const Center(child: Icon(Icons.broken_image)),
                        ),
                      ),
                    ),
                    if (isVideo)
                      Center(
                        child: GestureDetector(
                          onTap: () => _openMedia(src),
                          child: Container(
                            padding: const EdgeInsets.all(10),
                            decoration: const BoxDecoration(
                              color: Colors.black38,
                              shape: BoxShape.circle,
                            ),
                            child: const Icon(Icons.play_arrow, size: 44, color: Colors.white),
                          ),
                        ),
                      ),
                  ],
                );
              },
            ),
          ),
          const SizedBox(height: 12),

          // 🔹 Dots indicator
          if (mediaItems.isNotEmpty)
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(mediaItems.length, (i) {
                return AnimatedContainer(
                  duration: const Duration(milliseconds: 200),
                  margin: const EdgeInsets.symmetric(horizontal: 4),
                  width: currentMediaIndex == i ? 18 : 8,
                  height: 8,
                  decoration: BoxDecoration(
                    color: currentMediaIndex == i ? Colors.deepPurple : Colors.grey.shade300,
                    borderRadius: BorderRadius.circular(8),
                  ),
                );
              }),
            ),

          const SizedBox(height: 16),

          // 🔹 Availability & Fees
          Row(
            children: [
              Expanded(
                child: Card(
                  child: Padding(
                    padding: const EdgeInsets.all(12),
                    child: Column(
                      children: [
                        const Icon(Icons.chair),
                        const SizedBox(height: 6),
                        Text('${hostel['availability']} seats',
                            style: const TextStyle(fontWeight: FontWeight.bold)),
                        const SizedBox(height: 4),
                        const Text('Availability'),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Card(
                  child: Padding(
                    padding: const EdgeInsets.all(12),
                    child: Column(
                      children: [
                        const Icon(Icons.attach_money),
                        const SizedBox(height: 6),
                        Text(hostel['fees'].toString(),
                            style: const TextStyle(fontWeight: FontWeight.bold)),
                        const SizedBox(height: 4),
                        const Text('Fees'),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(height: 12),

          // 🔹 Contact & Address
          Card(
            child: Padding(
              padding: const EdgeInsets.all(14),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Contact', style: TextStyle(fontWeight: FontWeight.bold)),
                  const SizedBox(height: 6),
                  Text(hostel['contact'] ?? 'N/A'),
                  const Divider(),
                  const Text('Address', style: TextStyle(fontWeight: FontWeight.bold)),
                  const SizedBox(height: 6),
                  Text(hostel['address'] ?? 'N/A'),
                ],
              ),
            ),
          ),

          const SizedBox(height: 12),

          // 🔹 Rules
          Card(
            child: Padding(
              padding: const EdgeInsets.all(14),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Rules & Sharing', style: TextStyle(fontWeight: FontWeight.bold)),
                  const SizedBox(height: 6),
                  Text(hostel['rules'] ?? 'N/A'),
                ],
              ),
            ),
          ),

          const SizedBox(height: 12),

          // 🔹 Map Preview
          Card(
            elevation: 2,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            child: InkWell(
              onTap: () {
                if (lat != 0.0 && lng != 0.0) _openMaps(lat, lng);
              },
              child: SizedBox(
                height: 140,
                child: Stack(
                  children: [
                    Positioned.fill(
                      child: Image.network(
                        'https://via.placeholder.com/800x400.png?text=Map+Preview',
                        fit: BoxFit.cover,
                        errorBuilder: (_, __, ___) =>
                            Container(color: Colors.grey.shade300),
                      ),
                    ),
                    Positioned(
                      left: 12,
                      top: 12,
                      child: Container(
                        padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 10),
                        decoration: BoxDecoration(
                          color: Colors.black45,
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: const Text('View on Map', style: TextStyle(color: Colors.white)),
                      ),
                    ),
                    if (lat != 0.0 && lng != 0.0)
                      Positioned(
                        right: 12,
                        bottom: 12,
                        child: ElevatedButton(
                          onPressed: () => _openMaps(lat, lng),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.deepPurple,
                          ),
                          child: const Text('Open in Google Maps'),
                        ),
                      ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

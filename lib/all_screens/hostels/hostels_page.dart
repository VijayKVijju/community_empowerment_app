import 'package:flutter/material.dart';
import 'hostel_detail_page.dart';

// A full list of Karnataka districts (strings) - you can shorten/modify later.
const List<String> karnatakaDistricts = [
  "Bagalkot","Bangalore Rural","Bangalore Urban","Belagavi","Ballari","Bidar",
  "Vijayapura","Yadgir","Yemlur","Chamarajanagar","Chikballapur","Chikkamagaluru",
  "Chitradurga","Dakshina Kannada","Davangere","Dharwad","Gadag","Hassan","Haveri",
  "Kalaburagi","Kodagu","Kolar","Koppal","Mandya","Mysuru","Raichur","Ramanagara",
  "Shivamogga","Tumakuru","Udupi","Uttara Kannada","Vijayapura","Vijayanagara"
];

// Sample hostels per district. Replace with your real data later.
final Map<String, List<Map<String, dynamic>>> sampleHostels = {
  "Bangalore Urban": [
    {
      "name": "Bogadi Girls Hostel",
      "type": "Girls",
      "images": [
        "https://via.placeholder.com/800x500.png?text=Bogadi+1",
        "https://via.placeholder.com/800x500.png?text=Bogadi+2"
      ],
      "media": [], // can include video urls
      "availability": 12,
      "contact": "Smt. Kavya - +91 98XXXXXXX",
      "address": "Bogadi Road, Bangalore",
      "fees": "1500/month",
      "rules": "No smoking. Quiet hours after 10pm.",
      "lat": 12.953847, "lng": 77.35002
    },
    {
      "name": "Boys Hostel - VV Puram",
      "type": "Boys",
      "images": [
        "https://via.placeholder.com/800x500.png?text=VV+Puram+1",
        "https://via.placeholder.com/800x500.png?text=VV+Puram+2"
      ],
      "media": [],
      "availability": 8,
      "contact": "Mr. Raj - +91 97XXXXXXX",
      "address": "VV Puram, Bangalore",
      "fees": "1200/month",
      "rules": "ID card required. Visitor log maintained.",
      "lat": 12.975, "lng": 77.5895
    },
    {
      "name": "VV Puram Girls Hostel",
      "type": "Girls",
      "images": [
        "https://via.placeholder.com/800x500.png?text=VV+Puram+Girls+1"
      ],
      "media": [],
      "availability": 5,
      "contact": "Smt. Latha - +91 98XXXXXXX",
      "address": "VV Puram, Bangalore",
      "fees": "1400/month",
      "rules": "No outside guests after 9pm.",
      "lat": 12.9752, "lng": 77.5898
    },
  ],
  "Mysuru": [
    {
      "name": "Mysore Boys Hostel",
      "type": "Boys",
      "images": ["https://via.placeholder.com/800x500.png?text=Mysore+Boys+1"],
      "media": [],
      "availability": 10,
      "contact": "Mr. Bala - +91 98XXXXXXX",
      "address": "Near Mysore Palace",
      "fees": "1000/month",
      "rules": "Discipline & attendance required.",
      "lat": 12.2958, "lng": 76.6394
    },
    {
      "name": "Mysore Girls Hostel",
      "type": "Girls",
      "images": ["https://via.placeholder.com/800x500.png?text=Mysore+Girls+1"],
      "media": [],
      "availability": 6,
      "contact": "Smt. Meena - +91 98XXXXXXX",
      "address": "Near Nazarbad, Mysore",
      "fees": "1300/month",
      "rules": "Hostel curfew at 10:30pm.",
      "lat": 12.3072, "lng": 76.6497
    },
  ],
};

class HostelsPage extends StatefulWidget {
  const HostelsPage({super.key});

  @override
  State<HostelsPage> createState() => _HostelsPageState();
}

class _HostelsPageState extends State<HostelsPage> {
  String? selectedDistrict;
  List<Map<String, dynamic>> shownHostels = [];

  void _onSubmit() {
    if (selectedDistrict == null) return;
    final list = sampleHostels[selectedDistrict] ?? [];
    setState(() => shownHostels = list);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Hostels'),
        backgroundColor: Colors.deepPurple,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Title & instruction
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: const [
                Icon(Icons.house, color: Colors.deepPurple),
                SizedBox(width: 8),
                Text(
                  "Hostel details",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const SizedBox(height: 12),

            // District dropdown (mandatory)
            DropdownButtonFormField<String>(
              value: selectedDistrict,
              items: karnatakaDistricts
                  .map((d) => DropdownMenuItem(value: d, child: Text(d)))
                  .toList(),
              decoration: InputDecoration(
                labelText: "Select district (mandatory)",
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
              ),
              onChanged: (val) {
                setState(() => selectedDistrict = val);
              },
            ),
            const SizedBox(height: 12),

            // Submit button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: selectedDistrict == null ? null : _onSubmit,
                style: ElevatedButton.styleFrom(backgroundColor: Colors.deepPurple),
                child: const Text('Submit'),
              ),
            ),

            const SizedBox(height: 16),

            // Hostels list area
            Expanded(
              child: shownHostels.isEmpty
                  ? Center(
                child: Text(
                  selectedDistrict == null
                      ? 'Please select a district and submit to see hostels.'
                      : 'No hostels found for $selectedDistrict.',
                  textAlign: TextAlign.center,
                ),
              )
                  : ListView.separated(
                itemCount: shownHostels.length,
                separatorBuilder: (_, __) => const SizedBox(height: 12),
                itemBuilder: (context, idx) {
                  final hostel = shownHostels[idx];
                  return Card(
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                    elevation: 3,
                    child: ListTile(
                      contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                      leading: ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.network(
                          (hostel['images'] as List).isNotEmpty ? hostel['images'][0] : 'https://via.placeholder.com/120',
                          width: 90,
                          height: 70,
                          fit: BoxFit.cover,
                        ),
                      ),
                      title: Text(hostel['name']),
                      subtitle: Text('${hostel['type']} • ${hostel['fees']}'),
                      trailing: ElevatedButton(
                        onPressed: () {
                          // navigate to detail page
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => HostelDetailPage(hostel: hostel),
                            ),
                          );
                        },
                        child: const Text('Click'),
                      ),
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}

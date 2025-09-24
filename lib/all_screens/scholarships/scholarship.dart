/*--------------------------------------

import 'package:flutter/material.dart';

class ScholarshipPage extends StatelessWidget {
  final List<Map<String, dynamic>> scholarships = [
    {
      'name': 'Global Ambassador Scholarship',
      'amount': '₹ 1,50,000',
      'deadline': 'Nov 30, 2025',
      'details': 'Details coming soon'
    },
    {
      'name': 'Merit Excellence Scholarship',
      'amount': '₹ 80,000',
      'deadline': 'Dec 15, 2025',
      'details': 'Details coming soon'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Color(0xFF5F259F), // PhonePe Purple
        title: Text(
          'Scholarship Opportunities',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            // 🔎 Search Bar
            TextField(
              decoration: InputDecoration(
                hintText: 'Search by keyword',
                prefixIcon: Icon(Icons.search, color: Color(0xFF5F259F)),
                filled: true,
                fillColor: Colors.grey.shade100,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
            SizedBox(height: 10),

            // 🔽 New Horizontal Dropdowns
            Row(
              children: [
                Expanded(
                  child: DropdownButtonFormField<String>(
                    decoration: InputDecoration(
                      labelText: "Type",
                      contentPadding: EdgeInsets.symmetric(horizontal: 12),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    value: 'Government',
                    items: ['Government', 'Non-Government']
                        .map((e) => DropdownMenuItem(value: e, child: Text(e)))
                        .toList(),
                    onChanged: (val) {},
                  ),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: DropdownButtonFormField<String>(
                    decoration: InputDecoration(
                      labelText: "Specific Field",
                      contentPadding: EdgeInsets.symmetric(horizontal: 12),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    value: 'All',
                    items: ['Sports', 'Merit-based', 'Agriculture', 'All']
                        .map((e) => DropdownMenuItem(value: e, child: Text(e)))
                        .toList(),
                    onChanged: (val) {},
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),

            // 🔽 Old Dropdowns (All Types + Education)
            Row(
              children: [
                Expanded(
                  child: DropdownButtonFormField<String>(
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.symmetric(horizontal: 12),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    value: 'All types',
                    items: ['All types', 'National', 'International']
                        .map((e) => DropdownMenuItem(value: e, child: Text(e)))
                        .toList(),
                    onChanged: (val) {},
                  ),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: DropdownButtonFormField<String>(
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.symmetric(horizontal: 12),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    // ✅ "Education" is now included in items
                    value: 'Education',
                    items: ['Education', 'SSLC', 'PUC', 'Diploma', 'Graduate', 'Post Graduate', 'Phd']
                        .map((e) => DropdownMenuItem(value: e, child: Text(e)))
                        .toList(),
                    onChanged: (val) {},
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),

            // 🔽 Gender Dropdown
            DropdownButtonFormField<String>(
              decoration: InputDecoration(
                contentPadding: EdgeInsets.symmetric(horizontal: 12),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              value: 'Gender',
              items: ['Gender', 'Male', 'Female', 'Other']
                  .map((e) => DropdownMenuItem(value: e, child: Text(e)))
                  .toList(),
              onChanged: (val) {},
            ),
            SizedBox(height: 15),

            // 📜 Scholarship List
            Expanded(
              child: ListView.builder(
                itemCount: scholarships.length,
                itemBuilder: (context, index) {
                  final item = scholarships[index];
                  return Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    color: Colors.white,
                    elevation: 4,
                    margin: EdgeInsets.symmetric(vertical: 8),
                    child: Padding(
                      padding: const EdgeInsets.all(14.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(item['name'],
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFF5F259F))),
                          SizedBox(height: 6),
                          Row(
                            children: [
                              Icon(Icons.currency_rupee, size: 18, color: Colors.green),
                              SizedBox(width: 4),
                              Text(item['amount'],
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.black87)),
                            ],
                          ),
                          SizedBox(height: 6),
                          Row(
                            children: [
                              Icon(Icons.calendar_today, size: 16, color: Colors.redAccent),
                              SizedBox(width: 4),
                              Text('Deadline: ${item['deadline']}'),
                            ],
                          ),
                          SizedBox(height: 6),
                          Text(item['details']),
                          SizedBox(height: 10),
                          Align(
                            alignment: Alignment.centerRight,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Color(0xFF5F259F),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                              ),
                              onPressed: () {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(content: Text('Applied for ${item['name']}')),
                                );
                              },
                              child: Text(
                                'Apply Now',
                                style: TextStyle(color: Colors.white), // ✅ White text
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),

            // ⏩ Pagination
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(onPressed: () {}, child: Text("Previous")),
                Text("Page 1 of 2"),
                TextButton(onPressed: () {}, child: Text("Next")),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
----------------------------------
import 'package:flutter/material.dart';
import 'package:home1/all_screens/scholarship_apply.dart';


class ScholarshipPage extends StatelessWidget {
  final List<Map<String, dynamic>> scholarships = [
    {
      'name': 'Global Ambassador Scholarship',
      'amount': '₹ 1,50,000',
      'deadline': 'Nov 30, 2025',
      'eligibility': 'Open for all UG students',
      'startDate': 'Oct 1, 2025',
      'documents': ['ID Proof', 'Marksheet', 'Recommendation Letter'],
      'howToApply': 'Visit official portal and submit the form',
      'details': 'International scholarship for bright minds',
    },
    {
      'name': 'Merit Excellence Scholarship',
      'amount': '₹ 80,000',
      'deadline': 'Dec 15, 2025',
      'eligibility': 'Students with >85% marks',
      'startDate': 'Oct 15, 2025',
      'documents': ['Aadhar Card', '10th Marksheet'],
      'howToApply': 'Apply via University portal',
      'details': 'For students excelling in academics',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Color(0xFF5F259F), // PhonePe Purple
        title: Text(
          'Scholarship Opportunities',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            // 🔎 Search Bar
            TextField(
              decoration: InputDecoration(
                hintText: 'Search by keyword',
                prefixIcon: Icon(Icons.search, color: Color(0xFF5F259F)),
                filled: true,
                fillColor: Colors.grey.shade100,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
            SizedBox(height: 10),

            // 🔽 Filters (shortened for clarity)
            Row(
              children: [
                Expanded(
                  child: DropdownButtonFormField<String>(
                    value: 'Government',
                    items: ['Government', 'Non-Government']
                        .map((e) => DropdownMenuItem(value: e, child: Text(e)))
                        .toList(),
                    onChanged: (val) {},
                    decoration: InputDecoration(
                      labelText: "Type",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: DropdownButtonFormField<String>(
                    value: 'All',
                    items: ['Sports', 'Merit-based', 'Agriculture', 'All']
                        .map((e) => DropdownMenuItem(value: e, child: Text(e)))
                        .toList(),
                    onChanged: (val) {},
                    decoration: InputDecoration(
                      labelText: "Specific Field",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),

            // 📜 Scholarship List
            Expanded(
              child: ListView.builder(
                itemCount: scholarships.length,
                itemBuilder: (context, index) {
                  final item = scholarships[index];
                  return Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    color: Colors.white,
                    elevation: 4,
                    margin: EdgeInsets.symmetric(vertical: 8),
                    child: Padding(
                      padding: const EdgeInsets.all(14.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(item['name'],
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFF5F259F))),
                          SizedBox(height: 6),
                          Row(
                            children: [
                              Icon(Icons.currency_rupee, size: 18, color: Colors.green),
                              SizedBox(width: 4),
                              Text(item['amount'],
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.black87)),
                            ],
                          ),
                          SizedBox(height: 6),
                          Row(
                            children: [
                              Icon(Icons.calendar_today, size: 16, color: Colors.redAccent),
                              SizedBox(width: 4),
                              Text('Deadline: ${item['deadline']}'),
                            ],
                          ),
                          SizedBox(height: 10),
                          Align(
                            alignment: Alignment.centerRight,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Color(0xFF5F259F),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                              ),
                              onPressed: () {
                                // ✅ Navigate to ScholarshipApplyPage
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (_) => ScholarshipApplyPage(
                                      scholarshipName: item['name'],
                                      eligibility: item['eligibility'],
                                      startDate: item['startDate'],
                                      endDate: item['deadline'],
                                      documents: List<String>.from(item['documents']),
                                      howToApply: item['howToApply'],
                                    ),
                                  ),
                                );
                              },
                              child: Text(
                                'Apply Now',
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),

            // ⏩ Pagination
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(onPressed: () {}, child: Text("Previous")),
                Text("Page 1 of 2"),
                TextButton(onPressed: () {}, child: Text("Next")),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
------------------------------------
import 'package:flutter/material.dart';
import 'package:home1/all_screens/scholarship_apply.dart'; // ✅ import details page

class ScholarshipPage extends StatelessWidget {
  final List<Map<String, dynamic>> scholarships = [
    {
      'name': 'Global Ambassador Scholarship',
      'amount': '₹ 1,50,000',
      'deadline': 'Nov 30, 2025',
      'eligibility': 'Open for all UG students',
      'startDate': 'Oct 1, 2025',
      'documents': ['ID Proof', 'Marksheet', 'Recommendation Letter'],
      'howToApply': 'Visit official portal and submit the form',
      'details': 'International scholarship for bright minds',
    },
    {
      'name': 'Merit Excellence Scholarship',
      'amount': '₹ 80,000',
      'deadline': 'Dec 15, 2025',
      'eligibility': 'Students with >85% marks',
      'startDate': 'Oct 15, 2025',
      'documents': ['Aadhar Card', '10th Marksheet'],
      'howToApply': 'Apply via University portal',
      'details': 'For students excelling in academics',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: const Color(0xFF5F259F),
        title: const Text(
          'Scholarship Opportunities',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            // 🔎 Search Bar
            TextField(
              decoration: InputDecoration(
                hintText: 'Search by keyword',
                prefixIcon: const Icon(Icons.search, color: Color(0xFF5F259F)),
                filled: true,
                fillColor: Colors.grey.shade100,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
            const SizedBox(height: 10),

            // 🔽 New Horizontal Dropdowns
            Row(
              children: [
                Expanded(
                  child: DropdownButtonFormField<String>(
                    value: 'Government',
                    items: ['Government', 'Non-Government']
                        .map((e) =>
                        DropdownMenuItem(value: e, child: Text(e)))
                        .toList(),
                    onChanged: (val) {},
                    decoration: InputDecoration(
                      labelText: "Type",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: DropdownButtonFormField<String>(
                    value: 'All',
                    items: ['Sports', 'Merit-based', 'Agriculture', 'All']
                        .map((e) =>
                        DropdownMenuItem(value: e, child: Text(e)))
                        .toList(),
                    onChanged: (val) {},
                    decoration: InputDecoration(
                      labelText: "Specific Field",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),

            // 🔽 Old Dropdowns
            Row(
              children: [
                Expanded(
                  child: DropdownButtonFormField<String>(
                    value: 'All types',
                    items: ['All types', 'National', 'International']
                        .map((e) =>
                        DropdownMenuItem(value: e, child: Text(e)))
                        .toList(),
                    onChanged: (val) {},
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: DropdownButtonFormField<String>(
                    value: 'Education',
                    items: [
                      'Education',
                      'SSLC',
                      'PUC',
                      'Diploma',
                      'Graduate',
                      'Post Graduate',
                      'Phd'
                    ]
                        .map((e) =>
                        DropdownMenuItem(value: e, child: Text(e)))
                        .toList(),
                    onChanged: (val) {},
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),

            // 🔽 Gender Dropdown
            DropdownButtonFormField<String>(
              value: 'Gender',
              items: ['Gender', 'Male', 'Female', 'Other']
                  .map((e) => DropdownMenuItem(value: e, child: Text(e)))
                  .toList(),
              onChanged: (val) {},
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            const SizedBox(height: 15),

            // 📜 Scholarship List
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: scholarships.length,
              itemBuilder: (context, index) {
                final item = scholarships[index];
                return Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  color: Colors.white,
                  elevation: 4,
                  margin: const EdgeInsets.symmetric(vertical: 8),
                  child: Padding(
                    padding: const EdgeInsets.all(14.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(item['name'],
                            style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF5F259F))),
                        const SizedBox(height: 6),
                        Row(
                          children: [
                            const Icon(Icons.currency_rupee,
                                size: 18, color: Colors.green),
                            const SizedBox(width: 4),
                            Text(item['amount'],
                                style: const TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.black87)),
                          ],
                        ),
                        const SizedBox(height: 6),
                        Row(
                          children: [
                            const Icon(Icons.calendar_today,
                                size: 16, color: Colors.redAccent),
                            const SizedBox(width: 4),
                            Text('Deadline: ${item['deadline']}'),
                          ],
                        ),
                        const SizedBox(height: 6),
                        Text(item['details']),
                        const SizedBox(height: 10),
                        Align(
                          alignment: Alignment.centerRight,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFF5F259F),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                            onPressed: () {
                              // ✅ Navigate to details page
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (_) => ScholarshipApplyPage(
                                    scholarshipName: item['name'],
                                    eligibility: item['eligibility'] ?? "Not specified",
                                    startDate: item['startDate'] ?? "Not specified",
                                    endDate: item['deadline'],
                                    documents: List<String>.from(
                                        item['documents'] ?? []),
                                    howToApply: item['howToApply'] ??
                                        "Check official portal",
                                  ),
                                ),
                              );
                            },
                            child: const Text(
                              'Apply Now',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),

            const SizedBox(height: 10),
            // ⏩ Pagination
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(onPressed: () {}, child: const Text("Previous")),
                const Text("Page 1 of 2"),
                TextButton(onPressed: () {}, child: const Text("Next")),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
------------------------------------------------------------------
import 'package:flutter/material.dart';
import 'package:home1/all_screens/scholarship_apply.dart'; // ✅ import details page

class ScholarshipPage extends StatefulWidget {
  @override
  State<ScholarshipPage> createState() => _ScholarshipPageState();
}

class _ScholarshipPageState extends State<ScholarshipPage> {
  final List<Map<String, dynamic>> scholarships = [
    {
      'name': 'Global Ambassador Scholarship',
      'amount': '₹ 1,50,000',
      'deadline': 'Nov 30, 2025',
      'eligibility': 'Open for all UG students',
      'startDate': 'Oct 1, 2025',
      'documents': ['ID Proof', 'Marksheet', 'Recommendation Letter'],
      'howToApply': 'Visit official portal and submit the form',
      'details': 'International scholarship for bright minds',
    },
    {
      'name': 'Merit Excellence Scholarship',
      'amount': '₹ 80,000',
      'deadline': 'Dec 15, 2025',
      'eligibility': 'Students with >85% marks',
      'startDate': 'Oct 15, 2025',
      'documents': ['Aadhar Card', '10th Marksheet'],
      'howToApply': 'Apply via University portal',
      'details': 'For students excelling in academics',
    },
  ];

  /// Track which scholarships are "reminded"
  final Set<int> remindedSet = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: const Color(0xFF5F259F),
        title: const Text(
          'Scholarship Opportunities',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            // 🔎 Search Bar
            TextField(
              decoration: InputDecoration(
                hintText: 'Search by keyword',
                prefixIcon: const Icon(Icons.search, color: Color(0xFF5F259F)),
                filled: true,
                fillColor: Colors.grey.shade100,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
            const SizedBox(height: 10),

            // 🔽 New Horizontal Dropdowns
            Row(
              children: [
                Expanded(
                  child: DropdownButtonFormField<String>(
                    value: 'Government',
                    items: ['Government', 'Non-Government']
                        .map((e) =>
                        DropdownMenuItem(value: e, child: Text(e)))
                        .toList(),
                    onChanged: (val) {},
                    decoration: InputDecoration(
                      labelText: "Type",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: DropdownButtonFormField<String>(
                    value: 'All',
                    items: ['Sports', 'Merit-based', 'Agriculture', 'All']
                        .map((e) =>
                        DropdownMenuItem(value: e, child: Text(e)))
                        .toList(),
                    onChanged: (val) {},
                    decoration: InputDecoration(
                      labelText: "Specific Field",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),

            // 🔽 Old Dropdowns
            Row(
              children: [
                Expanded(
                  child: DropdownButtonFormField<String>(
                    value: 'All types',
                    items: ['All types', 'National', 'International']
                        .map((e) =>
                        DropdownMenuItem(value: e, child: Text(e)))
                        .toList(),
                    onChanged: (val) {},
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: DropdownButtonFormField<String>(
                    value: 'Education',
                    items: [
                      'Education',
                      'SSLC',
                      'PUC',
                      'Diploma',
                      'Graduate',
                      'Post Graduate',
                      'Phd'
                    ]
                        .map((e) =>
                        DropdownMenuItem(value: e, child: Text(e)))
                        .toList(),
                    onChanged: (val) {},
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),

            // 🔽 Gender Dropdown
            DropdownButtonFormField<String>(
              value: 'Gender',
              items: ['Gender', 'Male', 'Female', 'Other']
                  .map((e) => DropdownMenuItem(value: e, child: Text(e)))
                  .toList(),
              onChanged: (val) {},
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            const SizedBox(height: 15),

            // 📜 Scholarship List
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: scholarships.length,
              itemBuilder: (context, index) {
                final item = scholarships[index];
                final isReminded = remindedSet.contains(index);

                return Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  color: Colors.white,
                  elevation: 4,
                  margin: const EdgeInsets.symmetric(vertical: 8),
                  child: Padding(
                    padding: const EdgeInsets.all(14.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(item['name'],
                            style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF5F259F))),
                        const SizedBox(height: 6),
                        Row(
                          children: [
                            const Icon(Icons.currency_rupee,
                                size: 18, color: Colors.green),
                            const SizedBox(width: 4),
                            Text(item['amount'],
                                style: const TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.black87)),
                          ],
                        ),
                        const SizedBox(height: 6),
                        Row(
                          children: [
                            const Icon(Icons.calendar_today,
                                size: 16, color: Colors.redAccent),
                            const SizedBox(width: 4),
                            Text('Deadline: ${item['deadline']}'),
                          ],
                        ),
                        const SizedBox(height: 6),
                        Text(item['details']),
                        const SizedBox(height: 10),

                        // ✅ Remind Me + Explore Buttons
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            // Remind Me Button
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: isReminded
                                    ? Colors.orange // after click
                                    : Colors.grey.shade400, // default
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                              ),
                              onPressed: () {
                                setState(() {
                                  if (isReminded) {
                                    remindedSet.remove(index);
                                  } else {
                                    remindedSet.add(index);
                                  }
                                });
                              },
                              child: Text(
                                isReminded ? 'Reminded' : 'Remind Me',
                                style: const TextStyle(color: Colors.white),
                              ),
                            ),

                            // Explore Button
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color(0xFF5F259F),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                              ),
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (_) => ScholarshipApplyPage(
                                      scholarshipName: item['name'],
                                      eligibility:
                                      item['eligibility'] ?? "Not specified",
                                      startDate:
                                      item['startDate'] ?? "Not specified",
                                      endDate: item['deadline'],
                                      documents: List<String>.from(
                                          item['documents'] ?? []),
                                      howToApply: item['howToApply'] ??
                                          "Check official portal",
                                    ),
                                  ),
                                );
                              },
                              child: const Text(
                                'Explore',
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),

            const SizedBox(height: 10),
            // ⏩ Pagination
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(onPressed: () {}, child: const Text("Previous")),
                const Text("Page 1 of 2"),
                TextButton(onPressed: () {}, child: const Text("Next")),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
*/
import 'package:flutter/material.dart';
import 'package:home1/all_screens/scholarships/scholarship_apply.dart'; // ✅ import details page

class ScholarshipPage extends StatefulWidget {
  @override
  State<ScholarshipPage> createState() => _ScholarshipPageState();
}

class _ScholarshipPageState extends State<ScholarshipPage> {
  final List<Map<String, dynamic>> scholarships = [
    {
      'name': 'Global Ambassador Scholarship',
      'amount': '₹ 1,50,000',
      'deadline': 'Nov 30, 2025',
      'eligibility': 'Open for all UG students',
      'startDate': 'Oct 1, 2025',
      'documents': ['ID Proof', 'Marksheet', 'Recommendation Letter'],
      'howToApply': 'Visit official portal and submit the form',
      'details': 'International scholarship for bright minds',
    },
    {
      'name': 'Merit Excellence Scholarship',
      'amount': '₹ 80,000',
      'deadline': 'Dec 15, 2025',
      'eligibility': 'Students with >85% marks',
      'startDate': 'Oct 15, 2025',
      'documents': ['Aadhar Card', '10th Marksheet'],
      'howToApply': 'Apply via University portal',
      'details': 'For students excelling in academics',
    },
  ];

  /// Track which scholarships are "reminded"
  final Set<int> remindedSet = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      appBar: AppBar(
        backgroundColor: const Color(0xFF5F259F),
        title: const Text(
          'Scholarship Opportunities',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context); // ✅ Back to previous screen
          },
        ),
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            // 🔎 Search Bar
            TextField(
              decoration: InputDecoration(
                hintText: 'Search by keyword',
                prefixIcon: const Icon(Icons.search, color: Color(0xFF5F259F)),
                filled: true,
                fillColor: Colors.grey.shade100,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
            const SizedBox(height: 10),

            // 🔽 New Horizontal Dropdowns
            Row(
              children: [
                Expanded(
                  child: DropdownButtonFormField<String>(
                    value: 'Government',
                    items: ['Government', 'Non-Government']
                        .map((e) => DropdownMenuItem(value: e, child: Text(e)))
                        .toList(),
                    onChanged: (val) {},
                    decoration: InputDecoration(
                      labelText: "Type",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: DropdownButtonFormField<String>(
                    value: 'All',
                    items: ['Sports', 'Merit-based', 'Agriculture', 'All']
                        .map((e) => DropdownMenuItem(value: e, child: Text(e)))
                        .toList(),
                    onChanged: (val) {},
                    decoration: InputDecoration(
                      labelText: "Specific Field",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),

            // 🔽 Old Dropdowns
            Row(
              children: [
                Expanded(
                  child: DropdownButtonFormField<String>(
                    value: 'All types',
                    items: ['All types', 'National', 'International']
                        .map((e) => DropdownMenuItem(value: e, child: Text(e)))
                        .toList(),
                    onChanged: (val) {},
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: DropdownButtonFormField<String>(
                    value: 'Education',
                    items: [
                      'Education',
                      'SSLC',
                      'PUC',
                      'Diploma',
                      'Graduate',
                      'Post Graduate',
                      'Phd'
                    ]
                        .map((e) => DropdownMenuItem(value: e, child: Text(e)))
                        .toList(),
                    onChanged: (val) {},
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),

            // 🔽 Gender Dropdown
            DropdownButtonFormField<String>(
              value: 'Gender',
              items: ['Gender ', 'Male', 'Female', 'Other']
                  .map((e) => DropdownMenuItem(value: e, child: Text(e)))
                  .toList(),
              onChanged: (val) {},
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            const SizedBox(height: 15),

            // 📜 Scholarship List
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: scholarships.length,
              itemBuilder: (context, index) {
                final item = scholarships[index];
                final isReminded = remindedSet.contains(index);

                return Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  color: Colors.white,
                  elevation: 4,
                  margin: const EdgeInsets.symmetric(vertical: 8),
                  child: Padding(
                    padding: const EdgeInsets.all(14.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(item['name'],
                            style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF5F259F))),
                        const SizedBox(height: 6),
                        Row(
                          children: [
                            const Icon(Icons.currency_rupee,
                                size: 18, color: Colors.green),
                            const SizedBox(width: 4),
                            Text(item['amount'],
                                style: const TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.black87)),
                          ],
                        ),
                        const SizedBox(height: 6),
                        Row(
                          children: [
                            const Icon(Icons.calendar_today,
                                size: 16, color: Colors.redAccent),
                            const SizedBox(width: 4),
                            Text('Deadline: ${item['deadline']}'),
                          ],
                        ),
                        const SizedBox(height: 6),
                        Text(item['details']),
                        const SizedBox(height: 10),

                        // ✅ Remind Me + Explore Buttons
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            // Remind Me Button
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: isReminded
                                    ? Colors.orange // after click
                                    : Colors.grey.shade600, // default
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                              ),
                              onPressed: () {
                                setState(() {
                                  if (isReminded) {
                                    remindedSet.remove(index);
                                  } else {
                                    remindedSet.add(index);
                                  }
                                });
                              },
                              child: Text(
                                isReminded ? 'Reminded' : 'Remind Me',
                                style: const TextStyle(color: Colors.white),
                              ),
                            ),

                            // Explore Button
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color(0xFF5F259F),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                              ),
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (_) => ScholarshipApplyPage(
                                      scholarshipName: item['name'],
                                      eligibility: item['eligibility'] ?? "Not specified",
                                      startDate: item['startDate'] ?? "Not  specified",
                                      endDate: item['deadline'],
                                      documents: List<String>.from(item['documents'] ?? []),
                                      howToApply: item['howToApply'] ?? "Check official portal",
                                    ),
                                  ),
                                );
                              },
                              child: const Text(
                                'Explore',
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),

            const SizedBox(height: 10),
            // ⏩ Pagination
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(onPressed: () {}, child: const Text("Previous")),
                const Text("Page 1 of 2"),
                TextButton(onPressed: () {}, child: const Text("Next")),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

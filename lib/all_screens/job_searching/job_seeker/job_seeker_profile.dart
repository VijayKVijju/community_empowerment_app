import 'dart:io';
import 'package:flutter/material.dart';

class JobSeekerProfile extends StatefulWidget {
  final File? profileImage;
  final String name;
  final String email;
  final String phone;
  final String city;
  final String state;
  final String country;
  final String degree;
  final String university;
  final DateTime? startDate;
  final DateTime? endDate;
  final String percentage;
  final List<String> skills;
  final String jobTitle;
  final String experience;
  final String company;
  final String responsibilities;
  final String otherSkills;
  final String summary;
  final String linkedin;
  final String portfolio;
  final String awards;
  final String languages;

  const JobSeekerProfile({
    super.key,
    this.profileImage,
    required this.name,
    required this.email,
    required this.phone,
    required this.city,
    required this.state,
    required this.country,
    required this.degree,
    required this.university,
    this.startDate,
    this.endDate,
    required this.percentage,
    required this.skills,
    required this.jobTitle,
    required this.experience,
    required this.company,
    required this.responsibilities,
    required this.otherSkills,
    required this.summary,
    required this.linkedin,
    required this.portfolio,
    required this.awards,
    required this.languages,
  });

  @override
  State<JobSeekerProfile> createState() => _JobSeekerProfileState();
}

class _JobSeekerProfileState extends State<JobSeekerProfile> {
  bool _isEditing = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F4FF),
      appBar: AppBar(
        backgroundColor: const Color(0xFF6A0DAD),
        title: const Text("My Job Seeker Profile"),
        actions: [
          IconButton(
            icon: Icon(_isEditing ? Icons.check : Icons.edit, color: Colors.white),
            onPressed: () {
              setState(() => _isEditing = !_isEditing);
              if (!_isEditing) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("Profile updated successfully ✅")),
                );
              }
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Center(
              child: CircleAvatar(
                radius: 55,
                backgroundColor: const Color(0xFFC8A2C8),
                backgroundImage: widget.profileImage != null
                    ? FileImage(widget.profileImage!)
                    : null,
                child: widget.profileImage == null
                    ? const Icon(Icons.person, size: 55, color: Colors.white)
                    : null,
              ),
            ),
            const SizedBox(height: 16),
            _buildSection("Personal Information", [
              _infoRow("Full Name", widget.name),
              _infoRow("Email", widget.email),
              _infoRow("Mobile", widget.phone),
              _infoRow("Location", "${widget.city}, ${widget.state}, ${widget.country}"),
            ]),
            _buildSection("Employment Details", [
              _infoRow("Job Title", widget.jobTitle),
              _infoRow("Experience", "${widget.experience} years"),
              _infoRow("Company", widget.company),
              _infoRow("Responsibilities", widget.responsibilities),
            ]),
            _buildSection("Education", [
              _infoRow("Degree", widget.degree),
              _infoRow("University", widget.university),
              _infoRow(
                "Duration",
                widget.startDate != null && widget.endDate != null
                    ? "${widget.startDate!.day}/${widget.startDate!.month}/${widget.startDate!.year} - ${widget.endDate!.day}/${widget.endDate!.month}/${widget.endDate!.year}"
                    : "N/A",
              ),
              _infoRow("Percentage / CGPA", widget.percentage),
            ]),
            _buildSection("Core Skills", [
              Wrap(
                spacing: 8,
                children: widget.skills
                    .map((s) => Chip(
                  label: Text(s),
                  backgroundColor: const Color(0xFFE1BEE7),
                ))
                    .toList(),
              ),
              _infoRow("Other Skills", widget.otherSkills),
            ]),
            _buildSection("Career Summary", [
              _infoRow("Summary", widget.summary),
            ]),
            _buildSection("Links & Extras", [
              _infoRow("LinkedIn", widget.linkedin),
              _infoRow("Portfolio", widget.portfolio),
              _infoRow("Awards", widget.awards),
              _infoRow("Languages Known", widget.languages),
            ]),
          ],
        ),
      ),
    );
  }

  Widget _buildSection(String title, List<Widget> children) {
    return Card(
      color: Colors.white,
      elevation: 3,
      margin: const EdgeInsets.symmetric(vertical: 8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title,
                style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF6A0DAD))),
            const Divider(color: Colors.purple),
            const SizedBox(height: 4),
            ...children,
          ],
        ),
      ),
    );
  }

  Widget _infoRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 3,
            child: Text(
              "$label:",
              style: const TextStyle(
                  fontWeight: FontWeight.bold, color: Colors.black87),
            ),
          ),
          Expanded(
            flex: 5,
            child: Text(
              value.isEmpty ? "—" : value,
              style: const TextStyle(color: Colors.black87),
            ),
          ),
        ],
      ),
    );
  }
}

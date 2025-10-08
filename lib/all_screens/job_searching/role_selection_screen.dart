import 'package:flutter/material.dart';
import 'job_seeker_form.dart';
import 'employer_form.dart';

class RoleSelectionScreen extends StatelessWidget {
  const RoleSelectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF3E5F5),
      appBar: AppBar(
        title: const Text('Select Your Role'),
        backgroundColor: Colors.purple,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildRoleButton(
              context,
              title: "I'm a Job Seeker",
              icon: Icons.person_search,
              color1: Colors.purpleAccent,
              color2: Colors.deepPurple,
              page: const JobSeekerForm(),
            ),
            const SizedBox(height: 25),
            _buildRoleButton(
              context,
              title: "I'm an Employer",
              icon: Icons.business_center,
              color1: Colors.pinkAccent,
              color2: Colors.deepPurple,
              page: const EmployerForm(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRoleButton(BuildContext context,
      {required String title,
        required IconData icon,
        required Color color1,
        required Color color2,
        required Widget page}) {
    return InkWell(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (_) => page));
      },
      child: Container(
        width: 280,
        padding: const EdgeInsets.symmetric(vertical: 20),
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: [color1, color2]),
          borderRadius: BorderRadius.circular(14),
          boxShadow: const [
            BoxShadow(color: Colors.black26, blurRadius: 6, offset: Offset(2, 3))
          ],
        ),
        child: Column(
          children: [
            Icon(icon, color: Colors.white, size: 40),
            const SizedBox(height: 10),
            Text(title,
                style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 18)),
          ],
        ),
      ),
    );
  }
}

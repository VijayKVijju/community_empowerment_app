import 'package:flutter/material.dart';
import 'role_selection_screen.dart';

class JobSeekerWizard extends StatefulWidget {
  const JobSeekerWizard({Key? key}) : super(key: key);

  @override
  State<JobSeekerWizard> createState() => _JobSeekerWizardState();
}

class _JobSeekerWizardState extends State<JobSeekerWizard> {
  bool _accepted = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF6E5F6),
      appBar: AppBar(
        title: const Text('Terms & Conditions'),
        backgroundColor: Colors.deepPurple,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: const [
                      BoxShadow(color: Colors.black12, blurRadius: 5)
                    ],
                  ),
                  child: const Text(
                    'By continuing, you agree that the information you provide '
                        'will be used solely for job searching or recruitment purposes. '
                        'Your personal data will not be shared with third parties '
                        'without your consent.\n\n'
                        'Please ensure that all information entered is accurate. '
                        'False or misleading information may result in suspension.\n\n'
                        '✔ This portal connects job seekers and employers for better community employment opportunities.\n'
                        '✔ We value your privacy and comply with data protection norms.\n'
                        '✔ You can update or delete your data anytime from your profile section.',
                    style: TextStyle(fontSize: 16, color: Colors.black87),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                Checkbox(
                  value: _accepted,
                  onChanged: (value) => setState(() => _accepted = value ?? false),
                  activeColor: Colors.purple,
                ),
                const Expanded(
                  child: Text(
                    'I agree to the above terms and conditions.',
                    style: TextStyle(fontSize: 15),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: _accepted
                  ? () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const RoleSelectionScreen()),
                );
              }
                  : null,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.purple,
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                minimumSize: const Size(double.infinity, 50),
              ),
              child: const Text('Continue'),
            ),
          ],
        ),
      ),
    );
  }
}

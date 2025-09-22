import 'package:flutter/material.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';

void main() {
  runApp(const JobApp());
}

class JobApp extends StatelessWidget {
  const JobApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Job Seeker Registration',
      theme: ThemeData(
        primaryColor: const Color(0xFFD387C1),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFFD387C1),
          foregroundColor: Colors.white,
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFFD387C1),
            foregroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(12)),
            ),
            padding: EdgeInsets.symmetric(vertical: 14, horizontal: 20),
          ),
        ),
      ),
      home: JobSeekerWizard(),
    );
  }
}

class JobSeekerWizard extends StatefulWidget {
  @override
  State<JobSeekerWizard> createState() => _JobSeekerWizardState();
}

class _JobSeekerWizardState extends State<JobSeekerWizard> {
  int currentStep = 0;

  // Step 1: Personal Info
  File? profileImage;
  final nameController = TextEditingController();
  final headlineController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  String? jobType;

  // Step 2: Education
  List<Map<String, String>> educationList = [];

  // Step 3: Achievements & Certificates
  List<String> achievements = [];
  List<Map<String, String>> certificates = [];

  final picker = ImagePicker();

  Future<void> pickImage() async {
    showModalBottomSheet(
      context: context,
      builder: (ctx) => Wrap(
        children: [
          ListTile(
            leading: const Icon(Icons.photo_library),
            title: const Text("Pick from Gallery"),
            onTap: () async {
              Navigator.pop(ctx);
              final picked = await picker.pickImage(source: ImageSource.gallery);
              if (picked != null) {
                setState(() => profileImage = File(picked.path));
              }
            },
          ),
          ListTile(
            leading: const Icon(Icons.camera_alt),
            title: const Text("Take Photo"),
            onTap: () async {
              Navigator.pop(ctx);
              final picked = await picker.pickImage(source: ImageSource.camera);
              if (picked != null) {
                setState(() => profileImage = File(picked.path));
              }
            },
          ),
        ],
      ),
    );
  }

  /// Steps
  List<Step> getSteps() => [
    // STEP 1: Personal Info
    Step(
      title: const Text("Personal"),
      isActive: currentStep >= 0,
      state: currentStep > 0 ? StepState.complete : StepState.indexed,
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: GestureDetector(
              onTap: pickImage,
              child: CircleAvatar(
                radius: 50,
                backgroundImage:
                profileImage != null ? FileImage(profileImage!) : null,
                child: profileImage == null
                    ? const Icon(Icons.camera_alt, size: 40)
                    : null,
              ),
            ),
          ),
          const SizedBox(height: 10),
          _mandatoryText("Full Name"),
          TextField(controller: nameController),
          _mandatoryText("Headline"),
          TextField(controller: headlineController),
          _mandatoryText("Email"),
          TextField(
            controller: emailController,
            keyboardType: TextInputType.emailAddress,
          ),
          _mandatoryText("Phone"),
          TextField(
            controller: phoneController,
            keyboardType: TextInputType.phone,
          ),
          _mandatoryText("Job Type"),
          DropdownButtonFormField<String>(
            value: jobType,
            items: ["Full-Time", "Part-Time", "Internship"]
                .map((e) => DropdownMenuItem(
              value: e,
              child: Text(e),
            ))
                .toList(),
            onChanged: (val) => setState(() => jobType = val),
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              hintText: "Select Job Type",
            ),
          ),
        ],
      ),
    ),

    // STEP 2: Education
    Step(
      title: const Text("Education"),
      isActive: currentStep >= 1,
      state: currentStep > 1 ? StepState.complete : StepState.indexed,
      content: Column(
        children: [
          ...educationList.map((edu) => Card(
            child: ListTile(
              title: Text("${edu['level']} - ${edu['institute']}"),
              subtitle: Text(
                  "${edu['start']} to ${edu['end']} | ${edu['percentage']}%"),
              trailing: IconButton(
                icon: const Icon(Icons.delete, color: Colors.red),
                onPressed: () {
                  setState(() => educationList.remove(edu));
                },
              ),
            ),
          )),
          ElevatedButton.icon(
            onPressed: _addEducationDialog,
            icon: const Icon(Icons.add),
            label: const Text("Add Education"),
          ),
        ],
      ),
    ),

    // STEP 3: Achievements & Certificates
    Step(
      title: const Text("Certificates"),
      isActive: currentStep >= 2,
      state: currentStep > 2 ? StepState.complete : StepState.indexed,
      content: Column(
        children: [
          _mandatoryText("Achievements"),
          Wrap(
            spacing: 8,
            children: achievements
                .map((ach) => Chip(
              label: Text(ach),
              onDeleted: () =>
                  setState(() => achievements.remove(ach)),
            ))
                .toList(),
          ),
          ElevatedButton.icon(
            onPressed: _addAchievementDialog,
            icon: const Icon(Icons.add),
            label: const Text("Add Achievement"),
          ),
          const SizedBox(height: 20),
          _mandatoryText("Certificates"),
          ...certificates.map((cert) => Card(
            child: ListTile(
              title: Text(cert['name'] ?? ""),
              subtitle:
              Text("From ${cert['start']} to ${cert['end']}"),
              trailing: IconButton(
                icon: const Icon(Icons.delete, color: Colors.red),
                onPressed: () {
                  setState(() => certificates.remove(cert));
                },
              ),
            ),
          )),
          ElevatedButton.icon(
            onPressed: _addCertificateDialog,
            icon: const Icon(Icons.add),
            label: const Text("Add Certificate"),
          ),
        ],
      ),
    ),

    // STEP 4: Review & Submit
    Step(
      title: const Text("Review"),
      isActive: currentStep >= 3,
      state: StepState.indexed,
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("Review your details:",
              style: TextStyle(fontWeight: FontWeight.bold)),
          const SizedBox(height: 10),
          Text("Name: ${nameController.text}"),
          Text("Headline: ${headlineController.text}"),
          Text("Email: ${emailController.text}"),
          Text("Phone: ${phoneController.text}"),
          Text("Job Type: $jobType"),
          const Divider(),
          Text("Education: ${educationList.length} records"),
          Text("Achievements: ${achievements.join(", ")}"),
          Text("Certificates: ${certificates.length} records"),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text("Form Submitted ✅")),
              );
            },
            child: const Text("Submit"),
          ),
        ],
      ),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Job Seeker Registration"),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            setState(() {
              if (currentStep > 0) {
                currentStep--;
              } else {
                Navigator.pop(context);
              }
            });
          },
        ),
      ),
      body: Stepper(
        currentStep: currentStep,
        steps: getSteps(),
        onStepContinue: () {
          if (currentStep < getSteps().length - 1) {
            setState(() => currentStep++);
          }
        },
        onStepCancel: () {
          if (currentStep > 0) {
            setState(() => currentStep--);
          }
        },
        controlsBuilder: (context, details) {
          return Row(
            children: [
              if (currentStep > 0)
                ElevatedButton(
                  onPressed: details.onStepCancel,
                  child: const Text("Back"),
                ),
              const SizedBox(width: 10),
              if (currentStep < getSteps().length - 1)
                ElevatedButton(
                  onPressed: details.onStepContinue,
                  child: const Text("Next"),
                ),
            ],
          );
        },
      ),
    );
  }

  /// Education Dialog with Dropdown + Dates
  void _addEducationDialog() {
    final instituteController = TextEditingController();
    final percentageController = TextEditingController();
    String? level;
    DateTime? startDate;
    DateTime? endDate;

    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text("Add Education"),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            DropdownButtonFormField<String>(
              value: level,
              items: ["10th", "PUC", "Degree", "Masters", "PhD"]
                  .map((e) => DropdownMenuItem(value: e, child: Text(e)))
                  .toList(),
              onChanged: (val) => level = val,
              decoration: const InputDecoration(labelText: "Level"),
            ),
            TextField(
              controller: instituteController,
              decoration: const InputDecoration(labelText: "Institute"),
            ),
            TextField(
              controller: percentageController,
              decoration: const InputDecoration(labelText: "Percentage"),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                Expanded(
                  child: TextButton(
                    onPressed: () async {
                      final date = await showDatePicker(
                        context: context,
                        firstDate: DateTime(1990),
                        lastDate: DateTime(2100),
                        initialDate: DateTime.now(),
                      );
                      if (date != null) startDate = date;
                    },
                    child: const Text("Pick Start Date"),
                  ),
                ),
                Expanded(
                  child: TextButton(
                    onPressed: () async {
                      final date = await showDatePicker(
                        context: context,
                        firstDate: DateTime(1990),
                        lastDate: DateTime(2100),
                        initialDate: DateTime.now(),
                      );
                      if (date != null) endDate = date;
                    },
                    child: const Text("Pick End Date"),
                  ),
                ),
              ],
            ),
          ],
        ),
        actions: [
          TextButton(
              onPressed: () => Navigator.pop(ctx),
              child: const Text("Cancel")),
          ElevatedButton(
            onPressed: () {
              if (level != null &&
                  instituteController.text.isNotEmpty &&
                  startDate != null &&
                  endDate != null) {
                setState(() {
                  educationList.add({
                    "level": level!,
                    "institute": instituteController.text,
                    "percentage": percentageController.text,
                    "start": startDate.toString().split(" ")[0],
                    "end": endDate.toString().split(" ")[0],
                  });
                });
                Navigator.pop(ctx);
              }
            },
            child: const Text("Add"),
          ),
        ],
      ),
    );
  }

  /// Achievement Dialog
  void _addAchievementDialog() {
    final achController = TextEditingController();
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text("Add Achievement"),
        content: TextField(
          controller: achController,
          decoration: const InputDecoration(labelText: "Achievement"),
        ),
        actions: [
          TextButton(
              onPressed: () => Navigator.pop(ctx),
              child: const Text("Cancel")),
          ElevatedButton(
            onPressed: () {
              if (achController.text.isNotEmpty) {
                setState(() => achievements.add(achController.text));
              }
              Navigator.pop(ctx);
            },
            child: const Text("Add"),
          ),
        ],
      ),
    );
  }

  /// Certificate Dialog with Dates
  void _addCertificateDialog() {
    final certController = TextEditingController();
    DateTime? startDate;
    DateTime? endDate;

    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text("Add Certificate"),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: certController,
              decoration: const InputDecoration(labelText: "Certificate Name"),
            ),
            Row(
              children: [
                Expanded(
                  child: TextButton(
                    onPressed: () async {
                      final date = await showDatePicker(
                        context: context,
                        firstDate: DateTime(1990),
                        lastDate: DateTime(2100),
                        initialDate: DateTime.now(),
                      );
                      if (date != null) startDate = date;
                    },
                    child: const Text("Pick Start Date"),
                  ),
                ),
                Expanded(
                  child: TextButton(
                    onPressed: () async {
                      final date = await showDatePicker(
                        context: context,
                        firstDate: DateTime(1990),
                        lastDate: DateTime(2100),
                        initialDate: DateTime.now(),
                      );
                      if (date != null) endDate = date;
                    },
                    child: const Text("Pick End Date"),
                  ),
                ),
              ],
            ),
          ],
        ),
        actions: [
          TextButton(
              onPressed: () => Navigator.pop(ctx),
              child: const Text("Cancel")),
          ElevatedButton(
            onPressed: () {
              if (certController.text.isNotEmpty &&
                  startDate != null &&
                  endDate != null) {
                setState(() {
                  certificates.add({
                    "name": certController.text,
                    "start": startDate.toString().split(" ")[0],
                    "end": endDate.toString().split(" ")[0],
                  });
                });
                Navigator.pop(ctx);
              }
            },
            child: const Text("Add"),
          ),
        ],
      ),
    );
  }

  /// Helper for mandatory fields
  Widget _mandatoryText(String label) {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0, bottom: 5),
      child: RichText(
        text: TextSpan(
          text: label,
          style: const TextStyle(color: Colors.black, fontSize: 14),
          children: const [
            TextSpan(
                text: " *", style: TextStyle(color: Colors.red, fontSize: 14)),
          ],
        ),
      ),
    );
  }
}

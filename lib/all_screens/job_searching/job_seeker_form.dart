import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'email_verification_screen.dart';

class JobSeekerForm extends StatefulWidget {
  const JobSeekerForm({super.key});

  @override
  State<JobSeekerForm> createState() => _JobSeekerFormState();
}

class _JobSeekerFormState extends State<JobSeekerForm> {
  final _formKey = GlobalKey<FormState>();
  int _currentStep = 0;
  File? _profileImage;
  final ImagePicker _picker = ImagePicker();

  // Controllers
  final TextEditingController nameCtrl = TextEditingController();
  final TextEditingController emailCtrl = TextEditingController();
  final TextEditingController phoneCtrl = TextEditingController();
  final TextEditingController cityCtrl = TextEditingController();
  final TextEditingController stateCtrl = TextEditingController();
  final TextEditingController countryCtrl = TextEditingController();

  Future<void> _pickImage() async {
    final picked = await _picker.pickImage(source: ImageSource.gallery);
    if (picked != null) setState(() => _profileImage = File(picked.path));
  }

  void _nextStep() {
    if (_formKey.currentState!.validate()) {
      if (_currentStep == 0) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => EmailVerificationScreen(
              email: emailCtrl.text,
              onVerified: () {
                Navigator.pop(context);
                setState(() => _currentStep++);
              },
            ),
          ),
        );
      } else if (_currentStep < _getSteps().length - 1) {
        setState(() => _currentStep++);
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Profile Submitted Successfully ✅")),
        );
      }
    }
  }

  void _previousStep() {
    if (_currentStep > 0) setState(() => _currentStep--);
  }

  List<Step> _getSteps() => [
    Step(
      title: const Text("Basic Info"),
      isActive: _currentStep >= 0,
      content: Column(
        children: [
          GestureDetector(
            onTap: _pickImage,
            child: CircleAvatar(
              radius: 40,
              backgroundColor: const Color(0xFFC8A2C8),
              backgroundImage:
              _profileImage != null ? FileImage(_profileImage!) : null,
              child: _profileImage == null
                  ? const Icon(Icons.camera_alt, color: Colors.white)
                  : null,
            ),
          ),
          const SizedBox(height: 10),
          _buildTextField(nameCtrl, "Full Name"),
          _buildTextField(emailCtrl, "Email"),
          _buildTextField(phoneCtrl, "Mobile Number"),
          _buildTextField(cityCtrl, "City"),
          _buildTextField(stateCtrl, "State"),
          _buildTextField(countryCtrl, "Country"),
        ],
      ),
    ),
    Step(
      title: const Text("Employment Details"),
      isActive: _currentStep >= 1,
      content: Column(
        children: const [
          TextField(decoration: InputDecoration(labelText: "Current Job Title")),
          TextField(decoration: InputDecoration(labelText: "Total Experience (Years)")),
          TextField(decoration: InputDecoration(labelText: "Previous Company Name")),
          TextField(decoration: InputDecoration(labelText: "Responsibilities")),
        ],
      ),
    ),
    Step(
      title: const Text("Education"),
      isActive: _currentStep >= 2,
      content: Column(
        children: const [
          TextField(decoration: InputDecoration(labelText: "Degree / Qualification")),
          TextField(decoration: InputDecoration(labelText: "University / Institution")),
          TextField(decoration: InputDecoration(labelText: "Year of Passing")),
          TextField(decoration: InputDecoration(labelText: "Percentage / CGPA")),
        ],
      ),
    ),
    Step(
      title: const Text("Skills & Summary"),
      isActive: _currentStep >= 3,
      content: Column(
        children: const [
          TextField(decoration: InputDecoration(labelText: "Core Skills")),
          TextField(decoration: InputDecoration(labelText: "Other Skills")),
          TextField(decoration: InputDecoration(labelText: "Career Objective / Summary")),
        ],
      ),
    ),
    Step(
      title: const Text("Links & Extras"),
      isActive: _currentStep >= 4,
      content: Column(
        children: const [
          TextField(decoration: InputDecoration(labelText: "LinkedIn Profile")),
          TextField(decoration: InputDecoration(labelText: "Portfolio / Website")),
          TextField(decoration: InputDecoration(labelText: "Awards / Achievements")),
          TextField(decoration: InputDecoration(labelText: "Languages Known")),
        ],
      ),
    ),
  ];

  InputDecoration _dec(String label) => InputDecoration(
    labelText: label,
    filled: true,
    fillColor: const Color(0xFFF3E5F5),
    labelStyle: const TextStyle(color: Colors.purple),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
    ),
    focusedBorder: OutlineInputBorder(
      borderSide: const BorderSide(color: Colors.purple, width: 2),
      borderRadius: BorderRadius.circular(12),
    ),
  );

  Widget _buildTextField(TextEditingController controller, String label) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: TextFormField(
        controller: controller,
        decoration: _dec(label),
        validator: (val) => val == null || val.isEmpty ? 'Required field' : null,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F4FF),
      appBar: AppBar(
        backgroundColor: const Color(0xFF6A0DAD),
        title: const Text("Job Seeker Registration"),
      ),
      body: Form(
        key: _formKey,
        child: Stepper(
          type: StepperType.vertical,
          currentStep: _currentStep,
          steps: _getSteps(),
          onStepContinue: _nextStep,
          onStepCancel: _previousStep,
          controlsBuilder: (context, details) {
            return Padding(
              padding: const EdgeInsets.only(top: 16),
              child: Row(
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF6A0DAD),
                    ),
                    onPressed: details.onStepContinue,
                    child: Text(
                        _currentStep == _getSteps().length - 1 ? "Submit" : "Next"),
                  ),
                  const SizedBox(width: 8),
                  if (_currentStep > 0)
                    OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        side: const BorderSide(color: Color(0xFF6A0DAD)),
                      ),
                      onPressed: details.onStepCancel,
                      child: const Text("Back"),
                    ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
/*
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'email_verification_screen.dart';
import 'job_seeker/job_seeker_profile.dart';

class JobSeekerForm extends StatefulWidget {
  const JobSeekerForm({super.key});

  @override
  State<JobSeekerForm> createState() => _JobSeekerFormState();
}

class _JobSeekerFormState extends State<JobSeekerForm> {
  final _formKey = GlobalKey<FormState>();
  int _currentStep = 0;
  File? _profileImage;
  final ImagePicker _picker = ImagePicker();

  // Basic Info Controllers
  final TextEditingController nameCtrl = TextEditingController();
  final TextEditingController emailCtrl = TextEditingController();
  final TextEditingController phoneCtrl = TextEditingController();
  final TextEditingController cityCtrl = TextEditingController();
  final TextEditingController stateCtrl = TextEditingController();
  final TextEditingController countryCtrl = TextEditingController();

  // Education Controllers / State
  String? selectedDegree;
  final TextEditingController universityCtrl = TextEditingController();
  DateTime? startDate;
  DateTime? endDate;
  final TextEditingController percentageCtrl = TextEditingController();

  // Skills
  final TextEditingController skillCtrl = TextEditingController();
  final List<String> skills = [];

  // Employment
  final TextEditingController jobTitleCtrl = TextEditingController();
  final TextEditingController experienceCtrl = TextEditingController();
  final TextEditingController companyCtrl = TextEditingController();
  final TextEditingController responsibilitiesCtrl = TextEditingController();

  // Summary & Other Skills
  final TextEditingController otherSkillsCtrl = TextEditingController();
  final TextEditingController summaryCtrl = TextEditingController();

  // Links
  final TextEditingController linkedinCtrl = TextEditingController();
  final TextEditingController portfolioCtrl = TextEditingController();
  final TextEditingController awardsCtrl = TextEditingController();
  final TextEditingController languagesCtrl = TextEditingController();

  // Indian degrees
  final List<String> _indianDegrees = const [
    "B.A.", "B.Sc.", "B.Com.", "B.Tech", "B.E.", "M.A.", "M.Sc.", "M.Com",
    "M.Tech", "M.E.", "BBA", "MBA", "LLB", "LLM", "MBBS", "BDS", "M.Phil",
    "Ph.D.", "Diploma", "Certificate", "BCA", "MCA", "B.Pharm", "M.Pharm",
    "B.Ed", "M.Ed"
  ];

  Future<void> _pickImage() async {
    final picked = await _picker.pickImage(source: ImageSource.gallery);
    if (picked != null) setState(() => _profileImage = File(picked.path));
  }

  Future<void> _pickStartDate() async {
    final date = await showDatePicker(
      context: context,
      initialDate: startDate ?? DateTime.now(),
      firstDate: DateTime(1950),
      lastDate: DateTime.now(),
    );
    if (date != null) setState(() => startDate = date);
  }

  Future<void> _pickEndDate() async {
    final date = await showDatePicker(
      context: context,
      initialDate: endDate ?? (startDate ?? DateTime.now()),
      firstDate: startDate ?? DateTime(1950),
      lastDate: DateTime.now(),
    );
    if (date != null) setState(() => endDate = date);
  }

  void _nextStep() {
    if (_formKey.currentState!.validate()) {
      if (_currentStep == 0) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => EmailVerificationScreen(
              email: emailCtrl.text,
              onVerified: () {
                Navigator.pop(context);
                setState(() => _currentStep++);
              },
            ),
          ),
        );
      } else if (_currentStep < _getSteps().length - 1) {
        setState(() => _currentStep++);
      } else {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (_) => JobSeekerProfile(
              profileImage: _profileImage,
              name: nameCtrl.text,
              email: emailCtrl.text,
              phone: phoneCtrl.text,
              city: cityCtrl.text,
              state: stateCtrl.text,
              country: countryCtrl.text,
              degree: selectedDegree ?? "",
              university: universityCtrl.text,
              startDate: startDate,
              endDate: endDate,
              percentage: percentageCtrl.text,
              skills: skills,
              jobTitle: jobTitleCtrl.text,
              experience: experienceCtrl.text,
              company: companyCtrl.text,
              responsibilities: responsibilitiesCtrl.text,
              otherSkills: otherSkillsCtrl.text,
              summary: summaryCtrl.text,
              linkedin: linkedinCtrl.text,
              portfolio: portfolioCtrl.text,
              awards: awardsCtrl.text,
              languages: languagesCtrl.text,
            ),
          ),
        );

        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Your profile created successfully ✅")),
        );
      }
    }
  }

  void _previousStep() {
    if (_currentStep > 0) setState(() => _currentStep--);
  }

  Widget _buildTextField(TextEditingController ctrl, String label) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: TextFormField(
        controller: ctrl,
        decoration: InputDecoration(
          labelText: label,
          border: OutlineInputBorder(),
          filled: true,
          fillColor: const Color(0xFFF3E5F5),
        ),
        validator: (val) => val == null || val.isEmpty ? "Required field" : null,
      ),
    );
  }

  List<Step> _getSteps() => [
    Step(
      title: const Text("Basic Info"),
      isActive: _currentStep >= 0,
      content: Column(
        children: [
          GestureDetector(
            onTap: _pickImage,
            child: CircleAvatar(
              radius: 40,
              backgroundColor: const Color(0xFFC8A2C8),
              backgroundImage: _profileImage != null ? FileImage(_profileImage!) : null,
              child: _profileImage == null ? const Icon(Icons.camera_alt, color: Colors.white) : null,
            ),
          ),
          const SizedBox(height: 10),
          _buildTextField(nameCtrl, "Full Name"),
          _buildTextField(emailCtrl, "Email"),
          _buildTextField(phoneCtrl, "Mobile Number"),
          _buildTextField(cityCtrl, "City"),
          _buildTextField(stateCtrl, "State"),
          _buildTextField(countryCtrl, "Country"),
        ],
      ),
    ),
    Step(
      title: const Text("Employment Details"),
      isActive: _currentStep >= 1,
      content: Column(
        children: [
          _buildTextField(jobTitleCtrl, "Current Job Title"),
          _buildTextField(experienceCtrl, "Total Experience (Years)"),
          _buildTextField(companyCtrl, "Previous Company Name"),
          _buildTextField(responsibilitiesCtrl, "Responsibilities"),
        ],
      ),
    ),
    Step(
      title: const Text("Education"),
      isActive: _currentStep >= 2,
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          DropdownSearch<String>(
            selectedItem: selectedDegree,
            onChanged: (val) => setState(() => selectedDegree = val),
            validator: (val) => val == null || val.isEmpty ? "Required field" : null,
            popupProps: PopupProps.menu(
              showSearchBox: true,
              items: _indianDegrees,
            ),
          ),
          const SizedBox(height: 8),
          _buildTextField(universityCtrl, "University / Institution"),
          const SizedBox(height: 8),
          Row(
            children: [
              Expanded(
                child: GestureDetector(
                  onTap: _pickStartDate,
                  child: AbsorbPointer(
                    child: TextFormField(
                      decoration: InputDecoration(
                        labelText: startDate == null ? "Start Date" : "${startDate!.day}/${startDate!.month}/${startDate!.year}",
                        border: const OutlineInputBorder(),
                        filled: true,
                        fillColor: const Color(0xFFF3E5F5),
                      ),
                      validator: (val) => startDate == null ? "Select start date" : null,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: GestureDetector(
                  onTap: _pickEndDate,
                  child: AbsorbPointer(
                    child: TextFormField(
                      decoration: InputDecoration(
                        labelText: endDate == null ? "End Date" : "${endDate!.day}/${endDate!.month}/${endDate!.year}",
                        border: const OutlineInputBorder(),
                        filled: true,
                        fillColor: const Color(0xFFF3E5F5),
                      ),
                      validator: (val) => endDate == null ? "Select end date" : null,
                    ),
                  ),
                ),
              ),
            ],
          ),
          _buildTextField(percentageCtrl, "Percentage / CGPA"),
        ],
      ),
    ),
    Step(
      title: const Text("Skills & Summary"),
      isActive: _currentStep >= 3,
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Wrap(
            spacing: 6,
            children: skills
                .map((skill) => Chip(
              label: Text(skill),
              onDeleted: () => setState(() => skills.remove(skill)),
            ))
                .toList(),
          ),
          Row(
            children: [
              Expanded(child: _buildTextField(skillCtrl, "Add Core Skill")),
              IconButton(
                icon: const Icon(Icons.add, color: Colors.purple),
                onPressed: () {
                  final text = skillCtrl.text.trim();
                  if (text.isNotEmpty && !skills.contains(text)) {
                    setState(() {
                      skills.add(text);
                      skillCtrl.clear();
                    });
                  }
                },
              ),
            ],
          ),
          _buildTextField(otherSkillsCtrl, "Other Skills"),
          _buildTextField(summaryCtrl, "Career Objective / Summary"),
        ],
      ),
    ),
    Step(
      title: const Text("Links & Extras"),
      isActive: _currentStep >= 4,
      content: Column(
        children: [
          _buildTextField(linkedinCtrl, "LinkedIn Profile"),
          _buildTextField(portfolioCtrl, "Portfolio / Website"),
          _buildTextField(awardsCtrl, "Awards / Achievements"),
          _buildTextField(languagesCtrl, "Languages Known"),
        ],
      ),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F4FF),
      appBar: AppBar(
        backgroundColor: const Color(0xFF6A0DAD),
        title: const Text("Job Seeker Registration"),
      ),
      body: Form(
        key: _formKey,
        child: Stepper(
          type: StepperType.vertical,
          currentStep: _currentStep,
          steps: _getSteps(),
          onStepContinue: _nextStep,
          onStepCancel: _previousStep,
          controlsBuilder: (context, details) => Padding(
            padding: const EdgeInsets.only(top: 16),
            child: Row(
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFF6A0DAD)),
                  onPressed: details.onStepContinue,
                  child: Text(_currentStep == _getSteps().length - 1 ? "Submit" : "Next"),
                ),
                const SizedBox(width: 8),
                if (_currentStep > 0)
                  OutlinedButton(
                    style: OutlinedButton.styleFrom(side: const BorderSide(color: Color(0xFF6A0DAD))),
                    onPressed: details.onStepCancel,
                    child: const Text("Back"),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
*/
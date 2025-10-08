import 'package:flutter/material.dart';

class EmployerForm extends StatefulWidget {
  const EmployerForm({super.key});

  @override
  State<EmployerForm> createState() => _EmployerFormState();
}

class _EmployerFormState extends State<EmployerForm> {
  final _formKey = GlobalKey<FormState>();

  // Step management
  int _currentStep = 0;

  // Form controllers
  final TextEditingController companyNameController = TextEditingController();
  final TextEditingController officialEmailController = TextEditingController();
  final TextEditingController websiteController = TextEditingController();
  final TextEditingController industryController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController hrNameController = TextEditingController();
  final TextEditingController designationController = TextEditingController();
  final TextEditingController contactNumberController = TextEditingController();

  // OTP simulation
  String emailOTP = '';
  String mobileOTP = '';

  // Skills / Benefits
  List<TextEditingController> skillsControllers = [TextEditingController()];
  List<String> benefits = [];

  // Lavender + Purple theme colors
  final Color primaryColor = Colors.purple;
  final Color accentColor = Colors.purple.shade50;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Employer / Recruiter Details'),
        backgroundColor: primaryColor,
      ),
      body: Stepper(
        type: StepperType.vertical,
        currentStep: _currentStep,
        onStepContinue: () {
          if (_currentStep < 5) {
            setState(() => _currentStep += 1);
          } else {
            if (_formKey.currentState!.validate()) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Employer Details Submitted!')),
              );
            }
          }
        },
        onStepCancel: () {
          if (_currentStep > 0) {
            setState(() => _currentStep -= 1);
          }
        },
        steps: [
          // Step 1: Company Details
          Step(
            title: const Text('Company Details'),
            content: Column(
              children: [
                _buildTextField('Company Name', controller: companyNameController, mandatory: true),
                _buildTextField('Official Email', controller: officialEmailController, mandatory: true),
                _buildTextField('Website', controller: websiteController),
                _buildTextField('Industry / Domain', controller: industryController),
              ],
            ),
            isActive: _currentStep >= 0,
          ),

          // Step 2: HR Details
          Step(
            title: const Text('HR / Recruiter Details'),
            content: Column(
              children: [
                _buildTextField('HR / Recruiter Name', controller: hrNameController, mandatory: true),
                _buildTextField('Designation', controller: designationController),
                _buildTextField('Contact Number', controller: contactNumberController, mandatory: true),
              ],
            ),
            isActive: _currentStep >= 1,
          ),

          // Step 3: Email OTP Verification
          Step(
            title: const Text('Email Verification'),
            content: Column(
              children: [
                ElevatedButton(
                  onPressed: () {
                    emailOTP = _generateOTP();
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Simulated Email OTP: $emailOTP')),
                    );
                  },
                  style: ElevatedButton.styleFrom(backgroundColor: primaryColor),
                  child: const Text('Send OTP'),
                ),
                _buildTextField('Enter OTP', mandatory: true),
              ],
            ),
            isActive: _currentStep >= 2,
          ),

          // Step 4: Mobile OTP Verification
          Step(
            title: const Text('Mobile Verification'),
            content: Column(
              children: [
                ElevatedButton(
                  onPressed: () {
                    mobileOTP = _generateOTP();
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Simulated Mobile OTP: $mobileOTP')),
                    );
                  },
                  style: ElevatedButton.styleFrom(backgroundColor: primaryColor),
                  child: const Text('Send OTP'),
                ),
                _buildTextField('Enter OTP', mandatory: true),
              ],
            ),
            isActive: _currentStep >= 3,
          ),

          // Step 5: Skills / Benefits
          Step(
            title: const Text('Skills & Benefits'),
            content: Column(
              children: [
                const Text('Required Skills:', style: TextStyle(fontWeight: FontWeight.bold)),
                ...skillsControllers.map((controller) => _buildTextField('Skill', controller: controller)).toList(),
                TextButton.icon(
                  onPressed: () => setState(() => skillsControllers.add(TextEditingController())),
                  icon: const Icon(Icons.add, color: Colors.purple),
                  label: const Text('Add Skill', style: TextStyle(color: Colors.purple)),
                ),
                const SizedBox(height: 10),
                const Text('Benefits:', style: TextStyle(fontWeight: FontWeight.bold)),
                CheckboxListTile(
                  title: const Text('Health Insurance'),
                  value: benefits.contains('Health Insurance'),
                  onChanged: (val) {
                    setState(() {
                      val! ? benefits.add('Health Insurance') : benefits.remove('Health Insurance');
                    });
                  },
                ),
                CheckboxListTile(
                  title: const Text('Paid Leave'),
                  value: benefits.contains('Paid Leave'),
                  onChanged: (val) {
                    setState(() {
                      val! ? benefits.add('Paid Leave') : benefits.remove('Paid Leave');
                    });
                  },
                ),
                CheckboxListTile(
                  title: const Text('Work From Home'),
                  value: benefits.contains('Work From Home'),
                  onChanged: (val) {
                    setState(() {
                      val! ? benefits.add('Work From Home') : benefits.remove('Work From Home');
                    });
                  },
                ),
              ],
            ),
            isActive: _currentStep >= 4,
          ),

          // Step 6: Address & Submit
          Step(
            title: const Text('Address & Submit'),
            content: Column(
              children: [
                _buildTextField('Address', controller: addressController, mandatory: true),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Employer Details Submitted!')),
                      );
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: primaryColor,
                    minimumSize: const Size(double.infinity, 50),
                  ),
                  child: const Text('Submit'),
                ),
              ],
            ),
            isActive: _currentStep >= 5,
          ),
        ],
      ),
    );
  }

  Widget _buildTextField(String label, {TextEditingController? controller, bool mandatory = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          labelText: mandatory ? '$label *' : label,
          filled: true,
          fillColor: accentColor,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
        ),
        validator: (value) => (mandatory && (value == null || value.isEmpty)) ? 'Please enter $label' : null,
      ),
    );
  }

  String _generateOTP() {
    return (1000 + (9999 - 1000) * (new DateTime.now().millisecondsSinceEpoch % 1000) / 1000).toInt().toString();
  }
}

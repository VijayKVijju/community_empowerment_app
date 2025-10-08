import 'dart:math';
import 'package:flutter/material.dart';

class EmailVerificationScreen extends StatefulWidget {
  final String email;
  final VoidCallback onVerified;

  const EmailVerificationScreen({
    super.key,
    required this.email,
    required this.onVerified,
  });

  @override
  State<EmailVerificationScreen> createState() =>
      _EmailVerificationScreenState();
}

class _EmailVerificationScreenState extends State<EmailVerificationScreen> {
  String? _generatedOtp;
  final TextEditingController otpCtrl = TextEditingController();
  bool _otpSent = false;

  void _sendOtp() {
    setState(() {
      _generatedOtp = (100000 + Random().nextInt(899999)).toString();
      _otpSent = true;
    });

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: const Color(0xFF6A0DAD),
        content: Text("OTP sent to ${widget.email} : $_generatedOtp"),
      ),
    );
  }

  void _verifyOtp() {
    if (otpCtrl.text == _generatedOtp) {
      widget.onVerified();
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          backgroundColor: Colors.green,
          content: Text("Email verified successfully ✅"),
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          backgroundColor: Colors.red,
          content: Text("Invalid OTP ❌"),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F4FF),
      appBar: AppBar(
        backgroundColor: const Color(0xFF6A0DAD),
        title: const Text("Verify Your Email"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            const SizedBox(height: 40),
            Icon(Icons.email_outlined, size: 80, color: Colors.purple.shade700),
            const SizedBox(height: 20),
            Text(
              "We’ll send a 6-digit OTP to your email:\n${widget.email}",
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 16, color: Colors.black87),
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: _sendOtp,
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF6A0DAD),
              ),
              child: const Text("Send OTP"),
            ),
            const SizedBox(height: 20),
            if (_otpSent)
              TextField(
                controller: otpCtrl,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: "Enter OTP",
                  filled: true,
                  fillColor: const Color(0xFFF3E5F5),
                  labelStyle: const TextStyle(color: Colors.purple),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
            const SizedBox(height: 20),
            if (_otpSent)
              ElevatedButton(
                onPressed: _verifyOtp,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF6A0DAD),
                ),
                child: const Text("Verify OTP"),
              ),
          ],
        ),
      ),
    );
  }
}

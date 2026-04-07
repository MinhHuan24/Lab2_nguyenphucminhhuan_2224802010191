import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();

  @override
  void dispose() {
    firstNameController.dispose();
    lastNameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Register')),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          CustomTextField(
            label: 'First Name',
            controller: firstNameController,
          ),
          CustomTextField(
            label: 'Last Name',
            controller: lastNameController,
          ),
          const CustomTextField(
            label: 'Email',
            suffixText: '@mlritm.ac.in',
          ),
          const CustomTextField(
            label: 'Phone Number',
            prefixText: '+91 ',
            keyboardType: TextInputType.phone,
            maxLength: 10,
          ),
          const Divider(indent: 8, endIndent: 8),
          const CustomTextField(label: 'Username'),
          const CustomTextField(label: 'Password', obscureText: true),
          const CustomTextField(label: 'Confirm Password', obscureText: true),
          const SizedBox(height: 20),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(vertical: 16),
              backgroundColor: Colors.deepPurple,
              foregroundColor: Colors.white,
            ),
            onPressed: () {
              // Hiển thị thông báo khi nhấn nút
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Registration Data Submitted!')),
              );
            },
            child: const Text('Register', style: TextStyle(fontSize: 18)),
          ),
        ],
      ),
    );
  }
}

// Lớp Widget tùy chỉnh (Custom Widget) được trích xuất từ tài liệu của bạn
class CustomTextField extends StatelessWidget {
  final String label;
  final TextEditingController? controller;
  final String? suffixText;
  final String? prefixText;
  final TextInputType? keyboardType;
  final int? maxLength;
  final bool obscureText;

  const CustomTextField({
    super.key,
    required this.label,
    this.controller,
    this.suffixText,
    this.prefixText,
    this.keyboardType,
    this.maxLength,
    this.obscureText = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: TextField(
        controller: controller,
        keyboardType: keyboardType,
        maxLength: maxLength,
        obscureText: obscureText,
        // Chỉ cho phép nhập số nếu là trường số điện thoại
        inputFormatters: keyboardType == TextInputType.phone
            ? [FilteringTextInputFormatter.digitsOnly]
            : [],
        decoration: InputDecoration(
          labelText: label,
          border: const OutlineInputBorder(),
          suffixText: suffixText,
          prefixText: prefixText,
        ),
      ),
    );
  }
}
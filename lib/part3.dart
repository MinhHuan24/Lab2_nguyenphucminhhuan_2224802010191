import 'package:flutter/material.dart';

// --- MÀN HÌNH CHÍNH ---
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home Screen')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('This is the Home Screen', style: TextStyle(fontSize: 18)),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Điều hướng sang trang Details
                Navigator.pushNamed(context, '/details');
              },
              child: const Text('Go to Details Screen'),
            ),
          ],
        ),
      ),
    );
  }
}

// --- MÀN HÌNH CHI TIẾT ---
class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Details Screen'),
        backgroundColor: Colors.green, 
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('This is the Details Screen', style: TextStyle(fontSize: 18)),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Quay lại trang trước
                Navigator.pop(context);
              },
              child: const Text('Go back to Home Screen'),
            ),
          ],
        ),
      ),
    );
  }
}
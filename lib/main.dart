import 'package:flutter/material.dart';

import 'part1.dart'; 
import 'part2.dart'; 
import 'part3.dart' as part3; // Dùng 'as part3' để tránh trùng tên HomeScreen
import 'part4.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lab 2 App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.deepPurple,
          foregroundColor: Colors.white,
        ),
      ),
      // Thiết lập định tuyến (Routes)
      initialRoute: '/',
      routes: {
        '/': (context) => const MainMenuScreen(),
        '/layout': (context) => const Part1Screen(), 
        '/responsive': (context) => const Part2Screen(), // Code của thầy giáo Part 2
        '/navigation': (context) => const part3.HomeScreen(),
        '/details': (context) => const part3.DetailsScreen(), // Phải khai báo để Part 3 chuyển trang được
        '/form': (context) => const RegisterPage(), // Code Part 4
      },
    );
  }
}

class MainMenuScreen extends StatelessWidget {
  const MainMenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Lab 2 - Main Menu"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () => Navigator.pushNamed(context, '/layout'),
              child: const Text("Part 1: Layout Widgets"),
            ),
            const SizedBox(height: 15),
            ElevatedButton(
              onPressed: () => Navigator.pushNamed(context, '/responsive'),
              child: const Text("Part 2: Responsive Layout"),
            ),
            const SizedBox(height: 15),
            ElevatedButton(
              onPressed: () => Navigator.pushNamed(context, '/navigation'),
              child: const Text("Part 3: Navigation"),
            ),
            const SizedBox(height: 15),
            ElevatedButton(
              onPressed: () => Navigator.pushNamed(context, '/form'),
              child: const Text("Part 4: Form Application"),
            ),
          ],
        ),
      ),
    );
  }
}
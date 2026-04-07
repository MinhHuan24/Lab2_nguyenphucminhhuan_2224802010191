import 'package:flutter/material.dart';

class Part1Screen extends StatelessWidget {
  const Part1Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Part 1 - Layout Widgets"),
      ),
      body: Padding( // Task 3: Thêm padding
        padding: const EdgeInsets.all(16.0),
        child: Center(
          // Dùng SingleChildScrollView để đề phòng màn hình nhỏ bị lỗi tràn viền (overflow)
          child: SingleChildScrollView( 
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // TEXT
                const Text(
                  "I'm in a Column and Centered. The below is a row.",
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 20),

                // ROW
                Row(
                  mainAxisAlignment: MainAxisAlignment.center, // Task 1
                  children: [
                    Container(width: 70, height: 70, color: Colors.red),
                    const SizedBox(width: 10),
                    Container(width: 70, height: 70, color: Colors.green),
                    const SizedBox(width: 10),
                    Container(width: 70, height: 70, color: Colors.blue),
                  ],
                ),
                const SizedBox(height: 30),

                // STACK
                Stack(
                  alignment: Alignment.topLeft, // Task 2
                  children: [
                    Container(width: 250, height: 120, color: Colors.yellow),
                    const Padding(
                      padding: EdgeInsets.all(12),
                      child: Text(
                        "Stacked on Yellow Box",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 30),

                //Task 4: Replace loop with manual Containers
                // Thêm các Container được tạo thủ công
                Container(
                  color: Colors.purple[100],
                  height: 40,
                  width: 250,
                  margin: const EdgeInsets.only(bottom: 10),
                  child: const Center(child: Text("Manual Container 1")),
                ),
                Container(
                  color: Colors.purple[300],
                  height: 40,
                  width: 250,
                  margin: const EdgeInsets.only(bottom: 10),
                  child: const Center(child: Text("Manual Container 2")),
                ),
                Container(
                  color: Colors.purple[500],
                  height: 40,
                  width: 250,
                  child: const Center(
                    child: Text("Manual Container 3", style: TextStyle(color: Colors.white)),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
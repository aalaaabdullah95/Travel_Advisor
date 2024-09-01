import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        decoration: const BoxDecoration(color: Colors.amber
            // image: DecorationImage(
            //   fit: BoxFit.cover,
            //   image: AssetImage(
            //     'assets/d75251e44fe0404eefc905884c9a789c.jpg',
            //   ),
            // ),
            ),
      ),
    );
  }
}

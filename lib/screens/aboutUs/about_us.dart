import 'package:flutter/material.dart';

class AboutUsScreen extends StatelessWidget {
  const AboutUsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "About Us | TaxiGuard",
          style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 20,
          ),

        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          
        ],
      ),
    );
  }
}

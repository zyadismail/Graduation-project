// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:graduation_project/screens/report/report_screen.dart';

class ContactDetailsScreen extends StatelessWidget {
  const ContactDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff70ABD3),
      appBar: AppBar(
        backgroundColor: const Color(0xff70ABD3),
      ),
      body: Center(
        child: Column(
          children: [
            Image.asset(
              'assets/images/image_no_bg.png',
              height: 226,
              width: 218,
              fit: BoxFit.fill,
            ),
            const Text(
              "CONTACT DETAILS",
              style: TextStyle(
                color: Color(0xffE6E6E6),
                fontSize: 32,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Text(
              "Feel free to contact us any time. We will get back\n to you as soon as we can!",
              style: TextStyle(
                color: Color(0xffE6E6E6),
                fontWeight: FontWeight.w700,
                fontSize: 12,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 27,
            ),
            ContactButton(
              icon: Icons.report_outlined,
              title: "Report",
              subtitle: "Send a Report",
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const ReportScreen(),
                  ),
                );
              },
            ),
            const SizedBox(height: 15),
            ContactButton(
              icon: Icons.call,
              title: "Mobile",
              subtitle: "12345",
            ),
            const SizedBox(height: 15),
            ContactButton(
              icon: Icons.email,
              title: "Email",
              subtitle: "z@gmail.com",
            ),
          ],
        ),
      ),
    );
  }
}

class ContactButton extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  Function()? onTap;

  ContactButton({
    Key? key,
    required this.icon,
    required this.title,
    required this.subtitle,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      height: 65,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: Colors.white70,
          width: 1,
        ),
      ),
      child: ListTile(
        onTap: onTap,
        leading: Container(
          width: 45,
          height: 45,
          decoration: BoxDecoration(
              color: const Color(0xff3F3F3F),
              borderRadius: BorderRadius.circular(8)),
          child: Icon(
            icon,
            size: 35,
            color: Colors.white,
          ),
        ),
        title: Text(
          title,
          style: const TextStyle(
              color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
        ),
        subtitle: Text(
          subtitle,
          style: const TextStyle(
            color: Color(0xffD2D2D2),
            fontSize: 14,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}

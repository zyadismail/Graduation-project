// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:graduation_project/screens/account/widgets/Helper_widget.dart';
import 'package:graduation_project/screens/account/widgets/listTile_widget.dart';
import 'package:graduation_project/screens/contact_details/contact_details.dart';
import 'package:graduation_project/screens/profile/profile_screen.dart';
import 'package:graduation_project/screens/sign_in/sign_in_screen.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Ziad Ismail Mohamed',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        actions: [
          CircleAvatar(
            child: IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const ProfileScreen(),
                  ),
                );
              },
              icon: const Icon(
                Icons.person,
              ),
            ),
          ),
          IconButton(
            onPressed: () async {
              await FirebaseAuth.instance.signOut();
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                  builder: (_) => const SignInScreen(),
                ),
                (route) => false,
              );
            },
            icon: const Icon(Icons.logout),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 21, right: 21, top: 109),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                HelperWidgets(
                  img: 'assets/images/questionMark.png',
                  text: "Help",
                ),
                HelperWidgets(
                  img: 'assets/images/wallet.png',
                  text: "Wallet",
                ),
                HelperWidgets(
                  img: 'assets/images/activity.png',
                  text: "Activity",
                ),
              ],
            ),
            const SizedBox(
              height: 89,
            ),
            ListTitleWidget(
              icon: Icons.family_restroom,
              text: 'Family',
              onTap: () {},
            ),
            const SizedBox(
              height: 30,
            ),
            ListTitleWidget(
              icon: Icons.settings,
              text: 'Settings',
              onTap: () {},
            ),
            const SizedBox(
              height: 30,
            ),
            ListTitleWidget(
              icon: Icons.contact_mail,
              text: 'Contact Us',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const ContactDetailsScreen(),
                  ),
                );
              },
            ),
            const SizedBox(
              height: 30,
            ),
            ListTitleWidget(
              icon: Icons.check_outlined,
              text: 'Legal',
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}

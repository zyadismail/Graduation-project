// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:graduation_project/screens/aboutUs/about_us.dart';
import 'package:graduation_project/screens/account/widgets/Helper_widget.dart';
import 'package:graduation_project/screens/account/widgets/listTile_widget.dart';
import 'package:graduation_project/screens/contact_details/contact_details.dart';
import 'package:graduation_project/screens/profile/profile_screen.dart';

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
              onPressed: () {},
              icon: const Icon(
                Icons.person,
              ),
            ),
          ),
          const SizedBox(
            width: 15,
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 21, right: 21, top: 109),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
             Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (_)=> const AboutUsScreen()));
                  },
                  child: const HelperWidgets(
                    img: 'assets/images/questionMark.png',
                    text: "About Us",
                  ),
                ),
                const SizedBox(
                  width: 79,
                ),
                const HelperWidgets(
                  img: 'assets/images/activity.png',
                  text: "Activity",
                ),
              ],
            ),
            const SizedBox(
              height: 89,
            ),
            // ListTitleWidget(
            //   leading: Icons.family_restroom,
            //   text: 'Family',
            //   onTap: () {},
            // ),
            const SizedBox(
              height: 30,
            ),
            ListTitleWidget(
              leading: Icons.settings,
              text: 'Profile',
              onTap: () {
                  Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const ProfileScreen(),
                  ),
                );
              },
            ),
            const SizedBox(
              height: 30,
            ),
            ListTitleWidget(
              leading: Icons.contact_mail,
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
          ],
        ),
      ),
    );
  }
}

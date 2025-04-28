import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:graduation_project/screens/personial_details/personal_detials.dart';
import 'package:graduation_project/screens/profile/widgets/listTile_profile.dart';
import 'package:graduation_project/screens/sign_in/sign_in_screen.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Profile',
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: [
            const SizedBox(
              height: 58,
            ),
            const CircleAvatar(
              radius: 70,
              backgroundImage: AssetImage(
                'assets/images/robot.png',
              ),
            ),
            const SizedBox(
              height: 12,
            ),
            const Text(
              "Ziad ismail",
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 27,
              ),
            ),
            const Text(
              "ziadismail949@gmail.com",
              style: TextStyle(
                color: Colors.grey,
                fontWeight: FontWeight.w500,
                fontSize: 14,
              ),
            ),
            const SizedBox(
              height: 52,
            ),
            ListTileProfile(
              text: "Personal Details",
              leading: Icons.settings,
              trailing: Icons.arrow_forward,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const PersonalDetailsScreen(),
                  ),
                );
              },
            ),
            const SizedBox(
              height: 45,
            ),
            ListTileProfile(
              text: "Customer Support",
              leading: Icons.question_mark,
              trailing: Icons.arrow_forward,
              onTap: () {},
            ),
            const SizedBox(
              height: 45,
            ),
            ListTileProfile(
              text: "LogOut",
              leading: Icons.logout_outlined,
              onTap: () async{
                await FirebaseAuth.instance.signOut();
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                  builder: (_) => const SignInScreen(),
                ),
                (route) => false,
              );
              },
            ),
          ],
        ),
      ),
    );
  }
}

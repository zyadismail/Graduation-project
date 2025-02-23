import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:graduation_project/screens/account/account_screen.dart';
import 'package:graduation_project/screens/home/home_screen.dart';


class LayoutScreen extends StatefulWidget {
  const LayoutScreen({super.key});

  @override
  State<LayoutScreen> createState() => _LayoutScreenState();
}

class _LayoutScreenState extends State<LayoutScreen> {
  final screen = [const HomeScreen(), const AccountScreen()];
  int index = 0;
  @override
  Widget build(BuildContext context) {
    final items = <Widget>[
      const Icon(Icons.home, size: 30),
      const Icon(Icons.settings, size: 30),
    ];
    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
        color: const Color(0xffDADADA),
        backgroundColor: Colors.white,
        buttonBackgroundColor: const Color(0xff70ABD3),

        items: items,
        index: index,
        onTap: (value) {
          index = value;
          setState(() {});
        },
      ),
      body: screen[index],
    );
  }
}
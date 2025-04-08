import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Edit profile",
          style: TextStyle(fontWeight: FontWeight.w400, fontSize: 18),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 22, left: 27),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Account profile",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(
                height: 42,
              ),
              const Text("First Name"),
              const TextField(
                decoration: InputDecoration(
                    contentPadding: EdgeInsets.all(0),
                    border: OutlineInputBorder(borderSide: BorderSide.none),
                    hintText: 'Ziad'),
              ),
              const Divider(
                thickness: 2,
                color: Color(0xffD9D9D9),
              ),
              const SizedBox(
                height: 30,
              ),
              const Text("Last Name"),
              const TextField(
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.all(0),
                  border: OutlineInputBorder(borderSide: BorderSide.none),
                  hintText: 'ismail',
                ),
              ),
              const Divider(
                thickness: 2,
                color: Color(0xffD9D9D9),
              ),
              const SizedBox(
                height: 30,
              ),
              const Text("Phone number"),
              const TextField(
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.all(0),
                  border: OutlineInputBorder(borderSide: BorderSide.none),
                  hintText: '01153475072',
                ),
              ),
              const Divider(
                thickness: 2,
                color: Color(0xffD9D9D9),
              ),
              const SizedBox(
                height: 30,
              ),
              const Text("Email"),
              const TextField(
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.all(0),
                  border: OutlineInputBorder(borderSide: BorderSide.none),
                  hintText: "ziadismail949@gmail.com",
                ),
              ),
              const SizedBox(
                height: 100,
              ),
              Center(
                child: SizedBox(
                  height: 48,
                  width: 174,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xffEBEAEA)),
                    onPressed: () {},
                    child: const Text(
                      "Delete account",
                      style: TextStyle(
                        color: Colors.red,
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

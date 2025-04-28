import 'package:flutter/material.dart';

class PersonalDetailsScreen extends StatelessWidget {
  const PersonalDetailsScreen({super.key});

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
                    onPressed: () {
                      showDeleteAccountDialog(context);
                    },
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

  void showDeleteAccountDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => Dialog(
        alignment: Alignment.bottomCenter,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(Icons.warning_rounded, size: 48, color: Colors.red),
              const SizedBox(height: 16),
              const Text(
                "Permanently delete\n your account?",
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.w700,
                ),
                textAlign: TextAlign.start,
              ),
              const SizedBox(height: 12),
              const Text.rich(
                TextSpan(
                  text:
                      'This action will permanently delete your account and profile information from Taxi Guard',
                  style: TextStyle(
                      fontSize: 20,
                      height: 1.5,
                      color: Color(0xff3F3F3F),
                      fontWeight: FontWeight.w400),
                ),
                textAlign: TextAlign.start,
              ),
              const SizedBox(height: 24),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  foregroundColor: Colors.white,
                  minimumSize: const Size.fromHeight(48),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text('Delete my account'),
              ),
              const SizedBox(height: 12),
              Center(
                child: TextButton(
                  
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text(
                    'Keep my account',
                    style: TextStyle(color: Colors.black),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class ListTitleWidget extends StatelessWidget {
  final IconData leading;
   IconData? trailing;
  final Function()? onTap;
  final String text;
   ListTitleWidget({
    super.key,
    required this.leading,
    required this.onTap,
    required this.text,
    this.trailing
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.all(0),
      onTap: onTap,
      leading: Icon(
        leading,
        size: 30,
      ),
      title: Text(
        text,
        style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
      ),
      trailing: Icon(trailing),
      horizontalTitleGap: 30,
    );
  }
}
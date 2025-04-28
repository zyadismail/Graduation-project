import 'package:flutter/material.dart';

class ListTileProfile extends StatelessWidget {
  final IconData leading;
  IconData? trailing;
  final String text;
  void Function()? onTap;
  ListTileProfile(
      {super.key,
      required this.text,
      required this.leading,
      this.trailing,
      required this.onTap,});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(
        horizontal: 34,
      ),
      onTap: onTap,
      title: Text(
        text,
        style: const TextStyle(
          fontSize: 18.37,
          fontWeight: FontWeight.w500,
        ),
      ),
      leading: Icon(
        leading,
        size: 30,
      ),
      trailing: Icon(
        trailing,
        size: 20,
      ),
    );
  }
}
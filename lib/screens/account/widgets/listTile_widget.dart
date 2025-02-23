import 'package:flutter/material.dart';

class ListTitleWidget extends StatelessWidget {
  final IconData icon;
  final Function()? onTap;
  final String text;
  const ListTitleWidget({
    super.key,
    required this.icon,
    required this.onTap,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.all(0),
      onTap: onTap,
      leading: Icon(
        icon,
        size: 30,
      ),
      title: Text(
        text,
        style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
      ),
      horizontalTitleGap: 30,
    );
  }
}
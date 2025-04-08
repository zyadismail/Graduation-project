import 'package:flutter/material.dart';

class HelperWidgets extends StatelessWidget {
  final String img  , text;

  const HelperWidgets({super.key, required this.img , required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 90,
      height: 90,
      decoration: BoxDecoration(
        color: const Color(0xffEBEAEA),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            img,
            height: 35,
            width: 35,
          ),
          Text(
            text,
            style: const TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 20,
            ),
          )
        ],
      ),
    );
  }
}
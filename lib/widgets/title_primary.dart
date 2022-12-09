import 'package:flutter/material.dart';

class TitlePrimary extends StatelessWidget {
  const TitlePrimary({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: const TextStyle(
          color: Colors.white,
          fontSize: 30,
          fontFamily: "Lato",
          fontWeight: FontWeight.bold),
    );
  }
}

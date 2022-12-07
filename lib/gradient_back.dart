import 'package:flutter/material.dart';

class GradientBack extends StatelessWidget {
  final String title;

  GradientBack({this.title = "Popular"});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250,
      width: double.infinity,
      decoration: const BoxDecoration(
          gradient: LinearGradient(
              colors: [Color(0xff4268D3), Color(0xff584CD1)],
              begin: FractionalOffset(0.2, 0.0),
              end: FractionalOffset(1.0, 0.6),
              stops: [0.0, 0.6],
              tileMode: TileMode.clamp)),
      alignment: const Alignment(-0.9, -0.6),
      child: Text(title,
          style: const TextStyle(
              color: Colors.white,
              fontSize: 30,
              fontFamily: "Lato",
              fontWeight: FontWeight.bold)),
    );
  }
}
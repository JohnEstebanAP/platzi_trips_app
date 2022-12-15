import 'package:flutter/material.dart';

class GradientBackLogin extends StatelessWidget {
  final double height;

  const GradientBackLogin({super.key, this.height = 250.0});

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Container(
        height: height,
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: RadialGradient(
              colors: [
                Color(0xff4268D3),
                Color(0xf74268d3),
              ],
              center: Alignment(1, -0.3),
              radius: 1.4,
              stops: [0.5, 0.0],
              tileMode: TileMode.clamp),
        ),
      ),
    ]);
  }
}

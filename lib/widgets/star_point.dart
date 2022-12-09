import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class StarPoint extends StatelessWidget {
  late List<Container> listStars;
  final int numStars;
  final double sizeStars;

  StarPoint({super.key, required this.numStars, this.sizeStars = 15.0}) {
    listStars = List<Container>.generate(
        5, (index) => (index <= numStars - 1) ? _star() : _star_border());
  }

  @override
  Row build(BuildContext context) {
    return Row(
      children: listStars,
    );
  }

  Container _star_border() {
    return Container(
      margin: const EdgeInsets.only(
        top: 3.0,
        right: 3.0,
      ),
      child: Icon(
        size: sizeStars,
        Icons.star_border,
        color: const Color(0xFFf2C611),
      ),
    );
  }

  Container _star_half() {
    return Container(
      margin: const EdgeInsets.only(
        top: 3.0,
        right: 3.0,
      ),
      child: Icon(
        size: sizeStars,
        Icons.star_half,
        color: const Color(0xFFf2C611),
      ),
    );
  }

  Container _star() {
    return Container(
      margin: const EdgeInsets.only(
        top: 3.0,
        right: 3.0,
      ),
      child: Icon(
        size: sizeStars,
        Icons.star,
        color: Color(0xFFf2C611),
      ),
    );
  }
}

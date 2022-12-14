import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class TitleSecondary extends StatelessWidget {
  const TitleSecondary(
      {Key? key,
      required this.title,
      this.sizeText = 20,
      this.fontWeight,
      this.color,
      this.textAling = TextAlign.left})
      : super(key: key);

  final String title;
  final double sizeText;
  final TextAlign textAling;
  final FontWeight? fontWeight;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Container(
      margin: const EdgeInsets.only(left: 20.0),
      child: Text(
        title,
        textAlign: textAling,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(
            fontFamily: "Lato",
            fontSize: sizeText,
            color: color,
            fontWeight: fontWeight),
      ),
    );
  }
}

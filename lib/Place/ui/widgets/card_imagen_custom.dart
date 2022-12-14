import 'package:flutter/material.dart';

class CardImagenCustom extends StatelessWidget {
  const CardImagenCustom({
    Key? key,
    required this.pathImage,
    this.widthCardImage = 260.0,
    this.heightCardImage = 270.0,
    this.borderRadius = 20.0,
  }) : super(key: key);

  final double widthCardImage;
  final double heightCardImage;
  final String pathImage;
  final double borderRadius;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: heightCardImage,
      width: widthCardImage,
      margin: const EdgeInsets.only(left: 10.0, right: 10.0),
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage(pathImage),
        ),
        borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
        shape: BoxShape.rectangle,
        boxShadow: const <BoxShadow>[
          BoxShadow(
            color: Colors.black38,
            blurRadius: 15.0,
            offset: Offset(0.0, 7.0),
          )
        ],
      ),
    );
  }
}

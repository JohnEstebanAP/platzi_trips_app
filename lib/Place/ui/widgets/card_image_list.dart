import 'package:flutter/material.dart';

import '../../../widgets/card_image_with_fab_icon.dart';

class CardImageList extends StatelessWidget {
  const CardImageList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 270.0,
      child: ListView(
        padding: const EdgeInsets.all(25.0),
        scrollDirection: Axis.horizontal,
        children: const <Widget>[
          CardImageWithFabIcon(pathImage: "assets/img/img1.webp"),
          CardImageWithFabIcon(pathImage: "assets/img/img2.webp"),
          CardImageWithFabIcon(pathImage: "assets/img/img3.webp"),
          CardImageWithFabIcon(pathImage: "assets/img/img4.webp"),
          CardImageWithFabIcon(pathImage: "assets/img/img5.webp"),
          CardImageWithFabIcon(pathImage: "assets/img/img6.webp"),
          CardImageWithFabIcon(pathImage: "assets/img/img7.webp"),
          CardImageWithFabIcon(pathImage: "assets/img/img8.webp"),
          CardImageWithFabIcon(pathImage: "assets/img/img9.webp"),
          CardImageWithFabIcon(pathImage: "assets/img/img10.webp"),
        ],
      ),
    );
  }
}

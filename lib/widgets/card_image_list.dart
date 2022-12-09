import 'package:flutter/material.dart';
import 'package:platzi_trips_app/widgets/card_image.dart';

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
          CardImage(pathImage: "assets/img/img1.jpg"),
          CardImage(pathImage: "assets/img/img2.jpg"),
          CardImage(pathImage: "assets/img/img3.jpg"),
          CardImage(pathImage: "assets/img/img4.jpg"),
          CardImage(pathImage: "assets/img/img5.jpeg"),
          CardImage(pathImage: "assets/img/img6.jpg"),
          CardImage(pathImage: "assets/img/img7.jpg"),
          CardImage(pathImage: "assets/img/img8.jpg"),
          CardImage(pathImage: "assets/img/img9.jpg"),
          CardImage(pathImage: "assets/img/img10.jpg"),
        ],
      ),
    );
  }
}

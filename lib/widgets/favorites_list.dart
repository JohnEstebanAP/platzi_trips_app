import 'package:flutter/material.dart';
import 'package:platzi_trips_app/widgets/card_image_list.dart';
import 'package:platzi_trips_app/widgets/plase_favorite.dart';
import 'package:platzi_trips_app/widgets/review.dart';

import 'card_image.dart';

class FavoritesList extends StatelessWidget {
  const FavoritesList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Expanded(
      child: ListView(
        padding:
            const EdgeInsets.only(top: 20, bottom: 100, right: 20, left: 20),
        scrollDirection: Axis.vertical,
        children: const [
          PlaseFavorite(pathImage: "assets/img/img1.jpg"),
          PlaseFavorite(pathImage: "assets/img/img2.jpg"),
          PlaseFavorite(pathImage: "assets/img/img3.jpg"),
          PlaseFavorite(pathImage: "assets/img/img4.jpg"),
          PlaseFavorite(pathImage: "assets/img/img5.jpeg"),
          PlaseFavorite(pathImage: "assets/img/img6.jpg"),
          PlaseFavorite(pathImage: "assets/img/img7.jpg"),
          PlaseFavorite(pathImage: "assets/img/img8.jpg"),
          PlaseFavorite(pathImage: "assets/img/img9.jpg"),
          PlaseFavorite(pathImage: "assets/img/img10.jpg"),
        ],
      ),
    );
  }
}

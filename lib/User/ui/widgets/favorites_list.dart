import 'package:flutter/material.dart';
import 'package:platzi_trips_app/User/ui/widgets/plase_favorite.dart';

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
          PlaseFavorite(pathImage: "assets/img/img1.webp"),
          PlaseFavorite(pathImage: "assets/img/img2.webp"),
          PlaseFavorite(pathImage: "assets/img/img3.webp"),
          PlaseFavorite(pathImage: "assets/img/img4.webp"),
          PlaseFavorite(pathImage: "assets/img/img5.webp"),
          PlaseFavorite(pathImage: "assets/img/img6.webp"),
          PlaseFavorite(pathImage: "assets/img/img7.webp"),
          PlaseFavorite(pathImage: "assets/img/img8.webp"),
          PlaseFavorite(pathImage: "assets/img/img9.webp"),
          PlaseFavorite(pathImage: "assets/img/img10.webp"),
        ],
      ),
    );
  }
}

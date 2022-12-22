import 'package:flutter/material.dart';
import 'package:platzi_trips_app/Place/models/place.dart';

import '../../../Place/ui/widgets/brief_description.dart';
import '../../../Place/ui/widgets/card_imagen_custom.dart';

class PlaceFavorite extends StatelessWidget {
  final Place place;

  const PlaceFavorite({Key? key, required this.place}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Container(
      height: size.height * 0.34,
      width: size.width,
      margin: const EdgeInsets.only(bottom: 20),
      child: Stack(
        children: [
          CardImagenCustom(
            pathImage: place.uriImage!,
            widthCardImage: size.width,
            heightCardImage: size.height * 0.26,
            borderRadius: 25,
          ),
          Align(
            alignment: const Alignment(0.0, 0.9),
            child: BriefDescription(
              namePlace: place.name ?? "",
              descriptionPlace: place.description,
              steps: "Heart ${place.likes}",
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:platzi_trips_app/widgets/brief_description.dart';

import 'card_imagen_custom.dart';
import 'floating_action_button_green.dart';

class PlaseFavorite extends StatelessWidget {
  final String pathImage;

  const PlaseFavorite({Key? key, this.pathImage = "assets/img/img10.jpg"})
      : super(key: key);

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
            pathImage: pathImage,
            widthCardImage: size.width,
            heightCardImage: size.height * 0.26,
            borderRadius: 25,
          ),
          const Align(
            alignment: Alignment(0.0, 0.9),
            child: BriefDescription(
              namePlace: "Knuckles Montains Range",
              descriptionPlace:
                  "Hiking Water tall hunting, Natural bath. \nScenary & Photography",
              steps: "Steps    123,123,123",
            ),
          ),
        ],
      ),
    );
  }
}

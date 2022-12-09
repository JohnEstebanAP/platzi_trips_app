import 'package:flutter/material.dart';
import 'package:platzi_trips_app/widgets/card_imagen_custom.dart';
import 'package:platzi_trips_app/widgets/floating_action_button_green.dart';

class CardImage extends StatelessWidget {
  final String pathImage;

  const CardImage({Key? key, this.pathImage = "assets/img/img10.jpg"})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: const Alignment(0.9, 1.1),
      children: [
        CardImagenCustom(pathImage: pathImage),
        FloatingActionButtonGreen(),
      ],
    );
  }
}

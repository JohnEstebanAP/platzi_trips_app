import 'package:flutter/material.dart';

import '../Place/ui/widgets/card_imagen_custom.dart';
import 'floating_action_button_green.dart';

class CardImageWithFabIcon extends StatelessWidget {
  final String pathImage;
  final IconData iconNoSeletion;
  final IconData iconSeletion;
  final VoidCallback? onPressedFabIcon;
  final double height;
  final double width;

  const CardImageWithFabIcon(
      {Key? key,
      required this.pathImage,
      this.iconNoSeletion = Icons.favorite,
      this.iconSeletion = Icons.favorite_border,
      this.onPressedFabIcon,
      this.height = 270.0,
      this.width = 260.0})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: const Alignment(0.9, 1.1),
      children: [
        CardImagenCustom(
          pathImage: pathImage,
          heightCardImage: height,
          widthCardImage: width,
        ),
        FloatingActionButtonGreen(
          iconNoSeletion: iconNoSeletion,
          iconSelection: iconSeletion,
          onPressedFabIcon: onPressedFabIcon,
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';

import '../widgets/card_image_list.dart';
import '../../../widgets/gradient_back.dart';

class HeaderAppbar extends StatelessWidget {
  const HeaderAppbar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const GradientBack(),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Padding(
              padding: EdgeInsets.only(top: 40, left: 20),
              child: Text(
                "Bienvenido",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontFamily: "Lato",
                    fontWeight: FontWeight.bold),
              ),
            ),
            CardImageList()
          ],
        ),
      ],
    );
  }
}

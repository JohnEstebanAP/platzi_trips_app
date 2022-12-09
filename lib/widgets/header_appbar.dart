import 'package:flutter/material.dart';
import 'package:platzi_trips_app/widgets/card_image_list.dart';
import 'package:platzi_trips_app/widgets/gradient_back.dart';

class HeaderAppbar extends StatelessWidget {
  const HeaderAppbar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        GradientBack(),
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

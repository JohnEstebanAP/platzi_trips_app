import 'package:flutter/material.dart';
import 'package:platzi_trips_app/widgets/card_image_list.dart';
import 'package:platzi_trips_app/widgets/gradient_back.dart';
import 'package:platzi_trips_app/widgets/review.dart';

class HeaderAppbarProfile extends StatelessWidget {
  const HeaderAppbarProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        GradientBack(),
        Column(
          children: const [
            Text(
              "Profile",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  fontFamily: "Lato",
                  fontWeight: FontWeight.bold),
            ),
          ],
        )
      ],
    );
  }
}

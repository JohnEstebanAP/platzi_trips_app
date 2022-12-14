import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:platzi_trips_app/widgets/star_point.dart';
import 'package:platzi_trips_app/widgets/title_secondary.dart';

class Review extends StatelessWidget {
  String pathImage = "assets/img/img10.webp";
  String userName = "Varuna Yasas";
  String details = "1 reviw 5 photos";
  String comment = "There is an amazing place in Sri Lanka";
  final numStars;

  Review({super.key, this.numStars});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        _photo(),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TitleSecondary(title: userName, sizeText: 17.0),
            Row(
              children: [
                TitleSecondary(
                  title: details,
                  sizeText: 13.0,
                  color: const Color(0xFFa3a5a7),
                ),
                const SizedBox(width: 5),
                StarPoint(numStars: numStars)
              ],
            ),
            TitleSecondary(
              title: comment,
              sizeText: 13.0,
            )
          ],
        )
      ],
    );
  }

  Container _photo() => Container(
        margin: const EdgeInsets.only(top: 20.0, left: 20.0),
        width: 80,
        height: 80,
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            image: DecorationImage(
              image: AssetImage(pathImage),
              fit: BoxFit.cover,
            )),
      );
}

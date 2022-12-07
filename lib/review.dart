import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:platzi_trips_app/star_point.dart';

class Review extends StatelessWidget {
  String pathImage = "assets/img/img10.jpg";
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
            _userDetails(text: userName, sizeText: 17.0),
            Row(
              children: [
                _userDetails(
                  text: details,
                  sizeText: 13.0,
                  color: const Color(0xFFa3a5a7),
                ),
                SizedBox(width: 5),
                StarPoint(numStars: numStars)
              ],
            ),
            _userDetails(
              text: comment,
              sizeText: 13.0,
            )
          ],
        )
      ],
    );
  }

  Column _userDetails(
      {required String text,
      required double sizeText,
      Color color = Colors.black,
      FontWeight? fontWeight}) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.only(left: 20.0),
          child: Text(
            text,
            textAlign: TextAlign.left,
            style: TextStyle(
                fontFamily: "Lato",
                fontSize: sizeText,
                color: color,
                fontWeight: fontWeight),
          ),
        ),
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

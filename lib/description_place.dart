import 'package:flutter/material.dart';
import 'package:platzi_trips_app/star_point.dart';

class DescriptionPlace extends StatelessWidget {
  String namePlace;
  int numStars;
  String descriptionPlace;

  DescriptionPlace(this.namePlace, this.numStars, this.descriptionPlace);

  @override
  Widget build(BuildContext context) {
    return _ContainerDescription();
  }

  Row _title_stars() {
    return Row(
      children: <Widget>[
        Text(
          namePlace,
          style: const TextStyle(
              fontSize: 30.0, fontWeight: FontWeight.w900, fontFamily: "Lato"),
          textAlign: TextAlign.left,
        ),
        const SizedBox(
          width: 10,
        ),
        StarPoint(numStars: numStars)
      ],
    );
  }

  Container _ContainerDescription() {
    return Container(
      margin: const EdgeInsets.only(top: 320.0, left: 20.0, right: 20.0),
      child: Column(
        children: [
          _title_stars(),
          Container(
            margin: EdgeInsets.symmetric(vertical: 10),
            child: Text(
              descriptionPlace,
              style: const TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.w300,
                  color: Color(0xFF56575a),
                  fontFamily: "Lato"),
              textAlign: TextAlign.left,
            ),
          )
        ],
      ),
    );
  }
}

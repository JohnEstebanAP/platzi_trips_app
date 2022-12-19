import 'package:flutter/material.dart';
import 'package:platzi_trips_app/widgets/button.dart';
import 'package:platzi_trips_app/widgets/star_point.dart';

class DescriptionPlace extends StatelessWidget {
  String namePlace;
  int numStars;
  String descriptionPlace;

  DescriptionPlace(this.namePlace, this.numStars, this.descriptionPlace,
      {super.key});

  @override
  Widget build(BuildContext context) {
    return _ContainerDescription();
  }

  Container _ContainerDescription() {
    return Container(
      margin: const EdgeInsets.only(top: 320.0, left: 20.0, right: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _title_stars(),
          _description(),
          Button(
            buttonText: "Navigate",
            onPressed: () {},
          )
        ],
      ),
    );
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
        Expanded(
          child: LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) {
              var sizeStars = (((constraints.maxWidth) / 5) - 6);
              //total del espacio disponible / las 5 estrellas - 6 de margen que tienen las estrellas
              if (sizeStars > 50) {
                sizeStars = sizeStars * 0.3;
              }

              //return Text(sizeStars.toString());
              return StarPoint(
                numStars: numStars,
                sizeStars: sizeStars,
              );
            },
          ),
        ),
      ],
    );
  }

  Container _description() {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: Text(
        descriptionPlace,
        style: const TextStyle(
            fontSize: 16.0,
            fontWeight: FontWeight.w300,
            color: Color(0xFF56575a),
            fontFamily: "Lato"),
        textAlign: TextAlign.left,
      ),
    );
  }
}

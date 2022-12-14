import 'package:flutter/material.dart';
import 'package:platzi_trips_app/widgets/floating_action_button_green.dart';
import 'package:platzi_trips_app/widgets/title_secondary.dart';

class BriefDescription extends StatelessWidget {
  final String namePlace;
  final String? descriptionPlace;
  final String? steps;

  const BriefDescription(
      {super.key, required this.namePlace, this.descriptionPlace, this.steps});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Container(
      width: size.width * 0.60,
      height: size.height * 0.14,
      padding: const EdgeInsets.only(bottom: 4),
      child: Card(
          elevation: 10,
          color: Colors.white,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          child: Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  setTitle(),
                  const SizedBox(height: 5),
                  setDescriptionPlase(),
                  const SizedBox(height: 5),
                  setSteps()
                ],
              ),
              Align(
                  alignment: const Alignment(0.8, 1.1),
                  child: FloatingActionButtonGreen(size: 35, isSelecte: true)),
            ],
          )),
    );
  }

  TitleSecondary setTitle() {
    return TitleSecondary(
      title: namePlace,
      sizeText: 16,
      fontWeight: FontWeight.bold,
    );
  }

  Widget setDescriptionPlase() {
    if (descriptionPlace != null) {
      return TitleSecondary(
        title: descriptionPlace!,
        sizeText: 10.0,
        color: const Color(0xFFa3a5a7),
      );
    }
    return const SizedBox();
  }

  Widget setSteps() {
    if (steps != null) {
      return TitleSecondary(
        title: steps!,
        sizeText: 13,
        color: const Color(0xFFEBB551),
      );
    }
    return const SizedBox();
  }
}

import 'package:flutter/material.dart';
import 'package:platzi_trips_app/widgets/botton_navigation_bar_custom.dart';
import 'package:platzi_trips_app/widgets/gradient_back.dart';
import 'package:platzi_trips_app/widgets/header_profile.dart';
import 'package:platzi_trips_app/widgets/title_primary.dart';

class HeaderAppbarProfile extends StatelessWidget {
  const HeaderAppbarProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        GradientBack(),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              SizedBox(height: 20),
              TitlePrimary(title: "Profile"),
              SizedBox(height: 10),
              HeaderProfile(
                  pathImage: "assets/img/img7.jpg",
                  userName: "Pathum Tzoo",
                  details: "pathumzoo1@gmail.com"),
              SizedBox(height: 10),
              BottonNavigationBarCustom()
            ],
          ),
        ),
      ],
    );
  }
}

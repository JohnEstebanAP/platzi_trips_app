import 'package:flutter/material.dart';
import 'package:platzi_trips_app/widgets/title_secondary.dart';

class HeaderProfile extends StatelessWidget {
  final String? pathImage;
  final String? userName;
  final String? details;

  const HeaderProfile({super.key, this.pathImage, this.userName, this.details});

  @override
  Widget build(BuildContext context) {
    return _infoUser();
  }

  Row _infoUser() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [_photo(), _nameEmail()],
    );
  }

  Column _nameEmail() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TitleSecondary(
          title: userName!,
          sizeText: 18.0,
          color: Colors.white,
        ),
        TitleSecondary(
          title: details!,
          sizeText: 15.0,
          color: const Color(0xFFa3a5a7),
        ),
      ],
    );
  }

  Card _photo() => Card(
        shape: const CircleBorder(
            side: BorderSide(width: 1.5, color: Colors.white)),
        child: Container(
          width: 80,
          height: 80,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            image: DecorationImage(
              image: AssetImage(
                  (pathImage != null) ? pathImage! : "assets/img/img8.jpg"),
              fit: BoxFit.cover,
            ),
          ),
        ),
      );
}

import 'package:flutter/material.dart';
import 'package:platzi_trips_app/User/model/user.dart';
import 'package:platzi_trips_app/widgets/title_secondary.dart';

class UserInfo extends StatelessWidget {
  final UserModel user;

  const UserInfo({super.key, required this.user});

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
          title: user.name!,
          sizeText: 18.0,
          color: Colors.white,
        ),
        TitleSecondary(
          title: user.email!,
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
              image: NetworkImage((user.photoURL != null)
                  ? user.photoURL!
                  : "https://s1.1zoom.me/big3/471/Painting_Art_Back_view_Photographer_575380_3840x2400.jpg"),
              fit: BoxFit.cover,
            ),
          ),
        ),
      );
}

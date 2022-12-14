import 'package:flutter/material.dart';
import 'package:platzi_trips_app/User/ui/screens/header_appbar_profile.dart';
import 'package:platzi_trips_app/User/ui/widgets/favorites_list.dart';

class ProfileTrips extends StatelessWidget {
  const ProfileTrips({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(children: const [
      HeaderAppbarProfile(),
      Padding(
        padding: EdgeInsets.only(top: 250),
        child: FavoritesList(),
      )
    ]);
  }
}

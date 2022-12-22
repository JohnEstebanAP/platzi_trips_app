import 'package:flutter/material.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:platzi_trips_app/User/bloc/bloc_user.dart';
import 'package:platzi_trips_app/User/model/user.dart';
import 'package:platzi_trips_app/User/ui/screens/header_appbar_profile.dart';
import 'package:platzi_trips_app/User/ui/widgets/favorites_list.dart';

class ProfileTrips extends StatelessWidget {
  ProfileTrips({Key? key}) : super(key: key);

  late BlocUser blocUser;

  @override
  Widget build(BuildContext context) {
    blocUser = BlocProvider.of<BlocUser>(context);

    return StreamBuilder(
        stream: blocUser.authStatus,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.active:
            case ConnectionState.done:
              return showProfileData(snapshot);
              break;
            case ConnectionState.waiting:
            case ConnectionState.none:
            default:
              return setLoading();
              break;
          }
        });
  }

  Center setLoading() {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }

  Stack showProfileData(AsyncSnapshot snapshot) {
    if (!snapshot.hasData || snapshot.hasError) {
      return Stack(
        children: const [Text("Usuario no logeado. Haz Login")],
      );
    }

    print("Logeado");

    UserModel user = UserModel(
      id: snapshot.data.uid,
      name: snapshot.data.displayName,
      email: snapshot.data.email,
      photoURL: snapshot.data.photoURL,
    );

    return Stack(children: [
      HeaderAppbarProfile(user: user),
      Padding(
        padding: const EdgeInsets.only(top: 250),
        child: FavoritesList(user: user),
      )
    ]);
  }
}

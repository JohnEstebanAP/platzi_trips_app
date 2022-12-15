import 'package:flutter/material.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:platzi_trips_app/User/bloc/bloc_user.dart';
import 'package:platzi_trips_app/User/model/user.dart';
import 'package:platzi_trips_app/User/ui/widgets/botton_navigation_bar_custom.dart';
import 'package:platzi_trips_app/User/ui/widgets/user_info.dart';
import 'package:platzi_trips_app/widgets/gradient_back.dart';
import 'package:platzi_trips_app/widgets/title_primary.dart';

class HeaderAppbarProfile extends StatelessWidget {
  late BlocUser userBloc;
  late UserModel user;

  @override
  Widget build(BuildContext context) {
    userBloc = BlocProvider.of<BlocUser>(context);

    return StreamBuilder(
        stream: userBloc.streamFirebase,
        builder: (_, AsyncSnapshot snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.waiting:
            case ConnectionState.none:
              return _awaitLoginAndData();
            case ConnectionState.active:
            case ConnectionState.done:
              return showProfileData(snapshot);
          }
        });
  }

  Widget showProfileData(AsyncSnapshot snapshot) {
    if (!snapshot.hasData || snapshot.hasError) {
      print("No logeado");
      return _awaitLoginAndData();
    } else {
      print("Logeado");
      user = UserModel(
        id: snapshot.data.uid,
        name: snapshot.data.displayName,
        email: snapshot.data.email,
        photoURL: snapshot.data.photoURL,
      );
      return _headerAppbarProfile(user);
    }
  }

  Container _awaitLoginAndData() {
    return Container(
      margin: const EdgeInsets.only(top: 50, left: 20, right: 20),
      child: Column(
        children: const [
          CircularProgressIndicator(),
          Text("Cargando la información...")
        ],
      ),
    );
  }

  Stack _headerAppbarProfile(UserModel user) {
    return Stack(
      children: [
        const GradientBack(height: 350.0),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              const TitlePrimary(title: "Profile"),
              const SizedBox(height: 10),
              UserInfo(user: user),
              const BottonNavigationBarCustom(),
              const SizedBox(height: 10)
            ],
          ),
        ),
      ],
    );
  }
}

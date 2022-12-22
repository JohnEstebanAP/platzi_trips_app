import 'package:flutter/material.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:platzi_trips_app/User/bloc/bloc_user.dart';
import 'package:platzi_trips_app/User/model/user.dart';

class FavoritesList extends StatelessWidget {
  late BlocUser blocUser;
  final UserModel user;

  FavoritesList({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    blocUser = BlocProvider.of<BlocUser>(context);
    var size = MediaQuery.of(context).size;

    return Expanded(
      child: StreamBuilder(
        stream: blocUser.myPlacesListStream(user.id),
        builder: (BuildContext context, AsyncSnapshot snapShot) {
          switch (snapShot.connectionState) {
            case ConnectionState.active:
            case ConnectionState.done:
              return ListView(
                  padding: const EdgeInsets.only(
                      top: 20, bottom: 100, right: 20, left: 20),
                  scrollDirection: Axis.vertical,
                  children: blocUser.buildMyPlaces(snapShot.data.docs));
            case ConnectionState.none:
            case ConnectionState.waiting:
            default:
              return loading();
          }
        },
      ),
    );
  }

  Center loading() {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }
}

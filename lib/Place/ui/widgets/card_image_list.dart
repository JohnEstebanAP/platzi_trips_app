import 'package:flutter/material.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:platzi_trips_app/User/bloc/bloc_user.dart';

import '../../../widgets/card_image_with_fab_icon.dart';

class CardImageList extends StatelessWidget {
  CardImageList({Key? key}) : super(key: key);

  late BlocUser blocUser;

  @override
  Widget build(BuildContext context) {
    blocUser = BlocProvider.of<BlocUser>(context);

    return SizedBox(
        height: 270.0,
        child: StreamBuilder(
            stream: blocUser.placesStream,
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              switch (snapshot.connectionState) {
                case ConnectionState.active:
                case ConnectionState.done:
                  return listViewPlaces(
                      blocUser.buildPlaces(snapshot.data.docs));
                  break;
                case ConnectionState.waiting:
                case ConnectionState.none:
                default:
                  return setLoading();
                  break;
              }
            }));
  }

  ListView listViewPlaces(List<CardImageWithFabIcon> placesCard) {
    return ListView(
      padding: const EdgeInsets.all(25.0),
      scrollDirection: Axis.horizontal,
      children: placesCard,
    );
  }

  Center setLoading() {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }
}

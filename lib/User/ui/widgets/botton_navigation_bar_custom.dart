import 'dart:io';

import 'package:flutter/material.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:image_picker/image_picker.dart';
import 'package:platzi_trips_app/Place/ui/screens/add_place_screen.dart';
import 'package:platzi_trips_app/User/bloc/bloc_user.dart';
import 'package:platzi_trips_app/User/ui/screens/profile_trips.dart';

class BottonNavigationBarCustom extends StatefulWidget {
  const BottonNavigationBarCustom({Key? key}) : super(key: key);

  @override
  State<BottonNavigationBarCustom> createState() =>
      _BottonNavigationBarCustomState();
}

class _BottonNavigationBarCustomState extends State<BottonNavigationBarCustom> {
  late BlocUser userBloc;

  int indexTap = 1;

  void onTapTapped(int index) {
    setState(() {
      indexTap = index;
      switch (index) {
        case 0:
          break;
        case 1:
          File image;
          ImagePicker().pickImage(source: ImageSource.camera).then((image) {
            if (image?.path != null) {
              Navigator.push(context,
                  MaterialPageRoute(builder: (BuildContext context) {
                return AddPlaceScreen(image: File(image!.path));
              })).catchError((onError) => print(onError));
            }
          });
          break;
        case 2:
          userBloc.signOut();
          break;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    userBloc = BlocProvider.of(context);
    var listItems = [
      (indexTap == 0)
          ? BottomNavigationBarItem(
              icon: _iconCustom(50, Colors.white, Icons.vpn_key), label: "")
          : BottomNavigationBarItem(
              icon: _iconCustom(35, Colors.white60, Icons.vpn_key), label: ""),
      (indexTap == 1)
          ? BottomNavigationBarItem(
              icon: _iconCustom(50, Colors.white, Icons.add), label: "")
          : BottomNavigationBarItem(
              icon: _iconCustom(35, Colors.white60, Icons.add), label: ""),
      (indexTap == 2)
          ? BottomNavigationBarItem(
              icon: _iconCustom(50, Colors.white, Icons.exit_to_app), label: "")
          : BottomNavigationBarItem(
              icon: _iconCustom(35, Colors.white60, Icons.exit_to_app),
              label: ""),
    ];
    return Theme(
      data: Theme.of(context).copyWith(
        canvasColor: Colors.transparent,
        primaryColor: Colors.purple,
      ),
      child: BottomNavigationBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        currentIndex: indexTap,
        selectedFontSize: 0,
        onTap: onTapTapped,
        items: listItems,
      ),
    );
  }

  Container _iconCustom(double size, Color color, IconData icon) {
    return Container(
      height: size,
      width: size,
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.circle,
      ),
      child: Icon(icon, color: Colors.blue),
    );
  }
}

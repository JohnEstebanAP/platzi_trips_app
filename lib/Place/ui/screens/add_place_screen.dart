import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:image_picker/image_picker.dart';
import 'package:platzi_trips_app/Place/models/place.dart';
import 'package:platzi_trips_app/Place/ui/widgets/card_imagen_custom.dart';
import 'package:platzi_trips_app/Place/ui/widgets/title_input_location.dart';
import 'package:platzi_trips_app/User/bloc/bloc_user.dart';
import 'package:platzi_trips_app/widgets/button.dart';
import 'package:platzi_trips_app/widgets/card_image_with_fab_icon.dart';
import 'package:platzi_trips_app/widgets/gradient_back.dart';
import 'package:platzi_trips_app/widgets/text_input.dart';
import 'package:platzi_trips_app/widgets/title_primary.dart';
import 'package:platzi_trips_app/widgets/title_secondary.dart';

class AddPlaceScreen extends StatefulWidget {
  final File? image;

  const AddPlaceScreen({Key? key, required this.image}) : super(key: key);

  @override
  State<AddPlaceScreen> createState() => _AddPlaceScreenState();
}

class _AddPlaceScreenState extends State<AddPlaceScreen> {
  @override
  Widget build(BuildContext context) {
    BlocUser blocUser = BlocProvider.of<BlocUser>(context);

    final TextEditingController _controllerTitlePlace = TextEditingController();
    final TextEditingController _controllerDescriptionPlace =
        TextEditingController();
    final TextEditingController _controllerLocationPlace =
        TextEditingController();

    return Scaffold(
      body: Stack(children: [
        const GradientBack(),
        Row(
          children: <Widget>[
            Container(
              padding: const EdgeInsets.only(top: 25, left: 5.0),
              child: SizedBox(
                width: 45,
                height: 45,
                child: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(
                    Icons.keyboard_arrow_left,
                    color: Colors.white,
                    size: 45,
                  ),
                ),
              ),
            ),
            const Flexible(
              child: Padding(
                padding: EdgeInsets.only(top: 45, left: 20, right: 10),
                child: TitlePrimary(title: "Add a new Place"),
              ),
            ),
          ],
        ),
        Container(
          margin: EdgeInsets.only(top: 120, bottom: 20),
          child: ListView(
            children: [
              Container(
                margin:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                alignment: Alignment.center,
                child: CardImageWithFabIcon(
                  width: double.infinity,
                  height: 250.0,
                  pathImage: widget.image?.path ?? "assets/img/img10.webp",
                  iconNoSeletion: Icons.photo_camera,
                  iconSeletion: Icons.photo_camera_outlined,
                ),
              ),
              Container(
                margin: EdgeInsets.only(bottom: 20.0),
                child: TextInput(
                  hintText: "Title",
                  inputType: TextInputType.name,
                  maxLines: 1,
                  controller: _controllerTitlePlace,
                ),
              ),
              TextInput(
                hintText: "Description",
                inputType: TextInputType.multiline,
                maxLines: 6,
                controller: _controllerDescriptionPlace,
              ),
              Container(
                margin: const EdgeInsets.only(top: 20.0),
                child: TextInputLocation(
                    hintText: "Location",
                    controller: _controllerLocationPlace,
                    iconData: Icons.location_on_outlined),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 20),
                child: Button(
                  buttonText: "Add Place",
                  onPressed: addPlace(blocUser, _controllerTitlePlace,
                      _controllerDescriptionPlace),
                ),
              )
            ],
          ),
        ),
      ]),
    );
  }

  addPlace(BlocUser blocUser, TextEditingController _controllerTitlePlace,
      TextEditingController _controllerDescriptionPlace) {
    //ID del usuario logeado
    blocUser.currentUser.then((user) {
      if (user != null) {
        String uid = user.uid;
        String path = "${uid}/${DateTime.now().toString()}.jpg";
        //1. Firebase Store
        //url -
        blocUser
            .uploadFile(path, widget.image!)
            .then((UploadTask storageUploadTask) {
          storageUploadTask.then((TaskSnapshot snapshot) {
            snapshot.ref.getDownloadURL().then((urlImage) {
              print("URLIMAGE: ${urlImage}");
              //2. Cloud Firestore
              //Place - title, description, url, user , owner
              blocUser
                  .updatePlaceData(Place(
                name: _controllerTitlePlace.text,
                description: _controllerDescriptionPlace.text,
                likes: 0,
              ))
                  .whenComplete(() {
                print("Termino");
                Navigator.pop(context);
              });
            });
          });
        });
      }
    });
  }
}

import 'dart:io';
import 'dart:math';

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
  const AddPlaceScreen({Key? key}) : super(key: key);

  @override
  State<AddPlaceScreen> createState() => _AddPlaceScreenState();
}

class _AddPlaceScreenState extends State<AddPlaceScreen> {
  late BlocUser userBloc;
  late String image;

  @override
  void dispose() {
    // TODO: implement dispose
    userBloc.streamControllerImagePlace.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    userBloc = BlocProvider.of<BlocUser>(context);

    //image = userBloc.imagePlace;
    final TextEditingController _controllerTitlePlace = TextEditingController();
    final TextEditingController _controllerDescriptionPlace =
        TextEditingController();
    final TextEditingController _controllerLocationPlace =
        TextEditingController();

    return Scaffold(
      body: Stack(children: [
        const GradientBack(),
        _appBar(context),
        Container(
          margin: const EdgeInsets.only(top: 120, bottom: 20),
          child: ListView(
            children: [
              Container(
                margin:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                alignment: Alignment.center,
                child: StreamBuilder(
                    stream: userBloc.streamControllerImagePlace.stream,
                    builder: (BuildContext context, snapShot) {
                      if (!snapShot.hasError && snapShot.hasData) {
                        image = snapShot.data!;
                        return CardImageWithFabIcon(
                          width: double.infinity,
                          height: 250.0,
                          pathImage: image,
                          iconNoSeletion: Icons.photo_camera,
                          iconSeletion: Icons.photo_camera_outlined,
                          onPressedFabIcon: () async {
                            final pickedFile = await ImagePicker().pickImage(
                                source: ImageSource.camera, imageQuality: 100);
                            if (pickedFile == null) {
                              print("No selecciono nada");
                              return;
                            }
                            print("Imagen tomada ${pickedFile.path}");
                            userBloc.updateSelectedImage(path: pickedFile.path);
                          },
                        );
                      } else {
                        Future.delayed(Duration(seconds: 2), () {
                          userBloc.updateSelectedImage();
                        });
                        return CircularProgressIndicator();
                      }
                    }),
              ),
              Container(
                margin: const EdgeInsets.only(bottom: 20.0),
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
                margin: const EdgeInsets.symmetric(horizontal: 20),
                child: Button(
                  buttonText: "Add Place",
                  onPressed: () {
                    //ID del usuario logeado
                    userBloc.currentUser.then((user) {
                      if (user != null) {
                        String uid = user.uid;
                        String path = "${uid}/${DateTime.now().toString()}.jpg";
                        //1. Firebase Store
                        //url -
                        userBloc
                            .uploadFile(path, File(image))
                            .then((UploadTask storageUploadTask) {
                          storageUploadTask.then((TaskSnapshot snapshot) {
                            snapshot.ref.getDownloadURL().then((urlImage) {
                              print("URLIMAGE: ${urlImage}");
                              //2. Cloud Firestore
                              //Place - title, description, url, user , owner
                              userBloc
                                  .updatePlaceData(Place(
                                name: _controllerTitlePlace.text,
                                description: _controllerDescriptionPlace.text,
                                uriImage: urlImage,
                                likes: 0,
                              ))
                                  .whenComplete(() {
                                print("Termino");
                                //userBloc.streamControllerImagePlace.close();
                                Navigator.pop(context);
                              });
                            });
                          });
                        });
                      }
                    });
                  },
                ),
              )
            ],
          ),
        ),
      ]),
    );
  }

  Row _appBar(BuildContext context) {
    return Row(
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
    );
  }
}

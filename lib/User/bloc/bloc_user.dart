import 'dart:async';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:platzi_trips_app/Place/models/place.dart';
import 'package:platzi_trips_app/Place/repository/firebase_storage_repository.dart';
import 'package:platzi_trips_app/User/model/user.dart';
import 'package:platzi_trips_app/User/repository/auth_repository.dart';
import 'package:platzi_trips_app/User/repository/cloud_firestore_api.dart';
import 'package:platzi_trips_app/User/repository/cloud_firestore_repository.dart';
import 'package:platzi_trips_app/User/ui/widgets/plase_favorite.dart';
import 'package:platzi_trips_app/widgets/card_image_with_fab_icon.dart';

class BlocUser implements Bloc {
  final AuthRepository _auth_repository = AuthRepository();

  //Flujo de datos - String
  //Stream - Firebase
  //StreamController
  Stream<User?> streamFirebase = FirebaseAuth.instance.authStateChanges();

  Stream<User?> get authStatus => streamFirebase;

  Future<User?> get currentUser async =>
      await FirebaseAuth.instance.currentUser;

  //Casos uso
  //1. SignIn a la aplicacion Google
  Future<UserCredential> singIn() => _auth_repository.signInFirebase();

  //Caso de uso 2
  //2. cerrar sesión
  signOut() => _auth_repository.signOut();

  //caso de uso 5
  //save image of place in Cloud Firestore
  final _firebaseStorageRepository = FirebaseStorageRepository();

  Future<UploadTask> uploadFile(String path, File image) =>
      _firebaseStorageRepository.uploadFile(path, image);

  //caso de uso 6 actualziraz imagen tomada
  StreamController<String> streamControllerImagePlace =
      StreamController<String>.broadcast();

  void updateSelectedImage({String path = "assets/img/img10.webp"}) {
    streamControllerImagePlace.add(path);
  }

  //Caso de uso
  //Registrar datos del  usuario en base de datos
  final _cloudFirestoreDataFirestore = CloudFirestoreRepository();

  void updateUserData(UserModel user) =>
      _cloudFirestoreDataFirestore.updateUserDataFirestore(user);

  //add new place
  Future<void> updatePlaceData(Place place) =>
      _cloudFirestoreDataFirestore.updatePlaceDate(place);

  //actualizar places agregados por el usuario
  Stream<QuerySnapshot> placesListStream = FirebaseFirestore.instance
      .collection(CloudFirestoreApi().PLACES)
      .snapshots();

  Stream<QuerySnapshot> get placesStream => placesListStream;

  List<PlaceFavorite> buildMyPlaces(
          List<DocumentSnapshot> placesListSnapshot) =>
      _cloudFirestoreDataFirestore.buildMyPlaces(placesListSnapshot);

  List<CardImageWithFabIcon> buildPlaces(
          List<DocumentSnapshot> placesListSnapshot) =>
      _cloudFirestoreDataFirestore.buildPlaces(placesListSnapshot);

  Stream<QuerySnapshot> myPlacesListStream(String uid) => FirebaseFirestore
      .instance
      .collection(CloudFirestoreApi().PLACES)
      .where("userOwner",
          isEqualTo: FirebaseFirestore.instance
              .doc("${CloudFirestoreApi().USERS}/$uid"))
      .snapshots();

  @override
  void dispose() {}
}

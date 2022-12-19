import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:platzi_trips_app/Place/models/place.dart';
import 'package:platzi_trips_app/Place/repository/firebase_storage_repository.dart';
import 'package:platzi_trips_app/User/model/user.dart';
import 'package:platzi_trips_app/User/repository/auth_repository.dart';
import 'package:platzi_trips_app/User/repository/cloud_firestore_repository.dart';

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

  //Caso de uso 3
  //3. Registrar usuario en base de datos
  final _cloudFirestoreDataFirestore = CloudFirestoreRepository();

  void updateUserData(UserModel user) =>
      _cloudFirestoreDataFirestore.updateUserDataFirestore(user);

  //Caso de uso 4
  //add new place
  Future<void> updatePlaceData(Place place) =>
      _cloudFirestoreDataFirestore.updatePlaceDate(place);

  //caso de uno 5
  //save image of place in Cloud Firestore
  final _firebaseStorageRepository = FirebaseStorageRepository();

  Future<UploadTask> uploadFile(String path, File image) =>
      _firebaseStorageRepository.uploadFile(path, image);

  @override
  void dispose() {}
}

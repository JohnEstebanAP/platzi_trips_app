import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:platzi_trips_app/Place/models/place.dart';

import '../model/user.dart';

class CloudFirestoreApi {
  final String USERS = "users";
  final String PLACES = "places";

  final FirebaseFirestore db = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  void updateUserData(UserModel user) async {
    DocumentReference ref = db.collection(USERS).doc(user.id);
    return ref.set({
      'id': user.id,
      'name': user.name,
      'email': user.email,
      'photoURL': user.photoURL,
      'myPlaces': user.myPlaces,
      'myFavoritePlaces': user.myFavoritePlaces,
      'lastSignIn': DateTime.now()
    }, SetOptions(merge: true));
  }

  Future<void> updatePlaceData(Place place) async {
    CollectionReference refPlaces = db.collection(PLACES);

    User? user = _auth.currentUser;

    await refPlaces.add({
      'name': place.name,
      'description': place.description,
      'likes': place.likes,
      'userOwner': "${USERS}/${user!.uid}", //reference
    });
  }
}

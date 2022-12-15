import 'package:cloud_firestore/cloud_firestore.dart';

import '../model/user.dart';

class CloudFirestoreApi {
  final String USERS = "users";
  final String PLACE = "places";

  final FirebaseFirestore db = FirebaseFirestore.instance;

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
}

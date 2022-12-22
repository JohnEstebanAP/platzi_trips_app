import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:platzi_trips_app/Place/models/place.dart';
import 'package:platzi_trips_app/User/ui/widgets/plase_favorite.dart';
import 'package:platzi_trips_app/widgets/card_image_with_fab_icon.dart';

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
      'urlImage': place.uriImage,
      'userOwner': db.doc("${USERS}/${user!.uid}"), //reference
    }).then((DocumentReference reference) {
      reference.get().then((DocumentSnapshot snapshot) {
        snapshot.id; //Id place Referencia array
        DocumentReference refUsers = db.collection(USERS).doc(user.uid);
        refUsers.update({
          'myPlaces':
              FieldValue.arrayUnion([db.doc("${PLACES}/${snapshot.id}")])
        });
      });
    });
  }

  List<PlaceFavorite> buildMyPlaces(List<DocumentSnapshot> placesListSnapshot) {
    List<PlaceFavorite> profileFavorite =
        List<PlaceFavorite>.empty(growable: true);
    placesListSnapshot.forEach((place) {
      profileFavorite.add(PlaceFavorite(
          place: Place(
              name: place["name"],
              description: place['description'],
              uriImage: place["urlImage"],
              likes: place['likes'])));
    });
    return profileFavorite;
  }

  List<CardImageWithFabIcon> buildPlaces(
      List<DocumentSnapshot> placesListSnapshot) {
    List<CardImageWithFabIcon> profileFavorite =
        List<CardImageWithFabIcon>.empty(growable: true);
    placesListSnapshot.forEach((place) {
      profileFavorite.add(CardImageWithFabIcon(
        pathImage: place["urlImage"],
        onPressedFabIcon: () {
          likePlace(place.id);
        },
      ));
    });
    return profileFavorite;
  }

  Future likePlace(String idPlace) async {
    await db.collection(PLACES).doc(idPlace).get().then((DocumentSnapshot ds) {
      int likes = ds["likes"];
      db.collection(PLACES).doc(idPlace).update({'likes': likes + 1});
    });
  }
}

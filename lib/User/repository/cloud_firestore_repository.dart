import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:platzi_trips_app/Place/models/place.dart';
import 'package:platzi_trips_app/User/model/user.dart';
import 'package:platzi_trips_app/User/repository/cloud_firestore_api.dart';
import 'package:platzi_trips_app/User/ui/widgets/plase_favorite.dart';
import 'package:platzi_trips_app/widgets/card_image_with_fab_icon.dart';

class CloudFirestoreRepository {
  final _clodFirestoreApi = CloudFirestoreApi();

  void updateUserDataFirestore(UserModel user) =>
      _clodFirestoreApi.updateUserData(user);

  Future<void> updatePlaceDate(Place place) =>
      _clodFirestoreApi.updatePlaceData(place);

  List<PlaceFavorite> buildMyPlaces(
          List<DocumentSnapshot> placesListSnapshot) =>
      _clodFirestoreApi.buildMyPlaces(placesListSnapshot);

  List<CardImageWithFabIcon> buildPlaces(
          List<DocumentSnapshot> placesListSnapshot) =>
      _clodFirestoreApi.buildPlaces(placesListSnapshot);
}

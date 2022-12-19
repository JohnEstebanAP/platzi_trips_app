import 'package:platzi_trips_app/Place/models/place.dart';
import 'package:platzi_trips_app/User/model/user.dart';
import 'package:platzi_trips_app/User/repository/cloud_firestore_api.dart';

class CloudFirestoreRepository {
  final _clodFirestoreApi = CloudFirestoreApi();

  void updateUserDataFirestore(UserModel user) =>
      _clodFirestoreApi.updateUserData(user);

  Future<void> updatePlaceDate(Place place) =>
      _clodFirestoreApi.updatePlaceData(place);
}

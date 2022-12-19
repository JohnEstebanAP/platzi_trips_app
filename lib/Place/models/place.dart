import 'package:firebase_auth/firebase_auth.dart';

class Place {
  String? id;
  User? userOwner;
  String? name;
  String? description;
  String? uriImage;
  int? likes;

  Place({
    this.id,
    this.userOwner,
    this.name,
    this.description,
    this.uriImage,
    this.likes,
  });
}

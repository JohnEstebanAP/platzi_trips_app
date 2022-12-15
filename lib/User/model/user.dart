import 'package:flutter/material.dart';
import 'package:platzi_trips_app/Place/models/place.dart';

class UserModel {
  final String id;
  final String? name;
  final String? email;
  final String? photoURL;
  final List<Place?>? myPlaces;
  final List<Place?>? myFavoritePlaces;

  UserModel({
    required this.id,
    this.name,
    this.email,
    this.photoURL,
    this.myPlaces,
    this.myFavoritePlaces,
  });
//myFavotitePlaces
//myPlace
}

import 'package:flutter/material.dart';
import 'package:platzi_trips_app/page/home_trips.dart';
import 'package:platzi_trips_app/page/platzi_trips.dart';
import 'package:platzi_trips_app/widgets/description_place.dart';
import 'package:platzi_trips_app/widgets/gradient_back.dart';
import 'package:platzi_trips_app/widgets/header_appbar.dart';
import 'package:platzi_trips_app/widgets/review_list.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const PlatziTrips(),
    );
  }
}

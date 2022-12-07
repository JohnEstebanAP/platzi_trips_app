import 'package:flutter/material.dart';
import 'package:platzi_trips_app/description_place.dart';
import 'package:platzi_trips_app/gradient_back.dart';
import 'package:platzi_trips_app/review_list.dart';

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
      home: Scaffold(
        body: Stack(
          children: [
            ListView(
              children: [
                DescriptionPlace("Duwili Ella", 3,
                    "Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commondo ligua eget dolor. Aenenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis. ultricies nec. pelientesque eu Pretium quis, sew. \n\nNulla consequat massa quis enim. Donec pede justo. frigillla vel, aliquet nec, vulputate eget. arcu. In enim justo, rhoncus ut. imperdiet a."),
                ReviewList()
              ],
            ),
            GradientBack(title: "Popular"),
          ],
        ),
      ),
    );
  }
}

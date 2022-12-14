import 'package:flutter/material.dart';

import '../widgets/description_place.dart';
import 'header_appbar.dart';
import '../widgets/review_list.dart';

class HomeTrips extends StatefulWidget {
  const HomeTrips({Key? key}) : super(key: key);

  @override
  State<HomeTrips> createState() => _HomeTripsState();
}

class _HomeTripsState extends State<HomeTrips> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ListView(
          children: [
            DescriptionPlace("Duwili Ella", 3,
                "Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commondo ligua eget dolor. Aenenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis. ultricies nec. pelientesque eu Pretium quis, sew. \n\nNulla consequat massa quis enim. Donec pede justo. frigillla vel, aliquet nec, vulputate eget. arcu. In enim justo, rhoncus ut. imperdiet a."),
            const ReviewList()
          ],
        ),
        const HeaderAppbar()
      ],
    );
  }
}

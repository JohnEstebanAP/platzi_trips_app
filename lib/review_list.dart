import 'package:flutter/cupertino.dart';
import 'package:platzi_trips_app/review.dart';

class ReviewList extends StatelessWidget {
  const ReviewList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Review(numStars: 3),
        Review(numStars: 2),
        Review(numStars: 5),
        Review(numStars: 5),
        Review(numStars: 4),
      ],
    );
  }
}

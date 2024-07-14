import 'package:flutter/material.dart';

class TaskRating extends StatelessWidget {
  final int rating;

  const TaskRating({required this.rating, super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
        children: makeStars()
    );
  }

  List<Icon> makeStars() {
    List<Icon> starsList = [];
    while (starsList.length < 5) {
      Icon star = Icon(
          starsList.length < rating
              ? Icons.star
              : Icons.star_border,
          size: 12, color: Colors.blue);
      starsList.add(star);
    }
    return starsList;
  }
}
import 'package:flutter/material.dart';
import 'package:poc_review_store/model/review.dart';
import 'package:poc_review_store/providers/reviews_provider.dart';
import 'package:provider/provider.dart';

class ReviewsAndroid extends StatefulWidget {
  @override
  _ReviewsAndroidState createState() => _ReviewsAndroidState();
}

class _ReviewsAndroidState extends State<ReviewsAndroid> {
  void fetchData() {
    Provider.of<ReviewsProvider>(context, listen: false)
        .getAndroidReviews()
        .then((value) {
      print(value);
    });
  }

  @override
  Widget build(BuildContext context) {
    fetchData();
    return Container(
      child: Text("Reviews do Android"),
    );
  }
}

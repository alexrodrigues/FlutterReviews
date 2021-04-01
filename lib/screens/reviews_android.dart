import 'package:flutter/material.dart';
import 'package:alert/alert.dart';
import 'package:poc_review_store/model/review.dart';
import 'package:poc_review_store/providers/reviews_provider.dart';
import 'package:poc_review_store/widget/review_list.dart';
import 'package:provider/provider.dart';

class ReviewsAndroid extends StatefulWidget {
  @override
  _ReviewsAndroidState createState() => _ReviewsAndroidState();
}

class _ReviewsAndroidState extends State<ReviewsAndroid> {
  bool _isLoading = true;
  List<Review> _reviews = [];

  void _fetchData() {
    _showLoading(true);
    Provider.of<ReviewsProvider>(context, listen: false)
        .getAndroidReviews()
        .then((value) {
      _reviews = value;
      _showLoading(false);
    }).catchError((e) {
      Alert(message: 'Error: ${e.toString()}').show();
      _showLoading(false);
    });
    ;
  }

  void _showLoading(bool isLoading) {
    setState(() {
      this._isLoading = isLoading;
    });
  }

  @override
  void initState() {
    super.initState();
    _fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return _isLoading
        ? Container(
            color: Colors.black87,
            child: Center(
              child: CircularProgressIndicator(),
            ),
          )
        : ReviewList(_reviews);
  }
}

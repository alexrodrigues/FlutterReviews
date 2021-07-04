import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:alert/alert.dart';
import 'package:poc_review_store/model/review.dart';
import 'package:poc_review_store/model/review_type.dart';
import 'package:poc_review_store/providers/reviews_provider.dart';
import 'package:poc_review_store/widget/review_list.dart';
import 'package:provider/provider.dart';

class ReviewsScreen extends StatefulWidget {
  final ReviewPlataform plataform;

  ReviewsScreen(this.plataform);

  @override
  _ReviewsScreenState createState() => _ReviewsScreenState();
}

class _ReviewsScreenState extends State<ReviewsScreen>
    with AutomaticKeepAliveClientMixin<ReviewsScreen> {
  bool _isLoading = true;
  List<Review> _reviews = [];

  void _fetchData() {
    if (_reviews.isEmpty) {
      _showLoading(true);
      Provider.of<ReviewsProvider>(context, listen: false)
          .getReviews(widget.plataform)
          .then((value) {
        _reviews = value;
        _showLoading(false);
      }).catchError((e) {
        Alert(message: 'Error: ${e.toString()}').show();
        _showLoading(false);
      });
    }
  }

  void _showLoading(bool isLoading) {
    setState(() {
      this._isLoading = isLoading;
    });
  }

  @override
  void initState() {
    _fetchData();
    super.initState();
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

  @override
  bool get wantKeepAlive => true;
}
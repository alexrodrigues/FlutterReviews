import 'package:flutter/material.dart';
import 'package:poc_review_store/model/review.dart';
import 'package:poc_review_store/widget/review_item.dart';

class ReviewList extends StatelessWidget {
  final List<Review> _reviewList;
  ReviewList(this._reviewList);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black87,
      child: ListView.builder(
        itemCount: _reviewList.length,
        itemBuilder: (ctx, index) {
          return ReviewItem(_reviewList[index]);
        },
      ),
    );
  }
}

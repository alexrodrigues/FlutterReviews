import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:poc_review_store/model/graph_info.dart';
import 'package:poc_review_store/model/review.dart';
import 'package:poc_review_store/model/review_type.dart';
import 'package:poc_review_store/model/review_vo.dart';

class ReviewsProvider with ChangeNotifier {
  static const String _BASE_URL = "https://poc-review-store.herokuapp.com/";

  Future<ReviewVo> getReviews(ReviewPlataform plataform) {
    if (plataform == ReviewPlataform.android) {
      return _getAndroidReviews();
    }
    return _getIosReviews();
  }

  Future<ReviewVo> _getAndroidReviews() {
    return http.get(Uri.parse(_BASE_URL + "reviews/android")).then(
      (value) {
        dynamic response = jsonDecode(value.body);
        notifyListeners();

        return _buildVo(response, true);
      },
    );
  }

  Future<ReviewVo> _getIosReviews() {
    return http.get(Uri.parse(_BASE_URL + "reviews/ios")).then(
      (value) {
        dynamic response = jsonDecode(value.body);
        notifyListeners();

        return _buildVo(response, false);
      },
    );
  }

  ReviewVo _buildVo(dynamic response, bool isAndroid) {
    GraphInfo graphInfo = GraphInfo(
        response["info"]["oneStar"],
        response["info"]["twoStar"],
        response["info"]["threeStar"],
        response["info"]["fourStar"],
        response["info"]["fiveStar"]);

    List<dynamic> list = response["reviews"];
    List<Review> reviews = [];
    list.forEach((element) {
      if (isAndroid) {
        reviews.add(
          Review(
            element["userName"],
            element["content"],
            element["userImage"],
          ),
        );
      } else {
        reviews.add(
          Review(element["userName"], element["review"], ""),
        );
      }
    });

    return ReviewVo(reviews, graphInfo);
  }
}

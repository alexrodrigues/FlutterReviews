import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:poc_review_store/model/review.dart';
import 'package:poc_review_store/model/review_type.dart';

class ReviewsProvider with ChangeNotifier {
  static const String _BASE_URL = "https://poc-review-store.herokuapp.com/";

  Future<List<Review>> getReviews(ReviewPlataform plataform) {
    if (plataform == ReviewPlataform.android) {
      return _getAndroidReviews();
    }
    return _getIosReviews();
  }

  Future<List<Review>> _getAndroidReviews() {
    return http.get(Uri.parse(_BASE_URL + "reviews/android")).then(
      (value) {
        List<dynamic> list = jsonDecode(value.body);
        List<Review> response = [];
        list.forEach((element) {
          response.add(Review(
              element["userName"], element["content"], element["userImage"]));
        });
        notifyListeners();

        return response;
      },
    );
  }

  Future<List<Review>> _getIosReviews() {
    return http.get(Uri.parse(_BASE_URL + "reviews/ios")).then(
      (value) {
        List<dynamic> list = jsonDecode(value.body);
        List<Review> response = [];
        list.forEach((element) {
          response.add(Review(element["userName"], element["review"], ""));
        });
        notifyListeners();

        return response;
      },
    );
  }
}

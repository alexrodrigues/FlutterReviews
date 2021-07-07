import 'package:poc_review_store/model/graph_info.dart';
import 'package:poc_review_store/model/review.dart';

class ReviewVo {
  final List<Review> reviews;
  final GraphInfo graphInfo;

  ReviewVo(
    this.reviews,
    this.graphInfo,
  );
}

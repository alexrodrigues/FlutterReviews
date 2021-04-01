import 'package:flutter/material.dart';
import '../model/review.dart';

class ReviewItem extends StatelessWidget {
  final Review _review;

  ReviewItem(this._review);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 16.0, right: 16.0),
      child: _review.imageUrl.isNotEmpty
          ? Card(
              child: ListTile(
                leading: CircleAvatar(
                  child: Image.network(
                    _review.imageUrl,
                    fit: BoxFit.cover,
                  ),
                ),
                title: Text(
                  _review.name,
                  style: TextStyle(fontSize: 13.0),
                ),
                subtitle: Text(
                  _review.content,
                  style: TextStyle(fontSize: 11.0, color: Colors.grey),
                ),
              ),
            )
          : Card(
              child: ListTile(
                title: Text(
                  _review.name,
                  style: TextStyle(fontSize: 13.0),
                ),
                subtitle: Text(
                  _review.content,
                  style: TextStyle(fontSize: 11.0, color: Colors.grey),
                ),
              ),
            ),
    );
  }
}

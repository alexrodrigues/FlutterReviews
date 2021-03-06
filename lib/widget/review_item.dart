import 'package:flutter/material.dart';
import '../model/review.dart';

class ReviewItem extends StatelessWidget {
  final Review _review;

  ReviewItem(this._review);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: _review.imageUrl.isNotEmpty
          ? Card(
              child: Container(
                padding: EdgeInsets.only(top: 8, bottom: 8),
                child: ListTile(
                  leading: Container(
                    width: 50,
                    height: 50,
                    child: CircleAvatar(
                      child: Image.network(
                        _review.imageUrl,
                        fit: BoxFit.cover,
                      ),
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
              ),
            )
          : Card(
              child: Container(
                padding: EdgeInsets.only(top: 2, bottom: 8),
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
            ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:poc_review_store/model/review_type.dart';
import 'reviews_screen.dart';

class HomeTabs extends StatefulWidget {
  @override
  _HomeTabsState createState() => _HomeTabsState();
}

class _HomeTabsState extends State<HomeTabs> {
  static const _ANDROID_TAB = "_ANDROID_TAB";
  static const _IOS_TAB = "_IOS_TAB";

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          brightness: Brightness.dark,
          title: Text(
            "Reviews",
          ),
          bottom: TabBar(
            isScrollable: true,
            tabs: [
              Tab(
                text: 'Android',
              ),
              Tab(
                text: 'iPhone',
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            Container(
              key: ValueKey(_ANDROID_TAB),
              child: ReviewsScreen(ReviewPlataform.android),
            ),
            Container(
              key: ValueKey(_IOS_TAB),
              child: ReviewsScreen(ReviewPlataform.ios),
            ),
          ],
        ),
      ),
    );
  }
}

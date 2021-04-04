import 'package:flutter/material.dart';
import './reviews_android.dart';
import './reviews_ios.dart';

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
              child: ReviewsAndroid(),
            ),
            Container(
              key: ValueKey(_IOS_TAB),
              child: ReviewsIos(),
            ),
          ],
        ),
      ),
    );
  }
}

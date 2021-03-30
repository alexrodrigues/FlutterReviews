import 'package:flutter/material.dart';
import './reviews_android.dart';
import './reviews_ios.dart';

class HomeTabs extends StatefulWidget {
  @override
  _HomeTabsState createState() => _HomeTabsState();
}

class _HomeTabsState extends State<HomeTabs> {
  static const ROUTE_NAME = "HomeTabs";

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "Reviews",
          ),
          bottom: TabBar(
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
            ReviewsAndroid(),
            ReviewsIos(),
          ],
        ),
      ),
    );
  }
}

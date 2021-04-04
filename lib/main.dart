import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import './screens/tabs.dart';
import './providers/reviews_provider.dart';
import 'package:provider/provider.dart';
import 'package:color_to_material/color_to_material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  //
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: ReviewsProvider()),
      ],
      child: MaterialApp(
        title: 'Reviews',
        theme: ThemeData(
          primarySwatch: ColorToMaterial(Colors.black).getMaterialColor(),
          accentColor: Colors.amber,
          canvasColor: Color.fromRGBO(255, 254, 229, 1),
        ),
        initialRoute: '/',
        routes: {
          '/': (ctx) => HomeTabs(),
        },
      ),
    );
  }
}

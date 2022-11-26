import 'package:flutter/material.dart';
import 'package:uit_hackathon/main_app.dart';

final Map<String, WidgetBuilder> routes = {
  MainApp.routeName: (context) => const MainApp(),
};

MaterialPageRoute<dynamic>? generateRoutes(RouteSettings settings) {
  switch (settings.name) {
    // case AddDiaryScreen.routeName:
    //   final DateTime dateTime = settings.arguments as DateTime;
    //   return MaterialPageRoute<dynamic>(
    //     settings: settings,
    //     builder: (context) => AddDiaryScreen(
    //       dateTime: dateTime,
    //     ),
    //   );
  }
  return null;
}

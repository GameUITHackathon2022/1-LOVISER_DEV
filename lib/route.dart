import 'package:flutter/material.dart';

final Map<String, WidgetBuilder> routes = {};

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
}

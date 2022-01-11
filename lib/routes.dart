import 'package:flutter/widgets.dart';
import 'package:suitmedia_mobile/views/first/first_screen.dart';
import 'package:suitmedia_mobile/views/second/second_screen.dart';
import 'package:suitmedia_mobile/views/third/third_screen.dart';

final Map<String, WidgetBuilder> routes = {
  '/': (context) => FirstScreen(),
  SecondScreen.routeName: (context) => SecondScreen(),
  ThirdScreen.routeName: (context) => ThirdScreen(),
};

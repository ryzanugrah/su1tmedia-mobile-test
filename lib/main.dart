import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:suitmedia_mobile/routes.dart';
import 'package:suitmedia_mobile/theme.dart';
import 'package:suitmedia_mobile/views/first/first_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return OrientationBuilder(
          builder: (context, orientation) {
            return GetMaterialApp(
              title: 'Suitmedia Mobile',
              debugShowCheckedModeBanner: false,
              theme: theme(),
              initialRoute: FirstScreen.routeName,
              routes: routes,
            );
          },
        );
      },
    );
  }
}

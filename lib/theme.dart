import 'package:flutter/material.dart';
import 'package:suitmedia_mobile/constants.dart';

ThemeData theme() {
  return ThemeData(
    scaffoldBackgroundColor: Colors.white,
    fontFamily: "Poppins",
    appBarTheme: appBarTheme(),
    inputDecorationTheme: inputDecorationTheme(),
    visualDensity: VisualDensity.adaptivePlatformDensity,
  );
}

InputDecorationTheme inputDecorationTheme() {
  OutlineInputBorder outlineInputBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(12),
  );
  return InputDecorationTheme(
    floatingLabelBehavior: FloatingLabelBehavior.always,
    contentPadding: EdgeInsets.symmetric(horizontal: 20),
    border: outlineInputBorder,
  );
}

AppBarTheme appBarTheme() {
  return AppBarTheme(
    color: Colors.white,
    elevation: 0.3,
    centerTitle: true,
    iconTheme: IconThemeData(color: Color(0xFF554AF0)),
    titleTextStyle: TextStyle(
      color: primaryTextColor,
      fontFamily: 'Poppins',
      fontSize: 18,
      fontWeight: FontWeight.w600,
    )
  );
}

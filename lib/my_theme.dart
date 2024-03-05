
import 'package:flutter/material.dart';

class MyTheme {
  static Color primaryLightColor = Color(0xff39a552);
  static Color whiteColor = Color(0xffffffff);
  static Color redColor = Color(0xffc91c22);
  static Color darkBlueColor = Color(0xff002E90);
  static Color pinkColor = Color(0xffED1E79);
  static Color brownColor = Color(0xffCF7E48);
  static Color blueColor = Color(0xff4882CF);
  static Color yellowColor = Color(0xffF2D352);
  static Color greyColor = Color(0xff4F5A69);
  static Color blackColor = Color(0xff303030);

  static ThemeData LightTheme = ThemeData(
    primaryColor: primaryLightColor,
    appBarTheme: AppBarTheme(
      backgroundColor: primaryLightColor,
      centerTitle: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(40),
          bottomRight: Radius.circular(40),
        )
      )
    ),
    textTheme: TextTheme(
      titleLarge: TextStyle(
        fontSize: 22,
        fontWeight: FontWeight.bold,
        color: whiteColor,
      ),
      titleMedium: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: blackColor,
      ),
      titleSmall: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.bold,
        color: blackColor,
      ),
    ),
  );
}
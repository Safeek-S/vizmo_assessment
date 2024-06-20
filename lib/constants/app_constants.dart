import 'package:flutter/material.dart';

class AppConstants {
  static String baseUrl = "https://mock.apidog.com/m1/561191-524377-default",
      eventEndPoint = "/Event",
      token = "2f68dbbf-519d-4f01-9636-e2421b68f379",
      noInternetTitle = "Whoops!!",
      noInternetMessage =
          "No internet connection was found.Check your internet connection or try again",
      emptyEventsImagePath = "lib/resources/images/no_events.png",
      noInternetImagePath = "lib/resources/images/no_internet.png";
}

class AppFonts {
  static FontWeight medium = FontWeight.w500,
      semiBold = FontWeight.w700,
      regular = FontWeight.w400, bold = FontWeight.bold;
  static double smallText = 12, mediumText = 15, bigText = 25, extraMedium = 18, extraLargeText = 35;
}

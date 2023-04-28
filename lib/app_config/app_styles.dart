import 'package:flutter/material.dart';

class AppStyles {
  static TextStyle createTitleTextStyle() {
    return const TextStyle(
      color: Colors.black,
      fontSize: 20.0,
      fontWeight: FontWeight.bold,
    );
  }

  static TextStyle createDescriptionTextStyle() {
    return const TextStyle(
      color: Colors.black,
      fontSize: 10.0,
    );
  }

  static TextStyle createCategoryTextStyle() {
    return const TextStyle(
      color: Colors.grey,
      fontSize: 12.0,
    );
  }

  static TextStyle createPriceTextStyle() {
    return const TextStyle(
      color: Colors.green,
      fontSize: 18.0,
      fontStyle: FontStyle.italic,
      fontWeight: FontWeight.bold,
    );
  }
}

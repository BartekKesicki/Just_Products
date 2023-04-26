import 'package:flutter/material.dart';
import 'package:just_products/products/products_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Just products demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const ProductsPage(),
    );
  }
}

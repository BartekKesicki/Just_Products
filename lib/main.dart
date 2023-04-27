import 'package:flutter/material.dart';
import 'package:just_products/converters/product_converter.dart';
import 'package:just_products/dio/dio_client.dart';
import 'package:just_products/products/products_bloc.dart';
import 'package:just_products/products/products_page.dart';
import 'package:just_products/repository/product_repository.dart';
import 'package:just_products/usecase/product_usecase.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider(
          create: (BuildContext context) => DioClient(),
        ),
        Provider(
          create: (BuildContext context) =>
              ProductRepository(context.read<DioClient>()),
        ),
        Provider(
          create: (BuildContext context) => ProductConverter(),
        ),
        Provider(
          create: (BuildContext context) => ProductUseCase(
            context.read<ProductConverter>(),
            context.read<ProductRepository>(),
          ),
        ),
        Provider(
          create: (BuildContext context) => ProductsBloc(
            context.read<ProductUseCase>(),
          ),
        ),
      ],
      child: MaterialApp(
        title: 'Just products demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const ProductsPage(),
      ),
    );
  }
}

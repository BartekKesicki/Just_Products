import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:just_products/products/products_bloc.dart';
import 'package:just_products/products/products_state.dart';

class ProductsPage extends StatefulWidget {
  const ProductsPage({super.key});

  @override
  State<StatefulWidget> createState() => _ProductsPageState();

}

class _ProductsPageState extends State<ProductsPage> {

  ProductsBloc? _bloc;

  @override
  void initState() {
    super.initState();
    _bloc = ProductsBloc();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (_) => _bloc!,
        child: Scaffold(
          body: BlocBuilder<ProductsBloc, ProductsState>(
            builder: (BuildContext context, ProductsState state) {
              return Container();
            },
          ),
        ),
    );
  }

}
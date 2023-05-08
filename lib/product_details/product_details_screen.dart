import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:just_products/product_details/product_details_bloc.dart';
import 'package:just_products/product_details/product_details_event.dart';
import 'package:just_products/product_details/product_details_state.dart';

class ProductDetailsScreen extends StatefulWidget {
  const ProductDetailsScreen({super.key});

  @override
  State<StatefulWidget> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => context.read<ProductDetailsBloc>(),
      child: Scaffold(
        appBar: AppBar(
          title: const Center(
            child: Text("Product Details"),
          ),
        ),
        body: BlocBuilder<ProductDetailsBloc, ProductDetailsState>(
          bloc: context.read<ProductDetailsBloc>(),
          builder: (BuildContext context, ProductDetailsState state) {
            if (state is LoadingState) {
              return _buildLoadingWidget();
            } if (state is InitProductDetailsState) {
              context.read<ProductDetailsBloc>().add(LoadProductDetailsEvent());
            }
            //todo create rest widgets according to state
            return Container();
          },
        ),
      ),
    );
  }

  Widget _buildLoadingWidget() {
    //todo create loading widget
    return Container();
  }
}

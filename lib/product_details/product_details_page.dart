import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:just_products/product_details/product_details_bloc.dart';
import 'package:just_products/product_details/product_details_event.dart';
import 'package:just_products/product_details/product_details_state.dart';
import 'package:just_products/widgets/loading_widget.dart';

class ProductDetailsPage extends StatefulWidget {
  const ProductDetailsPage({super.key});

  @override
  State<StatefulWidget> createState() => _ProductDetailsPageState();
}

class _ProductDetailsPageState extends State<ProductDetailsPage> {
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
              return const LoadingWidget(text: "Downloading product");
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
}

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:just_products/product_details/product_details_bloc.dart';
import 'package:just_products/product_details/product_details_event.dart';
import 'package:just_products/product_details/product_details_state.dart';
import 'package:just_products/products/model/product_ui.dart';
import 'package:just_products/widgets/loading_widget.dart';

class ProductDetailsPage extends StatefulWidget {
  const ProductDetailsPage({super.key, required this.productId});

  @override
  State<StatefulWidget> createState() => _ProductDetailsPageState();

  final int productId;
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
            } else if (state is InitProductDetailsState) {
              context
                  .read<ProductDetailsBloc>()
                  .add(LoadProductDetailsEvent(widget.productId));
            } else if (state is ErrorState) {
              return _buildErrorStateWidget();
            } else if (state is LoadedProductDetailsState) {
              return _buildProductPage(state.productUi);
            }
            return Container();
          },
        ),
      ),
    );
  }

  Widget _buildErrorStateWidget() {
    return Center(
      child: Column(
        children: [
          const Text("OOPS! SOMETHING WENT WRONG"),
          ElevatedButton(
              onPressed: () {
                context
                    .read<ProductDetailsBloc>()
                    .add(LoadProductDetailsEvent(widget.productId));
              },
              child: const Text("TRY AGAIN..."))
        ],
      ),
    );
  }

  Widget _buildProductPage(ProductUi productUi) {
    //todo build product ui widget
    return Container();
  }
}

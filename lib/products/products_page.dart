import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:just_products/products/product_list_item.dart';
import 'package:just_products/products/products_bloc.dart';
import 'package:just_products/products/products_event.dart';
import 'package:just_products/products/products_state.dart';
import 'package:just_products/widgets/loading_widget.dart';

class ProductsPage extends StatefulWidget {
  const ProductsPage({super.key});

  @override
  State<StatefulWidget> createState() => _ProductsPageState();
}

class _ProductsPageState extends State<ProductsPage> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => context.read<ProductsBloc>(),
      child: Scaffold(
        appBar: AppBar(
          title: const Center(
            child: Text("Products"),
          ),
        ),
        body: BlocBuilder<ProductsBloc, ProductsState>(
          bloc: context.read<ProductsBloc>(),
          builder: (BuildContext context, ProductsState state) {
            if (state is LoadingState) {
              return const LoadingWidget(text: "Downloading products...");
            } else if (state is InitProductsState) {
              return _buildInitialScreen();
            } else if (state is ErrorState) {
              return _buildErrorScreen();
            } else if (state is ProductsLoadedState) {
              return _buildMainPage(state);
            }
            return Container();
          },
        ),
      ),
    );
  }

  Widget _buildInitialScreen() {
    return Center(
      child: ElevatedButton(
        onPressed: () {
          context.read<ProductsBloc>().add(LoadListProductsEvent());
        },
        child: const Text("Load products"),
      ),
    );
  }

  Widget _buildErrorScreen() {
    return Center(
      child: Column(
        children: [
          const Text("ERROR OCCURRED"),
          ElevatedButton(
            onPressed: () =>
                context.read<ProductsBloc>().add(LoadListProductsEvent()),
            child: const Text("Retry"),
          ),
        ],
      ),
    );
  }

  Widget _buildMainPage(ProductsLoadedState state) {
    return ListView.builder(
        itemCount: state.products.length,
        itemBuilder: (BuildContext context, int index) {
          return ProductListItem(productUi: state.products[index]);
        });
  }
}

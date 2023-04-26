import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:just_products/products/products_event.dart';
import 'package:just_products/products/products_state.dart';

class ProductsBloc extends Bloc<ProductsEvent, ProductsState> {

  ProductsBloc() : super(InitProductsState()) {
    on(<LoadListProductsEvent>(event, emit) => _loadProducts);
  }

  void _loadProducts() {

  }

}
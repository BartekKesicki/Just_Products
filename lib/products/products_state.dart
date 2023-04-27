
import 'package:just_products/products/model/product_ui.dart';

abstract class ProductsState {}

class InitProductsState extends ProductsState {}

class LoadingState extends ProductsState {}

class ErrorState extends ProductsState {}

class ProductsLoadedState extends ProductsState {
  final List<ProductUi> products;

  ProductsLoadedState(this.products);
}
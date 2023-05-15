import 'package:just_products/products/model/product_ui.dart';

abstract class ProductDetailsState {}

class InitProductDetailsState extends ProductDetailsState {}

class LoadingState extends ProductDetailsState {}

class LoadedProductDetailsState extends ProductDetailsState {
  final ProductUi productUi;

  LoadedProductDetailsState(this.productUi);
}

class ErrorState extends ProductDetailsState {}
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:just_products/products/products_event.dart';
import 'package:just_products/products/products_state.dart';
import 'package:just_products/usecase/product_usecase.dart';

class ProductsBloc extends Bloc<ProductsEvent, ProductsState> {

  final ProductUseCase productUseCase;

  ProductsBloc(this.productUseCase) : super(InitProductsState()) {
    on(<LoadListProductsEvent>(event, emit) => _loadProducts);
  }

  void _loadProducts() async {
    try {
      final products = await productUseCase.getProducts();
      emit(ProductsLoadedState(products));
    } on Exception catch(ex) {
      print(ex);
      emit(ErrorState());
    }
  }

}
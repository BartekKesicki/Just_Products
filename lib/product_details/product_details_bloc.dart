

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:just_products/product_details/product_details_event.dart';
import 'package:just_products/product_details/product_details_state.dart';
import 'package:just_products/usecase/product_usecase.dart';

class ProductDetailsBloc extends Bloc<ProductDetailsEvent, ProductDetailsState> {

  final ProductUseCase _productUseCase;

  ProductDetailsBloc(this._productUseCase) : super(InitProductDetailsState()) {
    on<LoadProductDetailsEvent>((event, emit) async {
      emit(LoadingState());
      try {
        final productUi = await _productUseCase.getProduct(event.productId);
        emit(LoadedProductDetailsState(productUi));
      } catch(ex) {
        print(ex);
        emit(ErrorState());
      }
    });
  }
}
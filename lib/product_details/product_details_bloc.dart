

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:just_products/product_details/product_details_event.dart';
import 'package:just_products/product_details/product_details_state.dart';
import 'package:just_products/usecase/product_usecase.dart';

class ProductDetailsBloc extends Bloc<ProductDetailsEvent, ProductDetailsState> {

  ProductDetailsBloc(this._productUseCase) : super(InitProductDetailsState()) {
    on<LoadProductDetailsEvent>((event, emit) async {
      emit(LoadingState());
      //todo load product details
    });
  }

  final ProductUseCase _productUseCase;
}
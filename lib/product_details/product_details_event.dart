abstract class ProductDetailsEvent {}

class LoadProductDetailsEvent extends ProductDetailsEvent {
  final int productId;

  LoadProductDetailsEvent(this.productId);
}
import 'package:just_products/converters/product_converter.dart';
import 'package:just_products/products/model/product_ui.dart';
import 'package:just_products/repository/product_repository.dart';

class ProductUseCase {
  final ProductConverter productConverter;
  final ProductRepository productRepository;

  ProductUseCase(this.productConverter, this.productRepository);

  Future<List<ProductUi>> getProducts() async {
    final products = await productRepository.getProducts();
    final productsUi =
        productConverter.convertResponseToProductUiList(products);
    return productsUi;
  }
}

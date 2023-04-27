import 'package:just_products/dio/model/product.dart';
import 'package:just_products/dio/model/products_response.dart';
import 'package:just_products/products/model/product_ui.dart';

class ProductConverter {

  List<ProductUi> convertResponseToProductUiList(ProductsResponse response) {
    return response.products.map((e) => _convertProductToProductUi(e)).toList();
  }

  ProductUi _convertProductToProductUi(Product product) {
    return ProductUi(
      id: product.id,
      title: product.title,
      description: product.description,
      price: product.price,
      discountPercentage: product.discountPercentage,
      rating: product.rating,
      stock: product.stock,
      brand: product.brand,
      category: product.category,
      thumbnail: product.thumbnail,
      images: product.images,
    );
  }
}

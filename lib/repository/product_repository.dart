
import 'package:just_products/dio/dio_client.dart';
import 'package:just_products/dio/model/products_response.dart';

class ProductRepository {

  final DioClient dioClient;

  ProductRepository(this.dioClient);

  Future<ProductsResponse> getProducts() async {
    return await dioClient.getProducts();
  }
}
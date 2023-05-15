import 'package:dio/dio.dart';
import 'package:just_products/dio/model/product.dart';
import 'package:just_products/dio/model/products_response.dart';

class DioClient {

  final _baseUrl = "https://dummyjson.com";

  final Dio _dio = Dio();

  Future<ProductsResponse> getProducts() async {
    Response data = await _dio.get("$_baseUrl/products");

    ProductsResponse productsResponse = ProductsResponse.fromJson(data.data);
    return productsResponse;
  }

  Future<Product> getProduct(int id) async {
    Response data = await _dio.get("$_baseUrl/products/$id");
    Product productDetailsResponse = Product.fromJson(data.data);
    return productDetailsResponse;
  }
}
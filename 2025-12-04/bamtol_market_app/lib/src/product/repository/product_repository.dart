import 'package:bamtol_market_app/src/common/model/product.dart';
import 'package:bamtol_market_app/src/common/model/product_search_option.dart';
import 'package:get/get.dart';

class ProductRepository extends GetxService {
  ProductRepository();

  final List<Product> _mockProducts = [];

  Future<String?> saveProduct(Map<String, dynamic> data) async {
    final id = DateTime.now().millisecondsSinceEpoch.toString();
    final product = Product.fromJson(id, data);
    _mockProducts.add(product);
    return id;
  }

  Future<({List<Product> list, dynamic lastItem})> getProducts(
    ProductSearchOption searchOption,
  ) async {
    // Mock pagination logic
    // Just return all products for now or simple slice
    return (list: _mockProducts, lastItem: null);
  }
}

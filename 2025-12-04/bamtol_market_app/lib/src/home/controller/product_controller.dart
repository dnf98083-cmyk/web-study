import 'package:bamtol_market_app/src/home/model/product_model.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class ProductController extends GetxController {
  RxList<ProductModel> productList = <ProductModel>[
    ProductModel(
      id: 1,
      title: 'Yaamj 상품 무료로 드려요 :)',
      price: -1, // 나눔
      content: '무료 나눔합니다.',
      images: [
        XFile(
          'https://cdn.kgmaeil.net/news/photo/202007/245825_49825_2217.jpg',
        ),
      ],
      userNickName: '개발하는남자',
      createdTime: DateTime(2023, 7, 8),
    ),
    ProductModel(
      id: 2,
      title: '제주도 감귤 팝니다',
      price: 20000,
      content: '맛있는 감귤이에요.',
      images: [
        XFile(
          'https://t1.daumcdn.net/thumb/R720x0.fjpg/?fname=http://t1.daumcdn.net/brunch/service/user/4arX/image/Tr_Qy4Jm8Z7Xp6369V6qYgT-Sj8.jpg',
        ),
      ],
      userNickName: '제주도민',
      createdTime: DateTime(2023, 7, 9),
    ),
  ].obs;

  @override
  void onClose() {
    print('ProductController: onClose called');
    super.onClose();
  }

  void addProduct(ProductModel product) {
    print('ProductController: Adding product ${product.title}');
    productList.insert(0, product);
    print('ProductController: List length is now ${productList.length}');
  }
}

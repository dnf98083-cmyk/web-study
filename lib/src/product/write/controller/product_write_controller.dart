import 'package:bamtol_market_app/src/common/components/app_font.dart';
import 'package:bamtol_market_app/src/common/controller/common_layout_controller.dart';
import 'package:bamtol_market_app/src/common/enum/market_enum.dart';
import 'package:bamtol_market_app/src/common/model/product.dart';
import 'package:bamtol_market_app/src/common/repository/cloud_firebase_storage_repository.dart';
import 'package:bamtol_market_app/src/home/controller/product_controller.dart';
import 'package:bamtol_market_app/src/home/model/product_model.dart';
import 'package:bamtol_market_app/src/product/repository/product_repository.dart';
import 'package:bamtol_market_app/src/user/model/user_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class ProductWriteController extends GetxController {
  final UserModel owner;
  final Rx<Product> product = const Product().obs;
  final ProductRepository _productRepository;
  final CloudFirebaseRepository _cloudFirebaseRepository;
  RxBool isPossibleSubmit = false.obs;
  RxList<XFile> selectedImages = <XFile>[].obs;

  ProductWriteController(
    this.owner,
    this._productRepository,
    this._cloudFirebaseRepository,
  );

  @override
  void onInit() {
    super.onInit();
    product.stream.listen((event) {
      _isValidSubmitPossible();
    });
    selectedImages.listen((event) {
      _isValidSubmitPossible();
    });
  }

  _isValidSubmitPossible() {
    if (selectedImages.isNotEmpty &&
        (product.value.productPrice ?? 0) >= 0 &&
        product.value.title != '' &&
        product.value.title != null) {
      isPossibleSubmit(true);
    } else {
      isPossibleSubmit(false);
    }
  }

  changeSelectedImages(List<XFile>? images) {
    if (images != null) {
      selectedImages.addAll(images);
    }
  }

  deleteImage(int index) {
    selectedImages.removeAt(index);
  }

  changeTitle(String value) {
    product(product.value.copyWith(title: value));
  }

  changeCategoryType(ProductCategoryType? type) {
    product(product.value.copyWith(categoryType: type));
  }

  changePrice(String price) {
    if (!RegExp(r'^[0-9]+$').hasMatch(price)) return;
    product(
      product.value.copyWith(
        productPrice: int.parse(price),
        isFree: int.parse(price) == 0,
      ),
    );
  }

  changeIsFreeProduct() {
    product(product.value.copyWith(isFree: !(product.value.isFree ?? false)));
    if (product.value.isFree!) {
      changePrice('0');
    }
  }

  changeDescription(String value) {
    product(product.value.copyWith(description: value));
  }

  changeTradeLocationMap(Map<String, dynamic> mapInfo) {
    product(
      product.value.copyWith(
        wantTradeLocationLabel: mapInfo['label'],
        wantTradeLocation: mapInfo['location'],
      ),
    );
  }

  clearWantTradeLocation() {
    product(
      product.value.copyWith(
        wantTradeLocationLabel: '',
        wantTradeLocation: null,
      ),
    );
  }

  Future<List<String>> uploadImages(List<XFile> images) async {
    List<String> imageUrls = [];
    for (var image in images) {
      var downloadUrl = await _cloudFirebaseRepository.uploadFile(
        owner.uid ?? 'mock_uid', // Fallback for mock
        image,
      );
      imageUrls.add(downloadUrl);
    }
    return imageUrls;
  }

  submit() async {
    try {
      print('Submit called. Owner UID: ${owner.uid}');
      CommonLayoutController.to.loading(true);
      var downloadUrls = await uploadImages(selectedImages);
      product(
        product.value.copyWith(
          owner: owner,
          imageUrls: downloadUrls,
          createdAt: DateTime.now(),
          updatedAt: DateTime.now(),
        ),
      );
      var savedId = await _productRepository.saveProduct(product.value.toMap());
      print('Product saved with ID: $savedId');

      if (savedId != null) {
        try {
          final productController = Get.find<ProductController>();
          print('Adding to ProductController...');
          productController.addProduct(
            ProductModel(
              id: int.parse(savedId),
              title: product.value.title ?? '',
              price: product.value.productPrice ?? 0,
              content: product.value.description ?? '',
              images:
                  product.value.imageUrls?.map((e) => XFile(e)).toList() ?? [],
              userNickName: owner.nickname ?? 'Unknown',
              createdTime: DateTime.now(),
            ),
          );
          print('Added to ProductController successfully.');
        } catch (e) {
          print('Failed to add to ProductController: $e');
        }

        CommonLayoutController.to.loading(false);
        await showDialog(
          context: Get.context!,
          builder: (context) {
            return CupertinoAlertDialog(
              content: const AppFont(
                '물건이 등록되었습니다.',
                color: Colors.black,
                size: 16,
              ),
              actions: [
                TextButton(
                  onPressed: () {
                    Get.back();
                  },
                  child: const AppFont(
                    '확인',
                    size: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue,
                  ),
                ),
              ],
            );
          },
        );
        Get.back(result: true);
      }
    } catch (e) {
      print('Error during submit: $e');
      CommonLayoutController.to.loading(false);
    } finally {
      CommonLayoutController.to.loading(false);
    }
  }
}

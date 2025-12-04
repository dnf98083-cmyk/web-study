import 'dart:io';

import 'package:bamtol_market_app/src/common/components/app_font.dart';
import 'package:bamtol_market_app/src/home/controller/product_controller.dart';
import 'package:bamtol_market_app/src/home/model/product_model.dart';
import 'package:bamtol_market_app/src/home/page/product_detail_page.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class ProductList extends GetView<ProductController> {
  const ProductList({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => ListView.separated(
        padding: const EdgeInsets.only(left: 25.0, top: 20, right: 25),
        itemBuilder: (context, index) {
          return _productOne(controller.productList[index]);
        },
        separatorBuilder: (context, index) => const Padding(
          padding: EdgeInsets.symmetric(vertical: 10.0),
          child: Divider(color: Color(0xffE3C3E3)),
        ),
        itemCount: controller.productList.length,
      ),
    );
  }

  Widget _productOne(ProductModel product) {
    bool isNetworkImage =
        product.images.isNotEmpty && product.images[0].path.startsWith('http');

    return GestureDetector(
      onTap: () {
        Get.to(() => ProductDetailPage(product: product));
      },
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(7),
            child: SizedBox(
              width: 100,
              height: 100,
              child: product.images.isNotEmpty
                  ? (isNetworkImage
                        ? Image.network(
                            product.images[0].path,
                            fit: BoxFit.cover,
                          )
                        : (kIsWeb
                              ? Image.network(
                                  product.images[0].path,
                                  fit: BoxFit.cover,
                                )
                              : Image.file(
                                  File(product.images[0].path),
                                  fit: BoxFit.cover,
                                )))
                  : Container(
                      color: Colors.grey,
                      child: const Icon(Icons.image_not_supported),
                    ),
            ),
          ),
          const SizedBox(width: 15),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(height: 10),
                AppFont(product.title, color: Colors.white, size: 16),
                const SizedBox(height: 5),
                AppFont(
                  '${product.userNickName}  .  ${DateFormat('yyyy.MM.dd').format(product.createdTime)}',
                  color: const Color(0xff7B8B93),
                  size: 12,
                ),
                const SizedBox(height: 5),
                _priceView(product),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _priceView(ProductModel product) {
    if (product.price == -1) {
      return const Row(
        children: [
          AppFont('나눔', size: 14, fontWeight: FontWeight.bold),
          SizedBox(width: 5),
          AppFont('💙', size: 16),
        ],
      );
    }
    return AppFont(
      '${NumberFormat('#,###').format(product.price)}원',
      size: 14,
      fontWeight: FontWeight.bold,
    );
  }
}

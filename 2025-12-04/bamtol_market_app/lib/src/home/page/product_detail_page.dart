import 'package:bamtol_market_app/src/common/components/app_font.dart';
import 'package:bamtol_market_app/src/home/model/product_model.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class ProductDetailPage extends StatelessWidget {
  final ProductModel product;

  const ProductDetailPage({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          CustomScrollView(
            slivers: [
              _appBar(),
              _imageSlider(),
              _userProfile(),
              _productContent(),
            ],
          ),
          _bottomBar(),
        ],
      ),
    );
  }

  SliverAppBar _appBar() {
    return SliverAppBar(
      leading: IconButton(
        onPressed: Get.back,
        icon: SvgPicture.asset('assets/svg/icons/back.svg'),
      ),
      backgroundColor: Colors.transparent,
      elevation: 0,
      pinned: true,
      actions: [
        IconButton(
          onPressed: () {},
          icon: SvgPicture.asset('assets/svg/icons/share.svg'),
        ),
        IconButton(
          onPressed: () {},
          icon: SvgPicture.asset('assets/svg/icons/more_vertical.svg'),
        ),
      ],
    );
  }

  SliverToBoxAdapter _imageSlider() {
    return SliverToBoxAdapter(
      child: SizedBox(
        height: 300,
        child: PageView.builder(
          itemCount: product.images.length,
          itemBuilder: (context, index) {
            return Hero(
              tag: product.id,
              child: kIsWeb
                  ? Image.network(product.images[index].path, fit: BoxFit.cover)
                  : Image.asset(
                      // For mock data that might be assets, or file paths
                      // This logic might need adjustment based on how mock data is stored
                      // But for now, assuming network for mock and file for local is tricky without isNetwork check
                      // Let's assume path is valid for Image.network if it starts with http
                      product.images[index].path,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        return Container(color: Colors.grey);
                      },
                    ),
            );
          },
        ),
      ),
    );
  }

  SliverToBoxAdapter _userProfile() {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Row(
          children: [
            const CircleAvatar(
              radius: 25,
              backgroundImage: NetworkImage(
                'https://picsum.photos/200',
              ), // Mock Profile
            ),
            const SizedBox(width: 15),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppFont(
                  product.userNickName,
                  fontWeight: FontWeight.bold,
                  size: 16,
                ),
                const SizedBox(height: 4),
                const AppFont(
                  '제주도 제주시 도두동', // Mock Location
                  size: 13,
                  color: Color(0xff868B95),
                ),
              ],
            ),
            const Spacer(),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                const AppFont(
                  '36.5℃',
                  color: Color(0xff00C73C),
                  fontWeight: FontWeight.bold,
                ),
                const SizedBox(height: 4),
                Container(
                  width: 50,
                  height: 6,
                  decoration: BoxDecoration(
                    color: const Color(0xff00C73C).withOpacity(0.2),
                    borderRadius: BorderRadius.circular(3),
                  ),
                  child: Row(
                    children: [
                      Container(
                        width: 35,
                        decoration: BoxDecoration(
                          color: const Color(0xff00C73C),
                          borderRadius: BorderRadius.circular(3),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  SliverToBoxAdapter _productContent() {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppFont(product.title, size: 20, fontWeight: FontWeight.bold),
            const SizedBox(height: 15),
            AppFont(
              '디지털/가전 ∙ 22시간 전', // Mock Category/Time
              size: 13,
              color: const Color(0xff868B95),
            ),
            const SizedBox(height: 15),
            AppFont(product.content, size: 16),
            const SizedBox(height: 100), // Bottom padding for floating bar
          ],
        ),
      ),
    );
  }

  Widget _bottomBar() {
    return Positioned(
      bottom: 0,
      left: 0,
      right: 0,
      child: Container(
        height: 80,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        decoration: const BoxDecoration(
          color: Color(0xff212123),
          border: Border(top: BorderSide(color: Color(0xff42464E))),
        ),
        child: Row(
          children: [
            SvgPicture.asset('assets/svg/icons/like_off.svg'),
            const SizedBox(width: 15),
            Container(width: 1, height: 40, color: const Color(0xff42464E)),
            const SizedBox(width: 15),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppFont(
                  NumberFormat('#,###원').format(product.price),
                  size: 18,
                  fontWeight: FontWeight.bold,
                ),
                const AppFont('가격 제안불가', size: 13, color: Color(0xff868B95)),
              ],
            ),
            const Spacer(),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              decoration: BoxDecoration(
                color: const Color(0xffED7738),
                borderRadius: BorderRadius.circular(5),
              ),
              child: const AppFont(
                '채팅하기',
                fontWeight: FontWeight.bold,
                size: 16,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

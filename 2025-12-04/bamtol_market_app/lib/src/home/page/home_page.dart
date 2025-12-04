import 'package:bamtol_market_app/src/common/components/app_font.dart';
import 'package:bamtol_market_app/src/home/widgets/product_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: Get.width * 0.6,
        leading: Padding(
          padding: const EdgeInsets.only(left: 25),
          child: Row(
            children: [
              const AppFont(
                '이건동',
                fontWeight: FontWeight.bold,
                size: 20,
                color: Colors.white,
              ),
              const SizedBox(width: 10),
              SvgPicture.asset('assets/svg/icons/bottom_arrow.svg'),
            ],
          ),
        ),
        actions: [
          SvgPicture.asset('assets/svg/icons/search.svg'),
          const SizedBox(width: 15),
          SvgPicture.asset('assets/svg/icons/list.svg'),
          const SizedBox(width: 15),
          SvgPicture.asset('assets/svg/icons/bell.svg'),
          const SizedBox(width: 25),
        ],
      ),
      body: const ProductList(),
      floatingActionButton: GestureDetector(
        onTap: () async {
          await Get.toNamed('/product/write');
        },
        behavior: HitTestBehavior.translucent,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: const Color(0xffED7738),
              ),
              child: Row(
                children: [
                  SvgPicture.asset('assets/svg/icons/plus.svg'),
                  const SizedBox(width: 6),
                  const AppFont('글쓰기', size: 16, color: Colors.white),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:get/get.dart';

class DataLoadController extends GetxController {
  RxBool DataLoaded = false.obs;

  void loadData() async {
    // 데이터 로드 작업 수행
    await Future.delayed(const Duration(milliseconds: 2000));
    DataLoaded(true);
  }
}

import 'package:get/get.dart';

class DataLoadController extends GetxController {
  RxBool isDataLoad = false.obs;

  void loadData() async {
    print('데이터 로드 시작');
    await Future.delayed(const Duration(seconds: 2));
    print('데이터 로드 완료');
    isDataLoad(true);
  }
}

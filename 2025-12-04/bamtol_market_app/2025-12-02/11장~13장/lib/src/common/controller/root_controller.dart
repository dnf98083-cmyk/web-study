import 'package:get/get.dart';

class RootController extends GetxController {
  RxInt rootIndex = 0.obs;

  void changeRootIndex(int index) {
    rootIndex(index);
  }
}

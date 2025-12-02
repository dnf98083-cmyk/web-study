import 'package:bamtol_market_app/src/splash/enum/step_type.dart';
import 'package:get/get.dart';

class SplashController extends GetxController {
  Rx<StepType> loadStep = StepType.dataLoad.obs;

  void changeStep(StepType type) {
    loadStep(type);
  }

  @override
  void onInit() {
    super.onInit();
    _loadData();
  }

  void _loadData() async {
    // TODO: 필요한 데이터 로드 또는 초기화 작업 수행
    await Future.delayed(const Duration(seconds: 2));
    // 로딩 완료 후 다음 동작 처리
  }
}

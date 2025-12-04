import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class CloudFirebaseRepository extends GetxService {
  CloudFirebaseRepository();

  Future<String> uploadFile(String mainPath, XFile file) async {
    // Mock upload
    return 'https://via.placeholder.com/150';
  }
}

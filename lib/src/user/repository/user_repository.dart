import 'package:bamtol_market_app/src/user/model/user_model.dart';
import 'package:get/get.dart';

class UserRepository extends GetxService {
  UserRepository();

  final Map<String, UserModel> _mockUsers = {
    'mock_user_uid': UserModel(
      uid: 'mock_user_uid',
      nickname: 'Mock User',
      temperature: 36.5,
    ),
  };

  Future<UserModel?> findUserOne(String uid) async {
    return _mockUsers[uid];
  }

  Future<bool> checkDuplicationNickName(String nickname) async {
    return !_mockUsers.values.any((user) => user.nickname == nickname);
  }

  Future<String?> signup(UserModel user) async {
    if (user.uid == null) return null;
    _mockUsers[user.uid!] = user;
    return user.uid;
  }
}

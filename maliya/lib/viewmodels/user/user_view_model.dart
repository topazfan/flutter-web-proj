import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:maliya/models/user_model.dart';

final userProvider = StateNotifierProvider<CurrentUser>((ref) {
  return CurrentUser(null);
});

class CurrentUser extends StateNotifier<UserModel> {
  UserModel _userModel;

  CurrentUser(UserModel _userModel)
      : super(_userModel ?? new UserModel(id: -1, name: null, email: null));

  // UserModel get userModel => _userModel;

  setCurrentUser(Map<String, dynamic> json) {
    UserModel user = UserModel.fromJson(json);
    state = user;
  }

  void clearUser() {
    state = null;
  }
}

import 'package:flutter_riverpod/flutter_riverpod.dart';

enum AuthStatus {
  Uninitialized,
  Authenticated,
  Authenticating,
  Unauthenticated
}

final userAuthProvider = StateNotifierProvider<UserAuth>((ref) {
  return UserAuth(AuthStatus.Uninitialized);
});

class UserAuth extends StateNotifier<AuthStatus> {
  // UserModel _userModel;
  // AuthStatus _authStatus;

  UserAuth(AuthStatus state) : super(state);

  // AuthStatus get authStatus => _authStatus;

  setCurrent(AuthStatus authStatus) {
    state = authStatus;
  }

  void clear() {
    state = null;
  }
}

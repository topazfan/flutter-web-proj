import 'package:flutter_riverpod/flutter_riverpod.dart';

enum AuthStatus {
  Uninitialized,
  Authenticated,
  Authenticating,
  Unauthenticated
}

final userAuthProvider = StateNotifierProvider<UserAuth>(
    (ref) => new UserAuth(AuthStatus.Uninitialized));

class UserAuth extends StateNotifier<AuthStatus> {
  final AuthStatus _authStatus;
  UserAuth(this._authStatus) : super(_authStatus ?? AuthStatus.Uninitialized);

  setAuthStatus(AuthStatus status) => state = status;

  void clear() => state = AuthStatus.Uninitialized;
}

import 'dart:html';

class SessionManager {
  final Storage _localStorage = window.sessionStorage;

  // Future save(String key, String value) async {
  //   _localStorage[key] = value;
  // }

  // Future<String> get(String key) async => _localStorage[key];

  // Future remove(String key) async {
  //   _localStorage.remove(key);
  // }

  void save(String key, String value) {
    _localStorage[key] = value;
  }

  Future<String> get(String? key) async => _localStorage[key]!;

  void remove(String key) {
    _localStorage.remove(key);
  }
}

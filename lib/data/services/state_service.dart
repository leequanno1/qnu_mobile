import 'package:get/get.dart';

class StateService extends GetxService {
  final _isAuthenticated = true.obs;

  bool get isAuthenticated => _isAuthenticated.value;

  void setAuthenticated(bool value) {
    _isAuthenticated.value = value;
  }

  Future<bool> checkAuth() async {
    return true;
  }
}
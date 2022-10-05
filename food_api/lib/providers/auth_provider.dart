import 'package:flutter/cupertino.dart';
import 'package:food_api/models/user_model.dart';
import 'package:food_api/services/auth_service.dart';

class AuthProvider with ChangeNotifier {
  late UserModel _user;
  late String error;

  UserModel get user => _user;

  set user(UserModel user) {
    _user = user;
    notifyListeners();
  }

  Future<bool> register(String name, String email, String password) async {
    try {
      UserModel user = await AuthService()
          .register(name: name, email: email, password: password);
      _user = user;
      return true;
    } catch (e) {
      error = e.toString();
      return false;
    }
  }

  Future<bool> login(String email, String password) async {
    try {
      UserModel user =
          await AuthService().login(email: email, password: password);
      _user = user;
      return true;
    } catch (e) {
      error = e.toString();
      return false;
    }
  }
}

import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/user_model.dart';

class AuthService {
  final String baseUrl = 'http://192.168.1.12';
  late String errorString;

  Future<UserModel> register(
      {required String name,
      required String email,
      required String password}) async {
    var url = '$baseUrl/auth/register';
    var headers = {'Content-Type': 'application/json'};
    var body = jsonEncode({
      'name': name,
      'email': email,
      'password': password,
    });
    var response =
        await http.post(Uri.parse(url), headers: headers, body: body);
    print(response.body);
    var data = jsonDecode(response.body);

    if (response.statusCode == 200) {
      UserModel user = UserModel.fromJson(data['data']);
      return user;
    } else {
      throw data['result']['message'];
    }
  }

  Future<UserModel> login(
      {required String email, required String password}) async {
    var url = '$baseUrl/auth/login';
    var headers = {'Content-Type': 'application/json'};
    var body = jsonEncode({
      'email': email,
      'password': password,
    });
    var response =
        await http.post(Uri.parse(url), headers: headers, body: body);
    print(response.body);
    var data = jsonDecode(response.body);

    if (response.statusCode == 200) {
      UserModel user = UserModel.fromJson(data['user']);
      user.token = 'Bearer ${data['token']}';
      return user;
    } else {
      throw data['result']['message'];
    }
  }
}

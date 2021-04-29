import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:flutter_keychain/flutter_keychain.dart';
import 'package:flutter_task_demo_1/Models/ApiToken.dart';

class AuthUserRepository {
  static const _apiKey = 'apiToken';

  Future<bool> authenticateUser(String username, String password) async {
    try {
      if (username != '123' || password != '123') {
        throw Exception('Wrong Credentials');
      }
      final mockedJson = await rootBundle.loadString('assets/auth.json');
      final result = ApiToken.fromJson(json.decode(mockedJson));
      _storeAuthToken(result.apiToken);
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  logOutUser() {
    FlutterKeychain.remove(key: _apiKey);
  }

  _storeAuthToken(String apiToken) {
    FlutterKeychain.put(key: _apiKey, value: apiToken);
  }
}

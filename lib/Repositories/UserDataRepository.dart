import 'dart:convert';
import 'package:flutter_keychain/flutter_keychain.dart';
import 'package:flutter_task_demo_1/Models/UserData.dart';
import 'package:http/http.dart' as http;

class UserDataRepository {
  static const _uri = 'https://dummyapi.io/data/api/user/0F8JIqi4zwvb77FGz6Wt';

  Future<UserData?> getUserData() async {
    final apiToken = await FlutterKeychain.get(key: 'apiToken');
    try {
      final response =
          await http.get(Uri.parse(_uri), headers: {'app-id': apiToken ?? ''});
      return UserData.fromJson(jsonDecode(response.body));
    } catch (e) {
      print(e);
    }
  }
}

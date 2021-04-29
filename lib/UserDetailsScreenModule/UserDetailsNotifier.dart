import 'package:flutter/material.dart';
import 'package:flutter_task_demo_1/Models/UserData.dart';
import 'package:flutter_task_demo_1/Repositories/AuthUserRepository.dart';
import 'package:flutter_task_demo_1/Repositories/UserDataRepository.dart';

class UserDetailsNotifier with ChangeNotifier {
  final _userDataRepository = UserDataRepository();
  final _authUserRepository = AuthUserRepository();
  UserData? _userData;
  get isLogged => userData != null;
  get userData => _userData;

  UserDetailsNotifier() {
    getUserData();
  }

  getUserData() {
    _userDataRepository.getUserData().then((value) {
      _userData = value;
      notifyListeners();
    });
  }

  logOutUser() {
    _authUserRepository.logOutUser();
    _userData = null;
    notifyListeners();
  }
}

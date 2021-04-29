import 'package:flutter/material.dart';
import 'package:flutter_task_demo_1/Repositories/AuthUserRepository.dart';

class WelcomeViewNotifier with ChangeNotifier {
  final authUserRepository = AuthUserRepository();

  Future<bool> authenticateUser(String username, String password) {
    return authUserRepository.authenticateUser(username, password);
  }
}

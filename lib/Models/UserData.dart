import 'package:flutter/cupertino.dart';

@immutable
class UserData {
  final String id;
  final String email;
  final String firstName;
  final String lastName;
  final String picture;

  UserData(
      {required this.id,
      required this.email,
      required this.firstName,
      required this.lastName,
      required this.picture});

  factory UserData.fromJson(Map<String, dynamic> json) => UserData(
      id: json['id'],
      email: json['email'],
      firstName: json['firstName'],
      lastName: json['lastName'],
      picture: json['picture']);
}

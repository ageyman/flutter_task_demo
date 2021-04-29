import 'package:flutter/cupertino.dart';

@immutable
class ApiToken {
  final String apiToken;

  ApiToken({required this.apiToken});

  factory ApiToken.fromJson(Map<String, dynamic> json) =>
      ApiToken(apiToken: json['apiToken']);
}

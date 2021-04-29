import 'package:flutter/material.dart';
import 'package:flutter_task_demo_1/WelcomeModule/WelcomeView.dart';
import 'package:provider/provider.dart';
import 'WelcomeModule/WelcomeViewNotifier.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
        create: (context) => WelcomeViewNotifier(),
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          home: WelcomeView(),
        )),
  );
}

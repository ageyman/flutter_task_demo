import 'package:flutter/material.dart';
import 'package:flutter_task_demo_1/CustomWidgets/CustomTextField.dart';
import 'package:flutter_task_demo_1/UserDetailsScreenModule/UserDetailsNotifier.dart';
import 'package:flutter_task_demo_1/UserDetailsScreenModule/UserDetailsView.dart';
import 'package:flutter_task_demo_1/WelcomeModule/WelcomeViewNotifier.dart';
import 'package:provider/provider.dart';

class WelcomeView extends StatelessWidget {
  final TextEditingController _emailTextController = TextEditingController();
  final TextEditingController _passwordTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: EdgeInsets.all(16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _buildWelcomeText(),
          _buildTextFields(),
          _buildLoginButton(context),
          _buildForgotPasswordButton(),
          _buildDivider(),
          _buildExploreButton(),
        ],
      ),
    ));
  }

  Widget _buildWelcomeText() {
    return Text(
      'Welcome',
      textAlign: TextAlign.center,
      style: TextStyle(fontSize: 32),
    );
  }

  Widget _buildTextFields() {
    return Column(
      children: [
        CustomTextField(
          labelText: 'Email',
          placeholderText: 'e.g. johndoe@mail.com',
          isSecured: false,
          controller: _emailTextController,
        ),
        SizedBox(
          height: 12,
        ),
        CustomTextField(
          labelText: 'Password',
          placeholderText: 'enter password',
          isSecured: true,
          controller: _passwordTextController,
        ),
      ],
    );
  }

  Widget _buildLoginButton(BuildContext context) {
    return Consumer<WelcomeViewNotifier>(
      builder: (context, notifier, child) => ElevatedButton(
          onPressed: () {
            final username = _emailTextController.text;
            final password = _passwordTextController.text;
            notifier
                .authenticateUser(username, password)
                .then((shouldContinue) {
              if (shouldContinue) {
                _proceedToUserDetails(context);
              }
            });
          },
          child: Text('Login')),
    );
  }

  Widget _buildForgotPasswordButton() {
    return TextButton(
        onPressed: () {},
        child: Text(
          'Forgot Password',
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.blue),
        ));
  }

  Widget _buildDivider() {
    return Row(children: [
      Expanded(
          child: Divider(
        height: 32,
        thickness: 2,
        endIndent: 5,
      )),
      Text('or'),
      Expanded(
          child: Divider(
        height: 32,
        thickness: 2,
        indent: 5,
      ))
    ]);
  }

  Widget _buildExploreButton() {
    return DecoratedBox(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4),
          border: Border.all(color: Colors.grey)),
      child: TextButton(
          onPressed: () {},
          child: Text(
            'Explore The App',
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey),
          )),
    );
  }

  _proceedToUserDetails(BuildContext context) {
    final route = MaterialPageRoute(
        builder: (context) => ChangeNotifierProvider(
            create: (context) => UserDetailsNotifier(),
            child: UserDetailsView()));
    Navigator.pushReplacement(context, route);
  }
}

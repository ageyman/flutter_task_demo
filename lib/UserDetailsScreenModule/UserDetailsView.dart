import 'package:flutter/material.dart';
import 'package:flutter_task_demo_1/CustomWidgets/CustomTextField.dart';
import 'package:flutter_task_demo_1/Models/UserData.dart';
import 'package:flutter_task_demo_1/UserDetailsScreenModule/UserDetailsNotifier.dart';
import 'package:flutter_task_demo_1/WelcomeModule/WelcomeView.dart';
import 'package:flutter_task_demo_1/WelcomeModule/WelcomeViewNotifier.dart';
import 'package:provider/provider.dart';

class UserDetailsView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: Consumer<UserDetailsNotifier>(builder: (context, notifier, child) {
        return Padding(
          padding: EdgeInsets.all(16),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            notifier.isLogged
                ? _buildUserDataView(notifier.userData)
                : _buildNotLoggedInLabel(),
            SizedBox(height: 16),
            _buildValidationFields(context),
            _buildChangePasswordButton(),
            Expanded(child: SizedBox()),
            _buildLogButton(context)
          ]),
        );
      }),
    );
  }

  Widget _buildUserDataView(UserData? userData) {
    final data = userData;
    if (data == null) {
      return Container();
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          'Avatar',
          textAlign: TextAlign.left,
        ),
        SizedBox(height: 8),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                    image: NetworkImage(data.picture), fit: BoxFit.fill),
              ),
            ),
            SizedBox(width: 8),
            Column(
              children: [
                SizedBox(height: 16),
                Text(data.firstName),
                Text(data.lastName)
              ],
            )
          ],
        ),
      ],
    );
  }

  Widget _buildValidationFields(BuildContext context) {
    final notifier = context.read<UserDetailsNotifier>();
    return Column(
      children: [
        CustomTextField(
            labelText: 'Email',
            placeholderText: notifier.userData?.email,
            isEnabled: notifier.isLogged,
            isSecured: false),
        SizedBox(height: 16),
        CustomTextField(
          labelText: 'Password',
          initialValue: '111111',
          isSecured: true,
          isEnabled: false,
        ),
      ],
    );
  }

  Widget _buildChangePasswordButton() =>
      TextButton(onPressed: () {}, child: Text('Change'));

  Widget _buildLogButton(BuildContext context) {
    final notifier = context.read<UserDetailsNotifier>();
    final buttonText = notifier.isLogged ? 'Log Out' : 'Log In';
    return Row(
      children: [
        Expanded(child: SizedBox()),
        ElevatedButton(
            onPressed: () {
              notifier.isLogged
                  ? notifier.logOutUser()
                  : _proceedToWelcomeScreen(context);
            },
            child: Text(buttonText))
      ],
    );
  }

  Widget _buildNotLoggedInLabel() => Expanded(
        child: Center(
          child: Text(
            'You are not logged in',
            textAlign: TextAlign.center,
            maxLines: 1,
            style: TextStyle(fontSize: 32),
          ),
        ),
      );

  AppBar _buildAppBar() => AppBar(
        backgroundColor: Colors.indigo,
        leadingWidth: 100,
        leading: TextButton(
          onPressed: () {},
          child: Text(
            'Settings',
            maxLines: 1,
            style: TextStyle(color: Colors.white),
          ),
        ),
      );

  _proceedToWelcomeScreen(BuildContext context) {
    final route = MaterialPageRoute(
        builder: (context) => ChangeNotifierProvider(
            create: (context) => WelcomeViewNotifier(), child: WelcomeView()));
    Navigator.pushReplacement(context, route);
  }
}

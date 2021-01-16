import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:plant_app/pages/pages.dart';
import 'package:plant_app/utils/constants.dart';
import 'package:plant_app/widgets/widgets.dart';

class ForgotPage extends StatefulWidget {
  static const routeName = '/forgot';

  @override
  _ForgotPageState createState() => _ForgotPageState();
}

class _ForgotPageState extends State<ForgotPage> {
  final _emailController = TextEditingController();

  @override
  void initState() {
    _emailController.text = Constants.email;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 0,
          horizontal: Constants.baseSize * 2,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Forgot",
              style: Theme.of(context).textTheme.headline1,
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  buildTextField(
                    context,
                    controller: _emailController,
                    label: "Email",
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  buildButton(
                    context,
                    text: "Forgot",
                    onPressed: () {
                      _handleForgot(context);
                    },
                    gradient: true,
                  ),
                  buildButton(
                    context,
                    text: "Back to Login",
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    flat: true,
                    underline: true,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  _handleForgot(context) {
    _emailController.text == Constants.email
        ? showCupertinoDialog(
            context: context,
            builder: (context) => CupertinoAlertDialog(
              title: Text("Password sent!"),
              content: Text("Please check your email."),
              actions: [
                CupertinoDialogAction(
                  child: Text("OK"),
                  onPressed: () {
                    Navigator.pop(context);
                    Navigator.pushReplacementNamed(
                        context, LoginPage.routeName);
                  },
                )
              ],
            ),
          )
        : showCupertinoDialog(
            context: context,
            builder: (context) => CupertinoAlertDialog(
              title: Text("Error!"),
              content: Text("Please check your Email address."),
              actions: [
                CupertinoDialogAction(
                  child: Text("Try again"),
                  onPressed: () => Navigator.pop(context),
                )
              ],
            ),
          );
  }
}

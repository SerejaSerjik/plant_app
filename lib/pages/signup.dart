import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:plant_app/pages/pages.dart';
import 'package:plant_app/utils/constants.dart';
import 'package:plant_app/widgets/widgets.dart';

class SignUpPage extends StatefulWidget {
  static const routeName = '/signup';

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _emailController = TextEditingController();
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _obscureText = true;

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
              "Sign Up",
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
                  buildTextField(
                    context,
                    controller: _usernameController,
                    label: "Username",
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  buildTextField(
                    context,
                    controller: _passwordController,
                    label: "Password",
                    isPassword: true,
                    obscureText: _obscureText,
                    onPressed: () {
                      setState(() {
                        _obscureText = !_obscureText;
                      });
                    },
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  buildButton(
                    context,
                    text: "Sign Up",
                    onPressed: _handleSignUp,
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
            )
          ],
        ),
      ),
    );
  }

  _handleSignUp() {
    showCupertinoDialog(
      context: context,
      builder: (context) => CupertinoAlertDialog(
        title: Text("Success!"),
        content: Text("Your accont has been created."),
        actions: [
          CupertinoDialogAction(
            child: Text("Continue"),
            onPressed: () {
              Navigator.pop(context);
              Navigator.pushReplacementNamed(context, LoginPage.routeName);
            },
          )
        ],
      ),
    );
  }
}

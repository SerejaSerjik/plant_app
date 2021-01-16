import 'dart:async';

import 'package:flutter/material.dart';
import 'package:plant_app/pages/pages.dart';
import 'package:plant_app/utils/constants.dart';
import 'package:plant_app/widgets/widgets.dart';

class LoginPage extends StatefulWidget {
  static const routeName = '/login';

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _obscureText = true;
  bool _isLoading = false;

  @override
  void initState() {
    _emailController.text = Constants.email;
    _passwordController.text = Constants.password;
    super.initState();
  }

  //TODO change TextFields to Form with TextFormFields and proper validation
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
              "Login",
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
                  _isLoading
                      ? buildButton(
                          context,
                          text: "Login",
                          onPressed: _handleLogin,
                          gradient: true,
                          isLoading: true,
                        )
                      : buildButton(
                          context,
                          text: "Login",
                          onPressed: _handleLogin,
                          gradient: true,
                        ),
                  buildButton(
                    context,
                    text: "Forgot your password?",
                    onPressed: () {
                      Navigator.pushNamed(context, ForgotPage.routeName);
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

  _handleLogin() {
    setState(() {
      _isLoading = true;
    });

    FocusManager.instance.primaryFocus.unfocus();

    Timer(Duration(milliseconds: 1000), () {
      if (_emailController.text == Constants.email &&
          _passwordController.text == Constants.password) {
        setState(() {
          _isLoading = false;
        });
        Navigator.pushReplacementNamed(context, BrowsePage.routeName);
      } else {
        setState(() {
          _isLoading = false;
        });
      }
    });
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}

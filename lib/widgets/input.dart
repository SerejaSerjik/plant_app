import 'package:flutter/material.dart';
import 'package:plant_app/utils/constants.dart';

TextField buildTextField(
  BuildContext context, {
  @required TextEditingController controller,
  @required String label,
  bool isPassword = false,
  bool obscureText = true,
  Function onPressed,
}) {
  return TextField(
    controller: controller,
    decoration: InputDecoration(
        labelText: label,
        labelStyle: TextStyle(
          color: Constants.greyColor2,
          fontSize: 18,
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: Constants.greyColor2,
          ),
        ),
        errorBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: Theme.of(context).accentColor,
          ),
        ),
        border: UnderlineInputBorder(
          borderSide: BorderSide(
            color: Constants.greyColor2,
          ),
        ),
        suffixIcon: isPassword
            ? Padding(
                padding: const EdgeInsets.only(top: 15.0),
                child: IconButton(
                  onPressed: onPressed,
                  icon: Icon(
                    isPassword && obscureText == true
                        ? Icons.visibility
                        : Icons.visibility_off,
                    color: Constants.greyColor,
                  ),
                ),
              )
            : null),
    obscureText: isPassword ? obscureText : false,
  );
}

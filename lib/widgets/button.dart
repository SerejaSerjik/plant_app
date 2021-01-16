import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:plant_app/utils/constants.dart';

Widget buildButton(
  BuildContext context, {
  @required String text,
  @required Function onPressed,
  bool gradient = false,
  bool flat = false,
  bool underline = false,
  bool isLoading = false,
}) {
  return flat == false
      ? Container(
          margin: EdgeInsets.symmetric(vertical: Constants.baseSize / 2),
          child: RaisedButton(
            padding: EdgeInsets.all(0.0),
            textColor: gradient == true ? Colors.white : Colors.black,
            color: Colors.white,
            highlightColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(Constants.radiusSize),
            ),
            child: Container(
              height: Constants.baseSize * 3,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                gradient: gradient == true
                    ? LinearGradient(
                        colors: <Color>[
                          Theme.of(context).primaryColor,
                          Constants.secondaryColor,
                        ],
                      )
                    : null,
                borderRadius: BorderRadius.circular(Constants.radiusSize),
              ),
              padding: const EdgeInsets.all(10.0),
              child: isLoading
                  ? CupertinoActivityIndicator()
                  : Text(
                      text,
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: Constants.fontSize,
                      ),
                    ),
            ),
            onPressed: isLoading ? null : onPressed,
          ),
        )
      : FlatButton(
          splashColor: Colors.white,
          highlightColor: Colors.white,
          child: Text(
            text,
            style: TextStyle(
              color: Constants.greyColor,
              fontSize: Constants.caption,
              decoration: underline == true ? TextDecoration.underline : null,
            ),
          ),
          onPressed: onPressed,
        );
}

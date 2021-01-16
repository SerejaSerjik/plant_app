import 'package:flutter/material.dart';
import 'package:plant_app/utils/constants.dart';

AppBar buildAppBar(BuildContext context, {Widget rightIcon}) {
  return AppBar(
    titleSpacing: 0.0,
    toolbarHeight: Constants.baseSize * 4,
    backgroundColor: Colors.white,
    elevation: 0,
    leading: Transform.translate(
      offset: Offset(Constants.baseSize * 2 - 15, 0),
      child: IconButton(
        highlightColor: Colors.transparent,
        splashColor: Colors.transparent,
        icon: Image.asset('assets/icons/back.png'),
        onPressed: () => Navigator.pop(context),
      ),
    ),
    actions: [rightIcon != null ? rightIcon : SizedBox()],
  );
}

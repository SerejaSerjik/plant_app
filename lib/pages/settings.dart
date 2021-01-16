import 'dart:math';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:plant_app/mocks/mocks.dart';
import 'package:plant_app/utils/constants.dart';
import 'package:plant_app/widgets/appbar.dart';

enum Editing { username, location, email, nothing }

class SettingsPage extends StatefulWidget {
  static const routeName = '/settings';

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  double _budget = 750;
  double _monthlyCap = 3000;
  bool _notifications = true;
  bool _newsletter = false;
  Editing _editing = Editing.nothing;
  String _username = "Paul";
  String _location = "Milan";
  String _email = "paul.jameson@work.com";
  TextEditingController _usernameController;
  TextEditingController _locationController;
  TextEditingController _emailController;
  double _textFieldsHeight = 15;

  void _toggleEdit(Editing name) {
    setState(() {
      _editing = _editing == name ? Editing.nothing : name;
    });
  }

  void _handleEdit(Editing name, String text) {
    switch (name) {
      case Editing.username:
        setState(() {
          _username = text;
        });
        break;
      case Editing.location:
        setState(() {
          _location = text;
        });
        break;
      case Editing.email:
        setState(() {
          _email = text;
        });
        break;
      default:
        break;
    }
  }

  Widget _buildTextInput(Editing name, TextEditingController controller) {
    return SizedBox(
      height: _textFieldsHeight,
      width: 200,
      child: TextField(
        style: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.bold,
          decoration: TextDecoration.none,
        ),
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(
            vertical: 9.6,
          ),
        ),
        onSubmitted: (String text) {
          _toggleEdit(name);
        },
        controller: controller,
        onChanged: (String text) {
          _handleEdit(name, text);
        },
      ),
    );
  }

  Widget _buildText(String text) {
    return SizedBox(
      height: _textFieldsHeight,
      child: Text(
        text,
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget _renderEdit(Editing name) {
    if (_editing == name) {
      switch (name) {
        case Editing.username:
          return _buildTextInput(name, _usernameController);
          break;
        case Editing.location:
          return _buildTextInput(name, _locationController);
          break;
        case Editing.email:
          return _buildTextInput(name, _emailController);
          break;
        default:
      }
    }

    switch (name) {
      case Editing.username:
        return _buildText(_username);
        break;
      case Editing.location:
        return _buildText(_location);
        break;
      case Editing.email:
        return _buildText(_email);
        break;
      default:
    }
  }

  @override
  void initState() {
    _usernameController = TextEditingController(text: _username);
    _locationController = TextEditingController(text: _location);
    _emailController = TextEditingController(text: _email);
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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Settings",
                  style: Theme.of(context).textTheme.headline1,
                ),
                Image.asset(
                  Mocks.profile['avatar'],
                  width: Constants.baseSize * 2.2,
                  height: Constants.baseSize * 2.2,
                ),
              ],
            ),
            Expanded(
              child: NotificationListener<OverscrollIndicatorNotification>(
                onNotification: (OverscrollIndicatorNotification overscroll) {
                  overscroll.disallowGlow();
                  return;
                },
                child: ListView(
                  children: [
                    Container(
                      margin:
                          const EdgeInsets.only(top: Constants.baseSize * 0.7),
                      child: Column(
                        children: [
                          Container(
                            margin: const EdgeInsets.symmetric(vertical: 8),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Username",
                                      style: TextStyle(
                                          color: Constants.greyColor2),
                                    ),
                                    SizedBox(height: 10),
                                    _renderEdit(Editing.username),
                                  ],
                                ),
                                GestureDetector(
                                  onTap: () {
                                    _toggleEdit(Editing.username);
                                  },
                                  child: Text(
                                    _editing == Editing.username
                                        ? "Save"
                                        : "Edit",
                                    style: TextStyle(
                                      color: Constants.secondaryColor,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.symmetric(vertical: 8),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Location",
                                      style: TextStyle(
                                          color: Constants.greyColor2),
                                    ),
                                    SizedBox(height: 10),
                                    _renderEdit(Editing.location),
                                  ],
                                ),
                                GestureDetector(
                                  onTap: () {
                                    _toggleEdit(Editing.location);
                                  },
                                  child: Text(
                                    _editing == Editing.location
                                        ? "Save"
                                        : "Edit",
                                    style: TextStyle(
                                      color: Constants.secondaryColor,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.symmetric(vertical: 8),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "E-mail",
                                      style: TextStyle(
                                          color: Constants.greyColor2),
                                    ),
                                    SizedBox(height: 10),
                                    _renderEdit(Editing.email),
                                  ],
                                ),
                                GestureDetector(
                                  onTap: () {
                                    _toggleEdit(Editing.email);
                                  },
                                  child: Text(
                                    _editing == Editing.email ? "Save" : "Edit",
                                    style: TextStyle(
                                      color: Constants.secondaryColor,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Divider(
                      height: 1,
                      color: Constants.greyColor2,
                    ),
                    Container(
                      margin:
                          const EdgeInsets.only(top: Constants.baseSize * 0.7),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Text(
                            "Budget",
                            style: TextStyle(color: Constants.greyColor2),
                            textAlign: TextAlign.left,
                          ),
                          _buildSlider(
                            context,
                            min: 0,
                            max: 1000,
                            stringedValue: 'budget',
                          ),
                          Text(
                            "\$1,000",
                            style: Theme.of(context)
                                .textTheme
                                .caption
                                .copyWith(color: Constants.greyColor2),
                            textAlign: TextAlign.right,
                          ),
                          SizedBox(height: 20),
                          Text(
                            "Monthly Cap",
                            style: TextStyle(color: Constants.greyColor2),
                            textAlign: TextAlign.left,
                          ),
                          _buildSlider(
                            context,
                            min: 0,
                            max: 5000,
                            stringedValue: 'monthlyCap',
                          ),
                          Text(
                            "\$5,000",
                            style: Theme.of(context)
                                .textTheme
                                .caption
                                .copyWith(color: Constants.greyColor2),
                            textAlign: TextAlign.right,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 20),
                    Divider(
                      height: 1,
                      color: Constants.greyColor2,
                    ),
                    SizedBox(height: 20),
                    Container(
                      margin:
                          const EdgeInsets.only(bottom: Constants.baseSize * 2),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Notifications",
                            style: TextStyle(
                              color: Constants.greyColor2,
                            ),
                          ),
                          CupertinoSwitch(
                            activeColor: Constants.secondaryColor,
                            value: _notifications,
                            onChanged: (bool value) {
                              setState(() {
                                _notifications = value;
                              });
                            },
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin:
                          const EdgeInsets.only(bottom: Constants.baseSize * 2),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Newsletter",
                            style: TextStyle(
                              color: Constants.greyColor2,
                            ),
                          ),
                          CupertinoSwitch(
                            activeColor: Constants.secondaryColor,
                            value: _newsletter,
                            onChanged: (bool value) {
                              setState(() {
                                _newsletter = value;
                              });
                            },
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  SliderTheme _buildSlider(
    BuildContext context, {
    double min,
    double max,
    String stringedValue,
  }) {
    return SliderTheme(
      data: SliderTheme.of(context).copyWith(
        activeTrackColor: Constants.secondaryColor,
        inactiveTrackColor: Constants.greyColor2,
        trackHeight: 6,
        thumbColor: Constants.secondaryColor,
        thumbShape: BorderedThumbShape(
          thumbRadius: 6,
          thumbBorderColor: Colors.white,
          thumbBorderRadius: 10,
          thumbColor: Constants.secondaryColor,
        ),
        trackShape: RoundedRectSliderTrackShape(),
      ),
      child: Slider(
        min: min,
        max: max,
        value: stringedValue == 'budget' ? _budget : _monthlyCap,
        onChanged: (value) {
          setState(() {
            stringedValue == 'budget' ? _budget = value : _monthlyCap = value;
          });
        },
      ),
    );
  }
}

class BorderedThumbShape extends SliderComponentShape {
  final double thumbRadius;
  final double thumbBorderRadius;
  final Color thumbBorderColor;
  final Color thumbColor;

  BorderedThumbShape({
    this.thumbRadius = 10,
    this.thumbBorderRadius = 13,
    this.thumbBorderColor,
    this.thumbColor,
  });

  @override
  Size getPreferredSize(bool isEnabled, bool isDiscrete) {
    return Size(0, 0);
  }

  @override
  void paint(
    PaintingContext context,
    Offset center, {
    Animation<double> activationAnimation,
    Animation<double> enableAnimation,
    bool isDiscrete,
    TextPainter labelPainter,
    RenderBox parentBox,
    SliderThemeData sliderTheme,
    TextDirection textDirection,
    double value,
    double textScaleFactor,
    Size sizeWithOverflow,
  }) {
    final Canvas canvas = context.canvas;
    Paint paintThumbBorder = Paint()
      ..color = thumbBorderColor
      ..strokeWidth = thumbBorderRadius
      ..style = PaintingStyle.fill;

    Paint paintThumb = Paint()
      ..color = thumbColor
      ..strokeWidth = thumbRadius
      ..style = PaintingStyle.fill;

    canvas.drawCircle(center, thumbBorderRadius, paintThumbBorder);
    canvas.drawCircle(center, thumbRadius, paintThumb);
  }
}

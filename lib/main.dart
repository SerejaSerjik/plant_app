import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:plant_app/pages/pages.dart';
import 'package:plant_app/utils/constants.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarBrightness: Brightness.light,
      ),
    );
    return MaterialApp(
      title: 'Plant App',
      debugShowCheckedModeBanner: false,
      onGenerateRoute: (settings) {
        switch (settings.name) {
          case LoginPage.routeName:
            return PageTransition(
              child: LoginPage(),
              type: PageTransitionType.rightToLeft,
              curve: Curves.decelerate,
              settings: settings,
            );
          case SignUpPage.routeName:
            return PageTransition(
              child: SignUpPage(),
              type: PageTransitionType.rightToLeft,
              curve: Curves.decelerate,
              settings: settings,
            );
          case ForgotPage.routeName:
            return PageTransition(
              child: ForgotPage(),
              type: PageTransitionType.rightToLeft,
              curve: Curves.decelerate,
              settings: settings,
            );
          case BrowsePage.routeName:
            return PageTransition(
              child: BrowsePage(),
              type: PageTransitionType.rightToLeft,
              curve: Curves.decelerate,
              settings: settings,
            );
          case ExplorePage.routeName:
            return PageTransition(
              child: ExplorePage(),
              type: PageTransitionType.rightToLeft,
              curve: Curves.decelerate,
              settings: settings,
            );
          case SettingsPage.routeName:
            return PageTransition(
              child: SettingsPage(),
              type: PageTransitionType.rightToLeft,
              curve: Curves.decelerate,
              settings: settings,
              // duration: Duration(milliseconds: 2000),
            );
          case ProductPage.routeName:
            return PageTransition(
              child: ProductPage(),
              type: PageTransitionType.rightToLeft,
              curve: Curves.decelerate,
              settings: settings,
              // duration: Duration(milliseconds: 2000),
            );
          default:
            return null;
        }
      },
      theme: ThemeData(
        primaryColor: Color(0xFF0AC4BA),
        accentColor: Color(0xFFF3534A),
        backgroundColor: Colors.white,
        scaffoldBackgroundColor: Colors.white,
        textTheme: GoogleFonts.rubikTextTheme(textTheme).copyWith(
          headline1: TextStyle(
            fontSize: Constants.h1,
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
          headline2: TextStyle(
            fontSize: Constants.h2,
            color: Colors.black,
          ),
          headline3: TextStyle(
            fontSize: Constants.h3,
            color: Colors.black,
            fontWeight: FontWeight.w500,
          ),
          headline4: TextStyle(
            fontSize: Constants.header,
            color: Colors.black,
          ),
          bodyText1: TextStyle(
            fontSize: Constants.body,
            color: Colors.black,
          ),
          caption: TextStyle(
            fontSize: Constants.caption,
            color: Colors.black,
          ),
        ),
      ),
      home: WelcomePage(),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:plant_app/pages/pages.dart';
import 'package:plant_app/widgets/widgets.dart';
import 'package:plant_app/utils/constants.dart';

class WelcomePage extends StatefulWidget {
  static const routeName = '/welcome';

  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  List<Map<String, dynamic>> illustrations = [];
  int currentSlide = 0;

  @override
  void initState() {
    illustrations = [
      {"source": 'assets/images/illustration_1.png'},
      {"source": 'assets/images/illustration_2.png'},
      {"source": 'assets/images/illustration_3.png'},
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _buildTitle(size),
            _buildIllustrations(size),
            _buildButtons(),
          ],
        ),
      ),
    );
  }

  Widget _buildTitle(Size size) {
    return Container(
      margin: EdgeInsets.only(top: size.height * 0.10),
      child: Column(children: [
        RichText(
          text: TextSpan(
            text: "Your Home.",
            style: TextStyle(
                fontSize: Constants.h1,
                color: Colors.black,
                fontWeight: FontWeight.bold),
            children: <TextSpan>[
              TextSpan(
                text: " Greener.",
                style: TextStyle(
                    fontSize: Constants.h1,
                    color: Theme.of(context).primaryColor),
              ),
            ],
          ),
        ),
        SizedBox(
          height: Constants.paddingSize / 2,
        ),
        Text(
          "Enjoy the expirience.",
          style: TextStyle(fontSize: Constants.h3, color: Constants.greyColor2),
        ),
      ]),
    );
  }

  Widget _buildIllustrations(Size size) {
    return Container(
      height: size.width * 0.9,
      child: Stack(
        overflow: Overflow.visible,
        children: [
          NotificationListener<OverscrollIndicatorNotification>(
            onNotification: (OverscrollIndicatorNotification overscroll) {
              overscroll.disallowGlow();
              return;
            },
            child: PageView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: illustrations.length,
              onPageChanged: (int page) {
                setState(() {
                  currentSlide = page;
                });
              },
              itemBuilder: (context, i) {
                return Container(
                  child: Image.asset(
                    illustrations[i]['source'],
                  ),
                );
              },
            ),
          ),
          Positioned(
            bottom: 20,
            left: 0,
            right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: _buildPageViewIndicator(),
            ),
          )
        ],
      ),
    );
  }

  List<Widget> _buildPageViewIndicator() {
    List<Widget> list = [];
    for (int i = 0; i < illustrations.length; i++) {
      list.add(i == currentSlide
          ? _buildDotIndicator(true)
          : _buildDotIndicator(false));
    }
    return list;
  }

  Widget _buildDotIndicator([bool isActive = false]) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 150),
      height: isActive ? 7 : 5,
      width: isActive ? 7 : 5,
      margin: EdgeInsets.symmetric(horizontal: 5),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: isActive ? Constants.greyColor : Constants.greyColor2,
      ),
    );
  }

  Widget _buildButtons() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: Constants.paddingSize * 2),
      child: Column(
        children: [
          buildButton(
            context,
            text: "Login",
            onPressed: _handleLogin,
            gradient: true,
          ),
          buildButton(context, text: "SignUp", onPressed: () {
            Navigator.pushNamed(context, SignUpPage.routeName);
          }),
          buildButton(
            context,
            text: "Terms of service",
            onPressed: _showGeneralDialogWrapper,
            flat: true,
          ),
        ],
      ),
    );
  }

  void _handleLogin() {
    Navigator.pushNamed(context, LoginPage.routeName);
  }

  void _showGeneralDialogWrapper() {
    final List<String> termsOfServiceText = [
      "1. Your use of the Service is at your sole risk. The service is provided on an \"as is\" and \"as available\" basis.",
      "2. Support for Flutter services is only available in English, via e-mail.",
      "3. You understand that Flutter uses third-party vendors and hosting partners to provide the necessary hardware, software, networking, storage, and related technology required to run the Service.",
      "4. You must not modify, adapt or hack the Service or modify another website so as to falsely imply that it is associated with the Service, Flutter, or any other Flutter service.",
      "5. You may use the Flutter Pages static hosting service solely as permitted and intended to host your organization pages, personal pages, or project pages, and for no other purpose. You may not use Flutter Pages in violation of Flutter's trademark or other rights or in violation of applicable law. Flutter reserves the right at all times to reclaim any Flutter subdomain without liability to you.",
      "6. You agree not to reproduce, duplicate, copy, sell, resell or exploit any portion of the Service, use of the Service, or access to the Service without the express written permission by Flutter.",
      "7. We may, but have no obligation to, remove Content and Accounts containing Content that we determine in our sole discretion are unlawful, offensive, threatening, libelous, defamatory, pornographic, obscene or otherwise objectionable or violates any party's intellectual property or these Terms of Service.",
      "8. Verbal, physical, written or other abuse (including threats of abuse or retribution) of any Flutter customer, employee, member, or officer will result in immediate account termination.",
      "9. You understand that the technical processing and transmission of the Service, including your Content, may be transferred unencrypted and involve (a) transmissions over various networks; and (b) changes to conform and adapt to technical requirements of connecting networks or devices.",
      "10. You must not upload, post, host, or transmit unsolicited e-mail, SMSs, or \"spam\" messages.",
    ];

    showGeneralDialog(
      context: context,
      barrierColor: Colors.white,
      barrierLabel: "Terms of service",
      transitionDuration: Duration(milliseconds: 200),
      transitionBuilder: (context, anim1, anim2, child) {
        return SlideTransition(
          position:
              Tween(begin: Offset(0, 1), end: Offset(0, 0)).animate(anim1),
          child: child,
        );
      },
      pageBuilder: (context, animation, secondaryAnimation) {
        return SafeArea(
          child: SizedBox.expand(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: Constants.paddingSize,
                vertical: Constants.paddingSize * 2,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Terms of Service",
                    style: Theme.of(context)
                        .textTheme
                        .headline2
                        .copyWith(fontWeight: FontWeight.w200),
                  ),
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.symmetric(
                        vertical: Constants.paddingSize,
                      ),
                      child: ListView.builder(
                        physics: BouncingScrollPhysics(),
                        itemCount: termsOfServiceText.length,
                        itemBuilder: (context, index) {
                          return Container(
                            margin: EdgeInsets.only(bottom: Constants.baseSize),
                            child: Text(
                              termsOfServiceText[index],
                              style: Theme.of(context)
                                  .textTheme
                                  .caption
                                  .copyWith(color: Constants.greyColor),
                              textAlign: TextAlign.left,
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                  buildButton(
                    context,
                    text: "I understand",
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    gradient: true,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

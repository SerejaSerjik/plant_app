import 'package:flutter/material.dart';
import 'package:plant_app/mocks/mocks.dart';
import 'package:plant_app/pages/pages.dart';
import 'package:plant_app/utils/constants.dart';
import 'package:plant_app/widgets/widgets.dart';

class ExplorePage extends StatefulWidget {
  static const routeName = '/explore';

  @override
  _ExplorePageState createState() => _ExplorePageState();
}

class _ExplorePageState extends State<ExplorePage> {
  List<String> _images = [];
  String _searchString = "";
  bool _isSeachFocused = false;

  @override
  void initState() {
    _images = Mocks.explore;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: buildAppBar(context),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 0,
          horizontal: Constants.baseSize * 2,
        ),
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Explore",
                      style: Theme.of(context).textTheme.headline1,
                    ),
                    _renderSearch(size),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Expanded(
                  child: ListView(
                    physics: BouncingScrollPhysics(),
                    children: [
                      _renderExplore(size),
                    ],
                  ),
                ),
              ],
            ),
            _renderFooter(size),
            _renderWhiteShadow(),
          ],
        ),
      ),
    );
  }

  Widget _renderSearch(Size size) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 150),
      height: Constants.baseSize * 2,
      width: _isSeachFocused ? size.width / 2 : size.width / 3,
      child: TextField(
        onChanged: (String text) {
          setState(() {
            _searchString = text;
          });
        },
        onTap: () {
          setState(() {
            _isSeachFocused = !_isSeachFocused;
          });
          print(_isSeachFocused);
        },
        onSubmitted: (String text) {
          setState(() {
            _isSeachFocused = false;
            _searchString = text;
          });
          print(_isSeachFocused);
        },
        textAlignVertical: TextAlignVertical.center,
        decoration: InputDecoration(
          contentPadding:
              EdgeInsets.fromLTRB(Constants.baseSize / 1.333, 0, 0, 0),
          suffixIcon: Icon(
            Icons.search,
            color: Constants.greyColor,
            size: Constants.baseSize,
          ),
          fillColor: Color.fromRGBO(142, 142, 147, 0.06),
          filled: true,
          hintText: "Search",
          hintStyle: TextStyle(
            color: Constants.greyColor,
            fontSize: 14,
          ),
          border: OutlineInputBorder(
            borderSide: BorderSide(
              color: Color.fromRGBO(142, 142, 147, 0.06),
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Color.fromRGBO(142, 142, 147, 0.06),
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Color.fromRGBO(142, 142, 147, 0.06),
            ),
          ),
        ),
      ),
    );
  }

  Widget _renderExplore(Size size) {
    final _mainImage = _images[0];

    return Container(
      margin: EdgeInsets.only(bottom: size.height / 8),
      child: Column(
        children: [
          TouchableOpacity(
            onTap: () {
              Navigator.pushNamed(
                context,
                ProductPage.routeName,
              );
            },
            child: Container(
              margin: EdgeInsets.only(
                bottom: Constants.baseSize,
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(4),
                child: Image.asset(
                  _mainImage,
                  width: double.infinity,
                ),
              ),
            ),
          ),
          Wrap(
            alignment: WrapAlignment.spaceBetween,
            direction: Axis.horizontal,
            children: _images
                .sublist(1)
                .map((String image) => _renderImage(image))
                .toList(),
          ),
        ],
      ),
    );
  }

  Widget _renderImage(String imageUrl) {
    return TouchableOpacity(
      onTap: () {
        Navigator.pushNamed(
          context,
          ProductPage.routeName,
        );
      },
      child: Container(
        margin: EdgeInsets.only(
          bottom: Constants.baseSize,
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(4),
          child: Image.asset(imageUrl),
        ),
      ),
    );
  }

  Widget _renderFooter(Size size) {
    return Positioned(
      child: Center(
        child: SizedBox(
          width: size.width / 2.678,
          child: buildButton(
            context,
            text: "Filter",
            onPressed: () {},
            gradient: true,
          ),
        ),
      ),
      left: 0,
      right: 0,
      bottom: 30,
    );
  }

  Widget _renderWhiteShadow() {
    return Positioned(
      left: 0,
      right: 0,
      bottom: 0,
      child: Container(
        height: 50,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color.fromRGBO(255, 255, 255, 0),
              Color.fromRGBO(255, 255, 255, 0.6),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:plant_app/mocks/mocks.dart';
import 'package:plant_app/pages/explore.dart';
import 'package:plant_app/pages/pages.dart';
import 'package:plant_app/utils/constants.dart';
import 'package:plant_app/widgets/widgets.dart';

class BrowsePage extends StatefulWidget {
  static const routeName = '/browse';

  @override
  _BrowsePageState createState() => _BrowsePageState();
}

class _BrowsePageState extends State<BrowsePage> {
  static List<String> _tabs = ['Products', 'Inspirations', 'Shop'];
  String _activeTab = _tabs[0];
  List<Map<String, dynamic>> _categories = [];

  @override
  void initState() {
    _categories = Mocks.categories;
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
                  "Browse",
                  style: Theme.of(context).textTheme.headline1,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, SettingsPage.routeName);
                  },
                  child: Image.asset(
                    Mocks.profile['avatar'],
                    width: Constants.baseSize * 2.2,
                    height: Constants.baseSize * 2.2,
                  ),
                ),
              ],
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: Constants.baseSize),
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: Constants.greyColor2,
                    width: 0.0,
                  ),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: _tabs.map((tab) => _renderTab(context, tab)).toList(),
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.only(top: Constants.baseSize),
                child: GridView.count(
                  physics: BouncingScrollPhysics(),
                  padding: EdgeInsets.only(top: Constants.baseSize),
                  crossAxisCount: 2,
                  children: _categories
                      .map((category) => _renderGridTile(context, category))
                      .toList(),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  _handleTab(String tab) {
    final filtered = Mocks.categories.where((category) {
      List<String> tags = category['tags'];
      return tags.contains(tab.toLowerCase());
    }).toList();
    setState(() {
      _categories = filtered;
      _activeTab = tab;
    });
  }

  Widget _renderTab(BuildContext context, String tab) {
    final isActive = _activeTab == tab;
    return GestureDetector(
      onTap: () {
        _handleTab(tab);
      },
      child: Container(
        padding: const EdgeInsets.only(bottom: Constants.baseSize),
        decoration: BoxDecoration(
          border: isActive
              ? Border(
                  bottom: BorderSide(
                    color: Constants.secondaryColor,
                    width: 3,
                  ),
                )
              : null,
        ),
        child: Text(
          tab,
          style: TextStyle(
            color: isActive ? Constants.secondaryColor : Constants.greyColor,
            fontWeight: FontWeight.w500,
            fontSize: 16,
          ),
        ),
      ),
    );
  }

  Widget _renderGridTile(BuildContext context, Map<String, dynamic> category) {
    return FractionallySizedBox(
      widthFactor: 0.9,
      child: TouchableOpacity(
        onTap: () {
          Navigator.pushNamed(
            context,
            ExplorePage.routeName,
            arguments: category,
          );
        },
        child: Container(
          padding: EdgeInsets.all(Constants.baseSize + 4),
          margin: EdgeInsets.only(bottom: Constants.baseSize),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(Constants.radiusSize),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  offset: Offset(0, 4),
                  spreadRadius: 3,
                  blurRadius: 10,
                )
              ]),
          child: Column(
            children: [
              Container(
                width: 50,
                height: 50,
                margin: EdgeInsets.only(bottom: 15),
                decoration: BoxDecoration(
                  color: Color.fromRGBO(41, 216, 143, 0.2),
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    fit: BoxFit.none,
                    image: AssetImage(category['image']),
                  ),
                ),
              ),
              Text(
                category['name'],
                style: Theme.of(context)
                    .textTheme
                    .bodyText1
                    .copyWith(fontWeight: FontWeight.w500),
              ),
              SizedBox(
                height: 3,
              ),
              Text(
                category['count'].toString() + " products",
                style: Theme.of(context)
                    .textTheme
                    .caption
                    .copyWith(color: Constants.greyColor),
              )
            ],
          ),
        ),
      ),
    );
  }
}

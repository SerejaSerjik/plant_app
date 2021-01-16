import 'package:flutter/material.dart';
import 'package:plant_app/mocks/mocks.dart';
import 'package:plant_app/utils/constants.dart';
import 'package:plant_app/widgets/widgets.dart';

class ProductPage extends StatefulWidget {
  static const routeName = '/product';

  @override
  _ProductPageState createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  Map<String, dynamic> _product = {};

  @override
  void initState() {
    _product = Mocks.products[0];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: buildAppBar(
        context,
        rightIcon: IconButton(
          highlightColor: Colors.transparent,
          splashColor: Colors.transparent,
          icon: Icon(
            Icons.more_horiz,
            color: Constants.greyColor,
          ),
          onPressed: () {},
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 0,
          horizontal: 0,
        ),
        child: ListView(
          physics: BouncingScrollPhysics(),
          children: [
            _renderGallery(size, product: _product),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: Constants.baseSize * 2,
                vertical: Constants.paddingSize,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    _product['name'],
                    style: Theme.of(context)
                        .textTheme
                        .headline2
                        .copyWith(fontWeight: FontWeight.bold),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(
                      vertical: Constants.baseSize,
                      horizontal: 0,
                    ),
                    child: Row(
                      children: _renderProductTags(context, product: _product),
                    ),
                  ),
                  Text(
                    _product['description'],
                    style: TextStyle(
                      fontWeight: FontWeight.w200,
                      height: 1.5,
                      color: Constants.greyColor,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 20),
                    child: Divider(
                      height: 1,
                      color: Constants.greyColor2,
                    ),
                  ),
                  Text(
                    "Gallery",
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children:
                        _renderSmallGallery(context, size, product: _product),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _renderGallery(Size size, {product}) {
    final List<String> images = product['images'];
    return Container(
      width: double.infinity,
      height: size.height / 2.5,
      child: PageView(
        scrollDirection: Axis.horizontal,
        children: images.map((image) => Image.asset(image)).toList(),
      ),
    );
  }

  List<Widget> _renderProductTags(
    BuildContext context, {
    Map<String, dynamic> product,
  }) {
    final List<String> tags = product['tags'];

    return tags
        .map((tag) => Container(
              padding: const EdgeInsets.symmetric(
                horizontal: Constants.baseSize,
                vertical: Constants.baseSize / 2.5,
              ),
              margin: const EdgeInsets.only(right: Constants.baseSize * 0.625),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Constants.baseSize),
                border: Border.all(
                  width: 0,
                  color: Constants.greyColor2,
                ),
              ),
              child: Text(
                tag,
                style: Theme.of(context)
                    .textTheme
                    .caption
                    .copyWith(color: Constants.greyColor),
              ),
            ))
        .toList();
  }

  _renderSmallGallery(
    BuildContext context,
    Size size, {
    Map<String, dynamic> product,
  }) {
    final List<String> images = product['images'];

    final List<Widget> imagesWidgets = images
        .sublist(1, 3)
        .map(
          (image) => Container(
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(4)),
            margin: const EdgeInsets.only(right: Constants.baseSize),
            child: Image.asset(
              image,
              width: size.width / 3.26,
            ),
          ),
        )
        .toList();

    final Widget moreIcon = Container(
      width: 55,
      height: 55,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        color: Color.fromRGBO(197, 204, 214, 0.20),
      ),
      child: Center(
        child: Text(
          "+${images.sublist(3).length.toString()}",
          style: TextStyle(color: Constants.greyColor),
        ),
      ),
    );

    return [...imagesWidgets, moreIcon];
  }
}

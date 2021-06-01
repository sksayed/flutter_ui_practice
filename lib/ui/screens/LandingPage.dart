import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_ui_learning/sampleData.dart';
import 'package:flutter_ui_learning/ui/widgets/OptionButton.dart';
import 'package:flutter_ui_learning/ui/widgets/border_box.dart';
import 'package:flutter_ui_learning/utils/widget_utils.dart';
import 'package:flutter_ui_learning/utils/theme_and_color_constant.dart'
    as theme;

class LandingPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _LandingPageState();
  }
}

class _LandingPageState extends State<LandingPage> {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final ThemeData themeData = Theme.of(context);
    final double sidePadding = 16;
    return SafeArea(
      child: Scaffold(
        body: Container(
          width: size.width,
          height: size.height,
          child: Stack(children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                getVerticalSpace(height: sidePadding),
                //first er row ta
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: sidePadding),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      BorderBox(
                        child: Icon(Icons.menu),
                        height: 50,
                        width: 50,
                      ),
                      BorderBox(
                        child: Icon(Icons.settings),
                        height: 50,
                        width: 50,
                      )
                    ],
                  ),
                ),
                getVerticalSpace(height: sidePadding),
                // City likha ta
                Padding(
                  padding: EdgeInsets.only(left: 20),
                  child: Text("City", style: themeData.textTheme.bodyText2),
                ),
                getVerticalSpace(height: 10),
                Padding(
                  padding: EdgeInsets.only(left: 20),
                  child:
                      Text("Bangladesh", style: themeData.textTheme.headline2),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: sidePadding),
                  child: Divider(
                    height: 30,
                    color: theme.COLOR_GREY,
                  ),
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      "sayed",
                      "sayed",
                      "sayed",
                      "sayed",
                      "sayed",
                      "sayed",
                      "sayed",
                      "sayed",
                    ].map((value) => ChoiceOptions(child: value)).toList(),
                  ),
                ),
                getVerticalSpace(height: 10),
                //here is the listview of all the pics
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: sidePadding),
                    child: ListView.builder(
                      physics: BouncingScrollPhysics(),
                      itemCount: RE_DATA.length,
                      itemBuilder: (BuildContext context, int index) {
                        return RealEstateWidget(data: RE_DATA[index]);
                      },
                    ),
                  ),
                ),
              ],
            ),
            Positioned(
              bottom: 20,
              width: size.width,
              child: Center(
                child: OptionButton(
                  text: "Map View",
                  icon: Icons.map_rounded,
                  width: size.width * 0.37,
                ),
              ),
            )
          ]),
        ),
      ),
    );
  }
}

class ChoiceOptions extends StatelessWidget {
  final String child;

  const ChoiceOptions({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);
    return Container(
      decoration: BoxDecoration(
          color: theme.COLOR_GREY.withAlpha(25),
          borderRadius: BorderRadius.circular(20)),
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 13),
      margin: EdgeInsets.only(left: 20),
      child: Center(
        child: Text(
          child,
          style: themeData.textTheme.headline5,
        ),
      ),
    );
  }
}

class RealEstateWidget extends StatelessWidget {
  final dynamic data;

  const RealEstateWidget({Key? key, this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              ClipRRect(
                  borderRadius: BorderRadius.circular(25),
                  child: Image.asset(data["image"])),
              Positioned(
                  top: 10,
                  right: 45,
                  child: BorderBox(
                    child: Icon(
                      Icons.favorite_outline,
                      color: theme.COLOR_BLACK,
                    ),
                  )),
            ],
          ),
          getVerticalSpace(height: 15),
          Row(
            children: [
              Text(
                "${this.data["amount"]}",
                style: themeData.textTheme.headline1,
              ),
              getHorizontalSpace(width: 10),
              Text(
                "${this.data["address"]}",
                style: themeData.textTheme.bodyText2,
              )
            ],
          ),
          getVerticalSpace(height: 10),
          Text(
            "${this.data["bedrooms"]} /bedrooms ${this.data["bathrooms"]} bathrooms / ${this.data["area"]} sqft",
            style: themeData.textTheme.headline5,
          )
        ],
      ),
    );
  }
}

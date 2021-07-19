import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:meditation_app/constants.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: Stack(
        children: [
          buildBG(size),
          SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: kPadding,
                ),
                buildMenuBtn(),
                SizedBox(
                  height: kPadding,
                ),
                buildHeaderText(context),
                SizedBox(
                  height: kPadding,
                ),
                buildSearchBar(),
                SizedBox(
                  height: kPadding,
                ),
                buildCategories(context)
              ],
            ),
          )
        ],
      ),
      bottomNavigationBar: Container(
        height: 80,
        padding: EdgeInsets.symmetric(
            horizontal: 1.5 * kPadding, vertical: kPadding / 2),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            buildNavbarItem("Today", "assets/icons/calendar.svg"),
            buildNavbarItem("All Exercises", "assets/icons/gym.svg",
                isActive: true),
            buildNavbarItem("Settings", "assets/icons/Settings.svg"),
          ],
        ),
      ),
    );
  }

  Column buildNavbarItem(String title, String svgScr, {bool isActive = false}) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        SvgPicture.asset(
          svgScr,
          color: isActive ? kActiveIconColor : kTextColor,
        ),
        Text(
          title,
          style: TextStyle(color: isActive ? kActiveIconColor : kTextColor),
        )
      ],
    );
  }

  Expanded buildCategories(BuildContext context) {
    return Expanded(
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 1.5 * kPadding),
        child: GridView.count(
          childAspectRatio: .85,
          crossAxisCount: 2,
          crossAxisSpacing: kPadding,
          mainAxisSpacing: kPadding,
          children: [
            buildCategoryCard(context, "Diet Recommendation",
                "assets/icons/Hamburger.svg", () {}),
            buildCategoryCard(context, "Kegel Exercises",
                "assets/icons/Excrecises.svg", () {}),
            buildCategoryCard(
                context, "Meditation", "assets/icons/Meditation.svg", () {}),
            buildCategoryCard(context, "Yoga", "assets/icons/yoga.svg", () {}),
          ],
        ),
      ),
    );
  }

  Widget buildCategoryCard(
      BuildContext context, String title, String image, Function press) {
    return Container(
      padding: EdgeInsets.all(kPadding),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(kRadius / 2),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
                offset: Offset(0, 17),
                blurRadius: 17,
                spreadRadius: -23,
                color: kShadowColor)
          ]),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Spacer(),
          SvgPicture.asset(image),
          Spacer(),
          Text(
            title,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.caption.copyWith(fontSize: 15),
          )
        ],
      ),
    );
  }

  Container buildSearchBar() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: kPadding),
      margin: EdgeInsets.symmetric(horizontal: 2 * kPadding),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(kRadius)),
      child: TextField(
        decoration: InputDecoration(
            border: InputBorder.none,
            icon: SvgPicture.asset("assets/icons/search.svg"),
            hintText: "Search"),
      ),
    );
  }

  Widget buildHeaderText(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 2 * kPadding),
      child: Text("Good Morning \nAmisha",
          style: Theme.of(context)
              .textTheme
              .headline5
              .copyWith(fontWeight: FontWeight.w900)),
    );
  }

  Align buildMenuBtn() {
    return Align(
      alignment: Alignment.topRight,
      child: Container(
        margin: EdgeInsets.only(right: 2 * kPadding),
        alignment: Alignment.center,
        width: 57,
        height: 57,
        decoration:
            BoxDecoration(color: Color(0xFFF2BEA1), shape: BoxShape.circle),
        child: SvgPicture.asset("assets/icons/menu.svg"),
      ),
    );
  }

  Container buildBG(Size size) {
    return Container(
      height: size.height * .45,
      decoration: BoxDecoration(
        color: Color(0xFFF5CEB8),
        image: DecorationImage(
            image: AssetImage("assets/images/undraw_pilates_gpdb.png"),
            alignment: Alignment.centerLeft),
      ),
    );
  }
}

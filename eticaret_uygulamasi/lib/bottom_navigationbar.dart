import 'package:flutter/material.dart';

Align buildBottomNavigationBar({required String page}) {
  return Align(
    alignment: Alignment.bottomCenter,
    child: Container(
      color: Colors.blueGrey,
      padding: EdgeInsets.symmetric(vertical: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          buildNavBar(
              iconData: Icons.home_filled,
              active: page == 'home' ? true : false),
          buildNavBar(
              iconData: Icons.search, active: page == 'search' ? true : false),
          buildNavBar(
              iconData: Icons.shopping_basket,
              active: page == 'cart' ? true : false),
          buildNavBar(
              iconData: Icons.person, active: page == 'profile' ? true : false),
        ],
      ),
    ),
  );
}

buildNavBar({required bool active, required IconData iconData}) {
  return Icon(
    iconData,
    size: 28,
    color: active == true ? Colors.white : Colors.black,
  );
}

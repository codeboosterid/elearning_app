import 'package:flutter/material.dart';

import '../../../common/utils/app_colors.dart';
import '../../../common/widgets/image_widgets.dart';

var bottomTabs = <BottomNavigationBarItem>[
  BottomNavigationBarItem(
    icon: _buttomContainer(pathImage: "assets/icons/home.png"),
    backgroundColor: AppColors.primaryBackground,
    activeIcon: _buttomContainer(
        pathImage: "assets/icons/home.png", color: AppColors.primaryElement),
    label: "Home",
  ),
  BottomNavigationBarItem(
    icon: _buttomContainer(pathImage: "assets/icons/search2.png"),
    backgroundColor: AppColors.primaryBackground,
    activeIcon: _buttomContainer(
        pathImage: "assets/icons/search2.png", color: AppColors.primaryElement),
    label: "Search",
  ),
  BottomNavigationBarItem(
    icon: _buttomContainer(pathImage: "assets/icons/play-circle1.png"),
    backgroundColor: AppColors.primaryBackground,
    activeIcon: _buttomContainer(
        pathImage: "assets/icons/play-circle1.png",
        color: AppColors.primaryElement),
    label: "Play",
  ),
  BottomNavigationBarItem(
    icon: _buttomContainer(pathImage: "assets/icons/message-circle.png"),
    backgroundColor: AppColors.primaryBackground,
    activeIcon: _buttomContainer(
        pathImage: "assets/icons/message-circle.png",
        color: AppColors.primaryElement),
    label: "Message",
  ),
  BottomNavigationBarItem(
    icon: _buttomContainer(pathImage: "assets/icons/user.png"),
    backgroundColor: AppColors.primaryBackground,
    activeIcon: _buttomContainer(
        pathImage: "assets/icons/user.png", color: AppColors.primaryElement),
    label: "Profil",
  ),
];

Widget _buttomContainer(
    {double width = 18,
    double height = 18,
    String pathImage = "assets/icons/home.png",
    Color color = AppColors.primaryFourthElementText}) {
  return SizedBox(
    width: width,
    height: height,
    child: appImageWithColor(
      imagePath: pathImage,
      color: color,
    ),
  );
}

Widget appScreens({int index = 0}) {
  List<Widget> screens = [
    Center(
        child: appImage(
            imagePath: "assets/icons/home.png", width: 500, height: 500)),
    Center(
        child: appImage(
            imagePath: "assets/icons/search.png", width: 500, height: 500)),
    Center(
        child: appImage(
            imagePath: "assets/icons/play-circle1.png",
            width: 500,
            height: 500)),
    Center(
        child: appImage(
            imagePath: "assets/icons/message-circle.png",
            width: 500,
            height: 500)),
    Center(
        child: appImage(
            imagePath: "assets/icons/user.png", width: 500, height: 500)),
  ];

  return screens[index];
}

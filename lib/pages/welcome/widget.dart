import 'package:flutter/material.dart';
import '../../common/utils/app_colors.dart';
import '../../common/widgets/app_shadow.dart';
import '../../common/widgets/text_widgets.dart';

Widget appOnboardingPage(
  PageController controller, {
  String imgPath = "",
  String title = "",
  String subtitle = "",
  index = 1,
}) {
  return Column(
    children: [
      Image.asset(imgPath, fit: BoxFit.fitWidth),
      Container(
        margin: const EdgeInsets.only(top: 15),
        child: text24Normal(text: title, color: AppColors.primaryElementBg),
      ),
      Container(
        margin: const EdgeInsets.only(top: 15),
        padding: const EdgeInsets.only(left: 30, right: 30),
        child: text16Normal(text: subtitle),
      ),
      _nextButton(index, controller)
    ],
  );
}

Widget _nextButton(int index, PageController controller) {
  return GestureDetector(
    onTap: () {
      if (index < 3) {
        controller.animateToPage(index,
            duration: const Duration(milliseconds: 300), curve: Curves.linear);
      }
    },
    child: Container(
      width: 325,
      height: 50,
      margin: const EdgeInsets.only(top: 100, left: 25, right: 25),
      decoration: appBoxShadow(),
      child: Center(
        child: text16Normal(text: "next", color: Colors.white),
      ),
    ),
  );
}

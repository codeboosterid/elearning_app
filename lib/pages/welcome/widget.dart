import 'package:flutter/material.dart';
import '../../common/utils/app_colors.dart';
import '../../common/widgets/app_shadow.dart';
import '../../common/widgets/text_widgets.dart';

Widget appOnboardingPage(
  PageController controller,
  BuildContext context, {
  String imgPath = "",
  String title = "",
  String subtitle = "",
  index = 0,
}) {
  return Column(
    children: [
      Image.asset(imgPath, fit: BoxFit.fitWidth),
      Container(
        margin: const EdgeInsets.only(top: 15),
        child: text24Normal(text: title, color: AppColors.primaryBg),
      ),
      Container(
        margin: const EdgeInsets.only(top: 15),
        padding: const EdgeInsets.only(left: 30, right: 30),
        child: text16Normal(text: subtitle),
      ),
      _nextButton(index, controller, context)
    ],
  );
}

Widget _nextButton(int index, PageController controller, BuildContext context) {
  return GestureDetector(
    onTap: () {
      if (index < 3) {
        controller.animateToPage(index,
            duration: const Duration(milliseconds: 300), curve: Curves.linear);
      } else {
        Navigator.pushNamed(context, "/signIn");
      }
    },
    child: Container(
      width: 325,
      height: 50,
      margin: const EdgeInsets.only(top: 100, left: 25, right: 25),
      decoration: appBoxShadow(),
      child: Center(
        child: text16Normal(
            text: index < 3 ? "Next" : "Get started", color: Colors.white),
      ),
    ),
  );
}

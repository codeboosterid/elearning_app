import 'package:flutter/material.dart';
import '../utils/app_colors.dart';
import 'app_shadow.dart';
import 'text_widgets.dart';

Widget appButton({
  String buttonName = "",
  double width = 360,
  double height = 50,
  bool isLogin = true,
  BuildContext? context,
  void Function()? func,
}) {
  return GestureDetector(
    onTap: func,
    child: Container(
      width: width,
      height: height,
      decoration: appBoxShadow(
          color: isLogin ? AppColors.primaryElement : Colors.white,
          boxBorder: Border.all(color: AppColors.primaryFourthElementText)),
      child: Center(
        child: Text16Normal(
            text: buttonName,
            color:
                isLogin ? AppColors.primaryBackground : AppColors.primaryText),
      ),
    ),
  );
}

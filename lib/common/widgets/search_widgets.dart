import 'package:flutter/cupertino.dart';

import '../utils/app_colors.dart';
import '../utils/image_res.dart';
import 'app_shadow.dart';
import 'app_textfield.dart';
import 'image_widgets.dart';

Widget searchBar() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Container(
        width: 310,
        height: 40,
        decoration: appBoxShadow(
          color: AppColors.primaryBackground,
          boxBorder: Border.all(color: AppColors.primaryBackground),
        ),
        child: Row(
          children: [
            Container(
              margin: const EdgeInsets.only(left: 17),
              child: appImage(imagePath: ImageRes.searchIcon),
            ),
            SizedBox(
              width: 240,
              height: 20,
              child: appTextFieldOnly(
                  width: 240, height: 40, hintText: "Search your course"),
            )
          ],
        ),
      ),
      GestureDetector(
        onTap: () {},
        child: Container(
          padding: const EdgeInsets.all(5),
          width: 40,
          height: 40,
          decoration: appBoxShadow(
              boxBorder: Border.all(color: AppColors.primaryElement)),
          child: appImage(imagePath: ImageRes.searchButton),
        ),
      )
    ],
  );
}

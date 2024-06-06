import 'package:flutter/material.dart';

import '../utils/app_colors.dart';
import '../utils/image_res.dart';

BoxDecoration appBoxShadow({
  Color color = AppColors.primaryElement,
  double radius = 15,
  double sR = 1,
  double bR = 2,
  BoxBorder? boxBorder,
  BorderRadius? borderRadius,
}) {
  return BoxDecoration(
      color: color,
      borderRadius: BorderRadius.circular(radius),
      border: boxBorder,
      boxShadow: [
        BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: sR,
            blurRadius: bR,
            offset: const Offset(0, 1))
      ]);
}
//chatty

BoxDecoration appBoxShadowWithRadius(
    {Color color = AppColors.primaryElement,
    double radius = 15,
    double sR = 1,
    double bR = 2,
    BoxBorder? boxBorder}) {
  return BoxDecoration(
      color: color,
      borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20), topRight: Radius.circular(20)),
      border: boxBorder,
      boxShadow: [
        BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: sR,
            blurRadius: bR,
            offset: const Offset(0, 1))
      ]);
}

BoxDecoration appBoxDecorationTextField(
    {Color color = AppColors.primaryBackground,
    double radius = 15,
    Color borderColor = AppColors.primaryFourthElementText}) {
  return BoxDecoration(
      color: color,
      borderRadius: BorderRadius.circular(radius),
      border: Border.all(color: borderColor));
}

class AppBoxDecorationImage extends StatelessWidget {
  final double width;
  final double height;
  final String imagePath;

  const AppBoxDecorationImage(
      {super.key,
      this.width = 40,
      this.height = 40,
      this.imagePath = ImageRes.profile});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: width,
      decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.fitHeight,
            image: NetworkImage(
              imagePath,
            ),
          ),
          borderRadius: BorderRadius.circular(20)),
    );
  }
}

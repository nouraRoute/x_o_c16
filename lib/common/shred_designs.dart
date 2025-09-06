import 'package:flutter/material.dart';
import 'package:x_o/common/app_colors.dart';

class ShredDesigns {
  static const BoxDecoration gradientDecoration = BoxDecoration(
      gradient: LinearGradient(
          colors: [AppColors.mainColor, AppColors.secColor],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight));
  static const BoxDecoration whiteCardDecoration = BoxDecoration(
      color: Colors.white, borderRadius: BorderRadius.all(Radius.circular(44)));
}

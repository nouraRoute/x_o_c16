import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:x_o/common/app_consts.dart';

class GameButton extends StatelessWidget {
  const GameButton({super.key, required this.value, required this.onTap});
  final String value; //'
  final void Function() onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(10),
        color: Colors.white,
        alignment: Alignment(0, 0),
        child: value == 'x'
            ? SvgPicture.asset(AppConsts.xImage)
            : value == 'o'
                ? SvgPicture.asset(AppConsts.oImage)
                : SizedBox(),
      ),
    );
  }
}

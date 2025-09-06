import 'package:flutter/material.dart';
import 'package:x_o/common/app_colors.dart';
import 'package:x_o/common/shred_designs.dart';

class ScoreView extends StatelessWidget {
  const ScoreView({
    super.key,
    required this.xScore,
    required this.oScore,
  });
  final int xScore, oScore;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20),
      width: double.infinity,
      decoration: ShredDesigns.whiteCardDecoration,
      alignment: const Alignment(0, 0),
      child: Text(
        '$xScore:$oScore',
        style: const TextStyle(
            color: AppColors.blackColor,
            fontSize: 32,
            fontWeight: FontWeight.w600),
      ),
    );
  }
}

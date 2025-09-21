
import 'package:dots_indicator/dots_indicator.dart';
import 'package:evently_app/core/resources/colors_manager.dart';
import 'package:flutter/material.dart';

class CustomDotsIndicatorWidget extends StatelessWidget {
  const CustomDotsIndicatorWidget({
    super.key,
    required this.pos,
  });

  final double pos;

  @override
  Widget build(BuildContext context) {
    return DotsIndicator(
      dotsCount: 3,
      position: pos,
      decorator: DotsDecorator(
        color: ColorsManager.black1c,
        activeColor: ColorsManager.blue,
        size: Size(8, 8),
        activeSize: Size(24, 8),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4),
        ),
        activeShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4),
        ),
        spacing: EdgeInsets.all(4),
      ),
    );
  }
}

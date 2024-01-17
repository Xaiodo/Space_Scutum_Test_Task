import 'package:flutter/material.dart';

import '../pages/house_page/house.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.onPressed,
    required this.child,
    this.height = 40,
    this.borderColor = AppColors.black,
    this.backgroundColor = AppColors.transperent,
    this.margin = const EdgeInsets.only(bottom: 30),
  });

  final VoidCallback onPressed;
  final double height;
  final EdgeInsetsGeometry margin;
  final Color borderColor;
  final Color backgroundColor;
  final Widget child;

  @override
  Widget build(BuildContext context) => GestureDetector(
        onTap: onPressed,
        child: Container(
          height: height,
          margin: margin,
          decoration: BoxDecoration(
            color: backgroundColor,
            border: Border.all(
              color: borderColor,
              width: 1,
            ),
            borderRadius: BorderRadius.circular(16),
          ),
          child: child,
        ),
      );
}

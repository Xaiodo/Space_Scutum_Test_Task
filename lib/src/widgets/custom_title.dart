import 'package:flutter/material.dart';
import 'package:space_scutum_test_task/src/values/app_colors.dart';

class CustomTitle extends StatelessWidget {
  final String title;
  final bool isIconVisible;
  final IconData icon;
  final double size;
  final Alignment firstItemAlignment;
  final Alignment secondItemAlignment;
  final VoidCallback? iconOnPressed;

  const CustomTitle({
    super.key,
    required this.title,
    this.isIconVisible = true,
    this.icon = Icons.add,
    this.size = 32,
    this.firstItemAlignment = Alignment.center,
    this.secondItemAlignment = Alignment.centerRight,
    this.iconOnPressed,
  });

  @override
  Widget build(BuildContext context) => Stack(
        alignment: Alignment.center,
        children: [
          Align(
            alignment: firstItemAlignment,
            child: Text(
              title,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          ),
          if (isIconVisible)
            Align(
              alignment: secondItemAlignment,
              child: GestureDetector(
                onTap: iconOnPressed,
                child: Icon(
                  icon,
                  size: size,
                  color: AppColors.black,
                ),
              ),
            ),
        ],
      );
}

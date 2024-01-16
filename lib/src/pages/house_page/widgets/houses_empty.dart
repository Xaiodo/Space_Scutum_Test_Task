import 'package:flutter/material.dart';
import '/src/widgets/custom_title.dart';
import '../house.dart';

class HousesEmpty extends StatelessWidget {
  const HousesEmpty({super.key});

  @override
  Widget build(BuildContext context) => const Expanded(
        child: Center(
          child: CustomTitle(
            title: AppConstants.noHousesText,
            isIconVisible: false,
            size: 28,
          ),
        ),
      );
}

import 'package:flutter/material.dart';
import 'package:space_scutum_test_task/src/values/app_colors.dart';

class CustomInput extends StatelessWidget {
  final String name;
  final ValueChanged<String> onTextChanged;
  final double backScpaceWidth;
  final bool isFieldExpanded;

  const CustomInput({
    super.key,
    required this.name,
    required this.onTextChanged,
    this.backScpaceWidth = 34,
    this.isFieldExpanded = true,
  });

  @override
  Widget build(BuildContext context) => Row(
        children: [
          Expanded(
            flex: 2,
            child: Text(
              name,
              textAlign: TextAlign.center,
            ),
          ),
          Expanded(
            flex: isFieldExpanded ? 3 : 1,
            child: SizedBox(
              child: TextField(
                onChanged: onTextChanged,
                decoration: const InputDecoration(
                  filled: true,
                  fillColor: AppColors.textFieldBackgroundColor,
                  isCollapsed: true,
                  enabledBorder: InputBorder.none,
                  focusedBorder: InputBorder.none,
                ),
              ),
            ),
          ),
          SizedBox(width: backScpaceWidth),
        ],
      );
}

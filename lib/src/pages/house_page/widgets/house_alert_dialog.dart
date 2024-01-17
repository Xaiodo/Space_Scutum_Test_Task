import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:space_scutum_test_task/src/pages/house_page/state/house_cubit.dart';
import 'package:space_scutum_test_task/src/values/app_colors.dart';
import 'package:space_scutum_test_task/src/values/app_constants.dart';
import 'package:space_scutum_test_task/src/widgets/custom_input.dart';
import 'package:space_scutum_test_task/src/widgets/custom_title.dart';

class HouseAlertDialog extends StatefulWidget {
  const HouseAlertDialog({super.key});

  @override
  State<HouseAlertDialog> createState() => _HouseAlertDialogState();
}

class _HouseAlertDialogState extends State<HouseAlertDialog> {
  String? name;
  int? floorCount;

  void _onAddHousePressed(BuildContext context, String? name, int? floorCount) {
    if (name == null || floorCount == null) {
      return;
    }
    context.read<HouseCubit>().addHouse(name, floorCount);
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) => AlertDialog(
        title: CustomTitle(
          title: AppConstants.addHouseAlertdialogTitle,
          size: 28,
          icon: Icons.close_rounded,
          iconOnPressed: () => Navigator.of(context).pop(),
        ),
        contentPadding: const EdgeInsets.only(top: 14),
        titlePadding: EdgeInsets.zero,
        actionsPadding: const EdgeInsets.only(bottom: 10, right: 21),
        elevation: 0,
        shape: const RoundedRectangleBorder(
          side: BorderSide(
            color: AppColors.black,
            width: 1,
          ),
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CustomInput(
              name: AppConstants.addHouseAlertdialogNameHint,
              onTextChanged: (value) => name = value,
            ),
            const SizedBox(height: 19),
            CustomInput(
              name: AppConstants.addHouseAlertdialogFloorsCountHint,
              onTextChanged: (value) => floorCount = int.tryParse(value),
              backScpaceWidth: 132,
              isFieldExpanded: false,
            ),
            const SizedBox(height: 20),
          ],
        ),
        actions: [
          SizedBox(
            width: 98,
            child: ElevatedButton(
              onPressed: () => _onAddHousePressed(context, name, floorCount),
              style: ElevatedButton.styleFrom(
                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
              ),
              child: Text(
                AppConstants.addHouseAlertdialogAddButtonText,
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            ),
          ),
        ],
      );
}

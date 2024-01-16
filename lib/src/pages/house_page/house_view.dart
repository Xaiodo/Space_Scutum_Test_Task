import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:space_scutum_test_task/src/pages/house_page/widgets/houses_empty.dart';
import 'package:space_scutum_test_task/src/pages/house_page/widgets/houses_error.dart';
import 'package:space_scutum_test_task/src/pages/house_page/widgets/houses_loaded.dart';
import 'house.dart';
import 'package:space_scutum_test_task/src/pages/house_page/widgets/house_alert_dialog.dart';
import 'package:space_scutum_test_task/src/widgets/custom_title.dart';

class HouseView extends StatelessWidget {
  const HouseView({super.key});

  void _onAddHousePressed(BuildContext context) {
    showDialog(
      context: context,
      barrierColor: AppColors.transperent,
      builder: (BuildContext context) {
        return const HouseAlertDialog();
      },
    );
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        body: Padding(
          padding: const EdgeInsets.only(left: 66, right: 66, top: 98),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(
                height: 40,
                child: ElevatedButton(
                  onPressed: () => _onAddHousePressed(context),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.white,
                  ),
                  child: const CustomTitle(
                    title: AppConstants.addHouseButtonText,
                    size: 28,
                  ),
                ),
              ),
              const SizedBox(height: 30),
              BlocBuilder<HouseCubit, HouseState>(
                builder: (context, state) {
                  switch (state.status) {
                    case HouseStatus.loading:
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    case HouseStatus.loaded:
                      return HousesLoaded(houses: state.houses);
                    case HouseStatus.empty:
                      return const HousesEmpty();
                    default:
                      return const HousesError();
                  }
                },
              ),
            ],
          ),
        ),
      );
}

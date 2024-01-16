import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:space_scutum_test_task/src/pages/lift_page/lift_view.dart';
import '../house.dart';

class HousesLoaded extends StatelessWidget {
  const HousesLoaded({super.key, required this.houses});

  final List<House> houses;

  void _onHousePressed(BuildContext context, House house) {
    context.read<HouseCubit>().selectHouse(house);
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const LiftView(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) => Expanded(
        child: ListView.builder(
          itemCount: houses.length,
          padding: const EdgeInsets.symmetric(vertical: 0),
          itemBuilder: (context, index) => GestureDetector(
            onTap: () => _onHousePressed(context, houses[index]),
            child: Container(
              height: 40,
              margin: const EdgeInsets.only(bottom: 30),
              decoration: BoxDecoration(
                border: Border.all(
                  color: AppColors.black,
                  width: 1,
                ),
                borderRadius: BorderRadius.circular(16),
              ),
              child: ListTile(
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 9,
                  vertical: 0,
                ),
                leading: Text(
                  AppConstants.houseListTileLeadingText,
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                visualDensity: const VisualDensity(
                  horizontal: 0,
                  vertical: -4,
                ),
                title: Text(
                  houses[index].name,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
              ),
            ),
          ),
        ),
      );
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:space_scutum_test_task/src/pages/lift_page/lift.dart';
import 'package:space_scutum_test_task/src/widgets/custom_button.dart';

class LiftLoaded extends StatelessWidget {
  const LiftLoaded({
    required this.house,
    super.key,
  });

  final House house;

  @override
  Widget build(BuildContext context) => Expanded(
        child: ListView.builder(
          shrinkWrap: true,
          itemCount: house.floorCount,
          itemBuilder: (context, index) => CustomButton(
            onPressed: () => context.read<LiftCubit>().moveBetweenFloors(index),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: context.read<LiftCubit>().getFloorColor(index),
              ),
              alignment: Alignment.center,
              child: Text(
                'Floor ${index + 1}',
                style: Theme.of(context).textTheme.bodyLarge,
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ),
      );
}

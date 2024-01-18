import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:space_scutum_test_task/src/notifications/background_notification_handler.dart';
import 'package:space_scutum_test_task/src/pages/lift_page/lift.dart';
import 'package:space_scutum_test_task/src/pages/lift_page/widgets/lift_empty.dart';
import 'package:space_scutum_test_task/src/pages/lift_page/widgets/lift_error.dart';
import 'package:space_scutum_test_task/src/pages/lift_page/widgets/lift_loaded.dart';
import 'package:space_scutum_test_task/src/pages/lift_page/widgets/lift_loading.dart';

class LiftView extends StatelessWidget {
  const LiftView({super.key});

  @override
  Widget build(BuildContext context) => BlocProvider(
        create: (context) => LiftCubit(
          houseCubit: context.read<HouseCubit>(),
          repository: context.read<HouseRepository>(),
          backgroundNotificationHandler:
              context.read<BackgroundNotificationHandler>(),
        ),
        child: Scaffold(
          body: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  left: 25,
                  right: 25,
                  top: 110,
                  bottom: 60,
                ),
                child: Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      alignment: Alignment.centerLeft,
                      child: Text(
                        AppConstants.liftPageTitle,
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                    ),
                    const Divider(
                      color: AppColors.black,
                    ),
                    BlocBuilder<LiftCubit, LiftState>(
                      builder: (context, state) {
                        switch (state.status) {
                          case LiftStatus.empty:
                            return const LiftEmpty();
                          case LiftStatus.loading:
                            return const LiftLoading();
                          case LiftStatus.loaded:
                            return LiftLoaded(house: state.house);
                          case LiftStatus.error:
                            return const LiftError();
                        }
                      },
                    )
                  ],
                ),
              ),
              Positioned(
                bottom: 22,
                left: 21,
                child: Text(
                  AppConstants.desingedBy,
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
              ),
            ],
          ),
        ),
      );
}

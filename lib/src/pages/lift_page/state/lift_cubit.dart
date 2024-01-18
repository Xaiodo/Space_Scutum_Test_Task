import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:space_scutum_test_task/src/notifications/background_notification_handler.dart';
import '../lift.dart';

class LiftCubit extends Cubit<LiftState> {
  LiftCubit({
    required HouseRepository repository,
    required HouseCubit houseCubit,
    required BackgroundNotificationHandler backgroundNotificationHandler,
  })  : _houseRepository = repository,
        _houseCubit = houseCubit,
        _backgroundNotificationHandler = backgroundNotificationHandler,
        super(
          const LiftState(house: House.empty()),
        ) {
    init();
  }

  final HouseRepository _houseRepository;
  final HouseCubit _houseCubit;
  final BackgroundNotificationHandler _backgroundNotificationHandler;

  void init() {
    try {
      if (_houseCubit.state.selectedHouse == null) {
        emit(
          state.copyWith(house: const House.empty(), status: LiftStatus.error),
        );
      } else {
        final house = _houseCubit.state.selectedHouse!;
        final floor = house.selectedFloorNumber;
        emit(state.copyWith(
          house: house,
          moveToFloor: floor,
          status: LiftStatus.loaded,
        ));
      }
    } catch (e) {
      emit(state.copyWith(status: LiftStatus.error));
    }
  }

  Color getFloorColor(int floor) {
    if (floor == state.house.selectedFloorNumber) {
      return AppColors.selectedItemColor;
    } else if (floor == state.moveToFloor) {
      return AppColors.moveToFloorColor;
    } else {
      return AppColors.transperent;
    }
  }

  Future<void> moveBetweenFloors(int floor) async {
    try {
      if (state.isLiftMoving) return;
      final currentFloor = state.house.selectedFloorNumber;
      if (floor == currentFloor) return;
      emit(
        state.copyWith(moveToFloor: floor, isLiftMoving: true),
      );
      if (floor > currentFloor) {
        for (var i = currentFloor + 1; i <= floor; i++) {
          await Future.delayed(const Duration(seconds: 3), () {
            emit(
              state.copyWith(
                house: state.house.copyWith(selectedFloorNumber: i),
              ),
            );
            scheduleNotification();
          });
        }
      } else {
        for (var i = currentFloor - 1; i >= floor; i--) {
          await Future.delayed(const Duration(seconds: 3), () {
            emit(
              state.copyWith(
                house: state.house.copyWith(selectedFloorNumber: i),
              ),
            );
            scheduleNotification();
          });
        }
      }

      await _houseRepository.updateHouse(
        state.house.copyWith(selectedFloorNumber: floor),
      );

      _houseCubit.updateHouse(
        state.house,
      );

      emit(state.copyWith(isLiftMoving: false));
    } catch (e) {
      emit(state.copyWith(status: LiftStatus.error));
    }
  }

  void scheduleNotification() {
    _backgroundNotificationHandler.showNotification(
      state.house.name,
      'Lift is on ${state.moveToFloor + 1} floor',
    );
  }
}

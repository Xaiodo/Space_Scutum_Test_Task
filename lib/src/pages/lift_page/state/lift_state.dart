import 'package:equatable/equatable.dart';
import 'package:space_scutum_test_task/src/models/house.dart';

enum LiftStatus {
  empty,
  loaded,
  loading,
  error,
}

class LiftState extends Equatable {
  const LiftState({
    required this.house,
    this.moveToFloor = 0,
    this.isLiftMoving = false,
    this.status = LiftStatus.empty,
  });

  final House house;
  final int moveToFloor;
  final bool isLiftMoving;
  final LiftStatus status;

  LiftState copyWith({
    House? house,
    int? moveToFloor,
    bool? isLiftMoving,
    LiftStatus? status,
  }) =>
      LiftState(
        house: house ?? this.house,
        moveToFloor: moveToFloor ?? this.moveToFloor,
        isLiftMoving: isLiftMoving ?? this.isLiftMoving,
        status: status ?? this.status,
      );

  @override
  List<Object?> get props => [house, moveToFloor, isLiftMoving, status];
}

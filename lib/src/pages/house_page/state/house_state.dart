import 'package:equatable/equatable.dart';
import 'package:space_scutum_test_task/src/models/house.dart';

enum HouseStatus { empty, loading, loaded, error }

final class HouseState extends Equatable {
  const HouseState({
    this.status = HouseStatus.empty,
    this.houses = const <House>[],
    this.selectedHouse,
  });

  final HouseStatus status;
  final List<House> houses;
  final House? selectedHouse;

  HouseState copyWith({
    HouseStatus? status,
    List<House>? houses,
    House? selectedHouse,
  }) {
    return HouseState(
      status: status ?? this.status,
      houses: houses ?? this.houses,
      selectedHouse: selectedHouse ?? this.selectedHouse,
    );
  }

  @override
  List<Object?> get props => [status, houses, selectedHouse];
}

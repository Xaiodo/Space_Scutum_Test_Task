import 'package:equatable/equatable.dart';
import 'package:space_scutum_test_task/src/models/house.dart';

enum HouseStatus { empty, loading, loaded, error }

final class HouseState extends Equatable {
  const HouseState({
    this.status = HouseStatus.empty,
    this.houses = const <House>[],
  });

  final HouseStatus status;
  final List<House> houses;

  HouseState copyWith({
    HouseStatus? status,
    List<House>? houses,
  }) {
    return HouseState(
      status: status ?? this.status,
      houses: houses ?? this.houses,
    );
  }

  @override
  List<Object?> get props => [status, houses];
}

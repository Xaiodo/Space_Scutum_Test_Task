import 'package:flutter_bloc/flutter_bloc.dart';

import '../house.dart';

class HouseCubit extends Cubit<HouseState> {
  HouseCubit({required HouseRepository repository})
      : _houseRepository = repository,
        super(const HouseState(status: HouseStatus.empty)) {
    getHouses();
  }

  final HouseRepository _houseRepository;

  Future<void> getHouses() async {
    emit(state.copyWith(status: HouseStatus.loading));
    try {
      final houses = await _houseRepository.getHouses();

      if (houses.isEmpty) {
        emit(state.copyWith(status: HouseStatus.empty));
        return;
      }
      emit(state.copyWith(
        status: HouseStatus.loaded,
        houses: houses,
      ));
    } catch (e) {
      emit(state.copyWith(status: HouseStatus.error));
    }
  }

  Future<void> addHouse(String name, int floorsCount) async {
    final newHouses = await _houseRepository.addHouse(name, floorsCount);

    emit(state.copyWith(
      status: HouseStatus.loaded,
      houses: newHouses,
    ));
  }

  void selectHouse(House house) {
    emit(state.copyWith(
      selectedHouse: house,
    ));
  }

  void updateHouse(House house) async {
    final updatedHouses = state.houses.map((e) {
      if (e.id == house.id) {
        return house;
      } else {
        return e;
      }
    }).toList();

    emit(state.copyWith(
      status: HouseStatus.loaded,
      houses: updatedHouses,
      selectedHouse: house,
    ));
  }
}

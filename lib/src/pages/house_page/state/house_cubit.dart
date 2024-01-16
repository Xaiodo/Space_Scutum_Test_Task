import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:space_scutum_test_task/src/pages/house_page/state/house_state.dart';
import 'package:space_scutum_test_task/src/repositories/houses_repository.dart';

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
      print('Error: $e');
    }
  }

  Future<void> addHouse(String name, int floorsCount) async {
    final newHouses = await _houseRepository.addHouse(name, floorsCount);

    emit(state.copyWith(
      status: HouseStatus.loaded,
      houses: newHouses,
    ));
  }
}

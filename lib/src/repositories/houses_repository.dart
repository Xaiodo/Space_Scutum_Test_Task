import 'package:space_scutum_test_task/src/models/house.dart';
import 'package:space_scutum_test_task/src/values/app_constants.dart';
import 'package:sqflite/sqflite.dart';

class HouseRepository {
  final Database _database;

  const HouseRepository({required Database database}) : _database = database;

  Future<List<House>> getHouses() async {
    final List<Map<String, Object?>> result = await _database.query(
      AppConstants.housesTableName,
    );
    final houses = result.map((e) => House.fromJson(e)).toList();
    return houses;
  }

  Future<List<House>> addHouse(String name, int floorCount) async {
    await _database.insert(AppConstants.housesTableName, {
      'name': name,
      'floorCount': floorCount,
      'selectedFloorNumber': 0,
    });

    final houses = await getHouses();
    return houses;
  }

  Future<void> updateHouse(House house) async {
    await _database.update(
      AppConstants.housesTableName,
      house.toJson(),
      where: 'id = ?',
      whereArgs: [house.id],
    );
  }
}

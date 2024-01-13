import 'package:path/path.dart';
import 'package:space_scutum_test_task/src/values/app_constants.dart';
import 'package:sqflite/sqflite.dart';

abstract class SqliteHelper {
  static Future<Database> initDatabase() async {
    final directory = await getDatabasesPath();
    final path = join(directory, AppConstants.databaseName);
    return await openDatabase(
      path,
      version: 1,
      onCreate: _onCreate,
    );
  }

  static void _onCreate(Database db, int version) async => await db.execute(
        '''
        CREATE TABLE ${AppConstants.housesTableName}(
          id INTEGER PRIMARY KEY,
          name TEXT,
          floorCount INTEGER
          selectedFloorNumber INTEGER
        )
        ''',
      );
}

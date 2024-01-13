import 'package:flutter/material.dart';
import 'package:space_scutum_test_task/app/app_view.dart';
import 'package:space_scutum_test_task/src/database/sqlite_helper.dart';
import 'package:space_scutum_test_task/src/providers/dependencies_provider.dart';
import 'package:space_scutum_test_task/src/values/theme.dart';
import 'package:sqflite/sqflite.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final db = await SqliteHelper.initDatabase();
  runApp(MyApp(
    db: db,
  ));
}

class MyApp extends StatelessWidget {
  final Database db;
  const MyApp({required this.db, super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: theme,
      home: DependenciesProvider(database: db, child: const AppView()),
    );
  }
}

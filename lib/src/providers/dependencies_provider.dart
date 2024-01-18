import 'package:flutter/material.dart';
import 'package:space_scutum_test_task/src/notifications/background_notification_handler.dart';
import 'package:space_scutum_test_task/src/repositories/houses_repository.dart';
import 'package:sqflite/sqflite.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DependenciesProvider extends StatelessWidget {
  final Database database;
  final Widget child;

  const DependenciesProvider({
    super.key,
    required this.database,
    required this.child,
  });

  @override
  Widget build(BuildContext context) => MultiRepositoryProvider(
        providers: [
          RepositoryProvider(create: (context) => database),
          RepositoryProvider(
            create: (context) => HouseRepository(database: database),
          ),
          RepositoryProvider(
            create: (context) => BackgroundNotificationHandler(),
          ),
        ],
        child: child,
      );
}

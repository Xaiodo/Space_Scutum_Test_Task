import 'package:flutter/material.dart';
import 'package:space_scutum_test_task/app/app_view.dart';
import 'package:space_scutum_test_task/src/values/theme.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: theme,
      home: const AppView(),
    );
  }
}

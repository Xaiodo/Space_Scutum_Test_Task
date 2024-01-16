import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:space_scutum_test_task/src/pages/house_page/state/house_cubit.dart';
import 'package:space_scutum_test_task/src/repositories/houses_repository.dart';

class AppMultiBlocProvider extends StatelessWidget {
  const AppMultiBlocProvider({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) => MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => HouseCubit(
              repository: context.read<HouseRepository>(),
            ),
          ),
        ],
        child: child,
      );
}

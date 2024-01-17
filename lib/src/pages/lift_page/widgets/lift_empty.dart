import 'package:flutter/material.dart';

class LiftEmpty extends StatelessWidget {
  const LiftEmpty({super.key});

  @override
  Widget build(BuildContext context) => Center(
        child: Text(
          'This house has no floors',
          style: Theme.of(context).textTheme.bodyLarge,
        ),
      );
}

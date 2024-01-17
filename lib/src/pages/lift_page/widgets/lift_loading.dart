import 'package:flutter/material.dart';

class LiftLoading extends StatelessWidget {
  const LiftLoading({super.key});

  @override
  Widget build(BuildContext context) => const Center(
        child: CircularProgressIndicator(),
      );
}

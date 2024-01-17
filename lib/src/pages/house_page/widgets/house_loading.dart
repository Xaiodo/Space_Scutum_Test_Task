import 'package:flutter/material.dart';

class HouseLoading extends StatelessWidget {
  const HouseLoading({super.key});

  @override
  Widget build(BuildContext context) => const Center(
        child: CircularProgressIndicator(),
      );
}

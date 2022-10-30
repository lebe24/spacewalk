import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

class Rivewall extends StatelessWidget {
  const Rivewall({super.key});

  @override
  Widget build(BuildContext context) {
    return RiveAnimation.asset(
        'assets/cosmos.riv',
        fit: BoxFit.cover,
    );
  }
}
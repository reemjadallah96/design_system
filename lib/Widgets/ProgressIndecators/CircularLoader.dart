import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

/**
 * Themed Circular Progress Indicator displays an animating linear bar.
 * It blocks the user from interacting with the application when the application is busy.
 */
class CircularLoader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CircularProgressIndicator(
      color: ColorTokens.primary_green_10,
      strokeWidth: 2,
    );
  }
}

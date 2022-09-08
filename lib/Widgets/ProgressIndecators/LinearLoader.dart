import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

/**
 * Themed Linear Progress Indicator displays an animating linear bar.
 * It blocks the user from interacting with the application when the application is busy.
 */
class LinearLoader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LinearProgressIndicator(
      color: ColorTokens.primary_green_10,
      backgroundColor: Color(0xFFDCDCDC),
    );
  }
}

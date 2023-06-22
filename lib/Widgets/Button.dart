import 'package:design_system/Tokens.dart/ColorTokens.dart';
import 'package:flutter/material.dart';

enum ButtonType { primary, secondary, text, danger }

/**
 * Button widget with different types ('primary', 'secondary', 'text', 'danger')
 * Default themed button is 'primary'
 */
class Button extends StatelessWidget {
  final String text;
  final ButtonType type;
  final double width, height;
  final double elevation;
  final double borderRadius;
  final VoidCallback onPressed;
  final VoidCallback onLongPress;
  final IconData icon;
  final bool isLoading;

  Button({
    @required this.text,
    @required this.onPressed,
    this.type = ButtonType.primary,
    this.width = double.infinity,
    this.height = 40,
    this.elevation,
    this.borderRadius = 4,
    this.onLongPress,
    this.icon,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    Color color;
    Color borderColor;
    switch (type) {
      case ButtonType.secondary:
        color = Colors.white;
        borderColor = ColorTokens.primary_blue_30;
        break;
      case ButtonType.text:
        color = Colors.white;
        borderColor = Colors.white;
        break;
      case ButtonType.danger:
        color = Colors.red;
        borderColor = Colors.red;
        break;
      default:
        color = ColorTokens.primary_blue_30;
        borderColor = ColorTokens.primary_blue_30;
        break;
    }

    return SizedBox(
      width: width,
      height: height,
      child: MaterialButton(
        child: buttonContent,
        elevation: elevation,
        onPressed: isLoading ? null : onPressed,
        onLongPress: isLoading ? null : onLongPress,
        disabledColor: Colors.grey,
        color: color,
        shape: RoundedRectangleBorder(
          side: BorderSide(color: borderColor),
          borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
        ),
      ),
    );
  }

  Widget get buttonContent {
    Color textColor;
    switch (type) {
      case ButtonType.text:
      case ButtonType.secondary:
        textColor = ColorTokens.primary_blue_30;
        break;
      default:
        textColor = Colors.white;
        break;
    }
    if (isLoading) return CircularProgressIndicator(color: Color(0xFF58D890));
    Widget textWidget = Text(
      text,
      style: TextStyle(color: textColor, fontSize: 16),
    );
    if (icon == null) return textWidget;
    return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
      Icon(icon, color: Colors.white),
      SizedBox(width: 8),
      textWidget,
    ]);
  }
}

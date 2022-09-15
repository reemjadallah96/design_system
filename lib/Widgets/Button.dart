import 'package:design_system/Tokens.dart/ColorTokens.dart';
import 'package:flutter/material.dart';

/**
 * Button widget with different types ('primary', 'secondary', 'text', 'danger')
 * Default themed button is 'primary'
 */
class Button extends StatelessWidget {
  final String text;
  final String type;
  final double width, height;
  final VoidCallback onPressed;
  final VoidCallback? onLongPress;
  final IconData? icon;
  final bool isLoading;

  Button({
    required this.text,
    required this.onPressed,
    this.type = 'primary',
    this.width = double.infinity,
    this.height = 40,
    this.onLongPress,
    this.icon,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    Color color;
    Color borderColor;
    switch (type) {
      case 'secondary':
        {
          color = Colors.white;
          borderColor = ColorTokens.primary_blue_30;
          break;
        }
      case 'text':
        {
          color = Colors.white;
          borderColor = Colors.white;
          break;
        }
      case 'danger':
        {
          color = Colors.red;
          borderColor = Colors.red;
          break;
        }
      default:
        {
          color = ColorTokens.primary_blue_30;
          borderColor = ColorTokens.primary_blue_30;
          break;
        }
    }

    return SizedBox(
      width: width,
      height: height,
      child: MaterialButton(
        child: buttonContent,
        onPressed: isLoading ? null : onPressed,
        onLongPress: isLoading ? null : onLongPress,
        disabledColor: Colors.grey,
        color: color,
        shape: RoundedRectangleBorder(
          side: BorderSide(color: borderColor),
          borderRadius: BorderRadius.all(Radius.circular(4)),
        ),
      ),
    );
  }

  Widget get buttonContent {
    Color textColor;
    switch (type) {
      case 'text':
      case 'secondary':
        {
          textColor = ColorTokens.primary_blue_30;
          break;
        }
      default:
        {
          textColor = Colors.white;
          break;
        }
    }
    if (isLoading) return CircularProgressIndicator(color: Color(0xFF58D890));
    Widget textWidget = Text(
      text,
      style: TextStyle(color: textColor, fontSize: 16),
    );
    if (icon == null) return textWidget;
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon, color: Colors.white),
        SizedBox(width: 8),
        textWidget,
      ],
    );
  }
}

import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String buttonText;
  final Function()? onPressed;
  final bool isLoading;
  final double buttonHeight;
  final double buttonWidth;

  const CustomButton({
    required this.isLoading,
    required this.onPressed,
    required this.buttonText,
    this.buttonHeight = 40,
    this.buttonWidth = double.infinity,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: buttonHeight,
      width: buttonWidth,
      child: ElevatedButton(
        style: Theme.of(context).elevatedButtonTheme.style,
        onPressed: isLoading ? null : onPressed,
        child: isLoading
            ? SizedBox(
                height: 20,
                width: 20,
                child: CircularProgressIndicator(
                  strokeWidth: 1.5,
                ))
            : Text(
                buttonText.toUpperCase(),
                style: Theme.of(context).textTheme.labelSmall,
              ),
      ),
    );
  }
}

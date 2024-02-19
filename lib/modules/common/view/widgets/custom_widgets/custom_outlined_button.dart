import 'package:flutter/material.dart';

class CustomOutlinedButton extends StatelessWidget {
  final String buttonText;
  final Function()? onPressed;
  final bool isLoading;
  final double buttonHeight;
  final double buttonWidth;

  const CustomOutlinedButton({
    required this.isLoading,
    required this.onPressed,
    required this.buttonText,
    this.buttonHeight = 40,
    this.buttonWidth = double.maxFinite,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: buttonHeight,
      width: buttonWidth,
      child: OutlinedButton(
        onPressed: isLoading ? null : onPressed,
        child: isLoading
            ? const SizedBox(
                height: 20,
                width: 20,
                child: CircularProgressIndicator(
                  strokeWidth: 1.5,
                ),
              )
            : Text(
                buttonText.toUpperCase(),
              ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class CustomElevatedButton extends StatelessWidget {
  final String buttonText;
  final Function()? onPressed;
  final bool isLoading;
  final double buttonHeight;
  final double buttonWidth;

  const CustomElevatedButton({
    super.key,
    required this.buttonText,
    required this.onPressed,
    required this.isLoading,
    this.buttonHeight = 40,
    this.buttonWidth = double.maxFinite,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: buttonHeight,
      width: buttonWidth,
      child: ElevatedButton(
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

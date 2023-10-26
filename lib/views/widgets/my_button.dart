import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomButton extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;
  final Color backgroundColor;
  final Color textColor;

  const CustomButton({
    super.key,
    required this.label,
    required this.onPressed,
    required this.backgroundColor,
    required this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ButtonStyle(
        minimumSize: MaterialStateProperty.all<Size>(
          Size(280.w, 70.h),
        ),
        backgroundColor: MaterialStateProperty.all<Color>(backgroundColor),
      ),
      child: Text(
        label,
        style: TextStyle(color: textColor, fontSize: 16),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFF0E4B64),
      height: 100.h,
      width: 1920.w,
      child: const Align(
        alignment: Alignment.centerLeft,
        child: Padding(
          padding: EdgeInsets.only(left: 24.0),
          child: Text(
            'SGS',
            style: TextStyle(
              fontSize: 24,
              color: Colors.white, // Text color
            ),
          ),
        ),
      ),
    );
  }
}

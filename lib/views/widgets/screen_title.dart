// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ScreenTitle extends StatelessWidget {
  String title;
  ScreenTitle({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 100.h,
          width: 1750.w,
          color: const Color(0XFF26685C),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.only(left: 24),
              child: Text(
                title,
                style: TextStyle(color: Colors.white, fontSize: 36.sp),
              ),
            ),
          ),
        ),
        Container(
          height: 100.h,
          width: 170.w,
          color: const Color(0XFF61B947),
          child: Image.asset('assets/sound.png'),
        ),
      ],
    );
  }
}

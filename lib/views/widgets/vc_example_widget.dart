import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class VCExampleWidget extends StatelessWidget {
  final String text;

  VCExampleWidget(this.text);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 500.w,
      height: 130.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(4.r),
        ),
        color: const Color(0XFFFFFFFF),
        border: Border.all(
          color: const Color(0xFF26685C),
          width: 2.w,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(13.0),
        child: Text(
          text,
          style: TextStyle(
            color: const Color(0XFF26685C),
            fontSize: 22.sp,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../widgets/custom_appbar.dart';
import '../widgets/my_button.dart';
import '../widgets/screen_title.dart';
import '../widgets/vc_example_widget.dart';

class VoiceCommandScreen extends StatefulWidget {
  const VoiceCommandScreen({Key? key}) : super(key: key);

  @override
  State<VoiceCommandScreen> createState() => _VoiceCommandScreenState();
}

class _VoiceCommandScreenState extends State<VoiceCommandScreen> {
  bool isProcessing = false;
  String helpText = 'Help me find ...';

  void toggleProcessing() {
    setState(() {
      isProcessing = !isProcessing;
    });
    if (isProcessing = true) {
      // Set a delayed task to change the help text after 2 seconds
      Future.delayed(const Duration(seconds: 2), () {
        setState(() {
          helpText = 'Help me find an elevator.';
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background Image
          Image.asset(
            'assets/backgraound.png',
            width: double.infinity,
            height: double.infinity,
            fit: BoxFit.cover,
          ),
          Positioned(
              top: 80,
              right: 1080,
              child: SvgPicture.asset('assets/leftArrow.svg')),
          Column(
            children: [
              const CustomAppBar(),
              ScreenTitle(title: 'VOICE COMMAND'),
              SizedBox(height: 150.h),
              GestureDetector(
                onTap: toggleProcessing,
                child: Container(
                  width: 190.w,
                  height: 190.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.circular(250.r),
                    ),
                    color: const Color(0XFFE9FFFB),
                    border: Border.all(
                      color: const Color(0xFFE3E3E3),
                      width: 3.0,
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(30),
                    child: SvgPicture.asset('assets/microphone.svg'),
                  ),
                ),
              ),
              SizedBox(height: !isProcessing ? 28.h : 53.h),
              !isProcessing
                  ? Column(
                      children: [
                        SvgPicture.asset('assets/sun.svg'),
                        Text(
                          'Voice Command Examples',
                          style: TextStyle(
                              color: const Color(0XFF26685C), fontSize: 40.sp),
                        ),
                        SizedBox(height: 35.h),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            VCExampleWidget(
                                '"Want to know your flight status?\n'
                                'Try \'Check the status of Flight ABC\'\n'
                                'or \'Is my flight delayed?"'),
                            SizedBox(width: 16.w),
                            VCExampleWidget(
                                '"For assistance with accessibility,\n'
                                'say \'I need wheelchair assistance\'\n'
                                'or \'Help me find an elevator."'),
                            SizedBox(width: 16.w),
                            VCExampleWidget('"You can change your language\n'
                                'preference by saying \'Switch to\n'
                                'Arabic\' or \'Use Arabic, please.\'"'),
                          ],
                        ),
                      ],
                    )
                  : Column(
                      children: [
                        Text(
                          'Processing ...',
                          style: TextStyle(
                              color: const Color(0XFF26685C),
                              fontSize: 40.sp,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 57.h),
                        Text(
                          helpText,
                          style: TextStyle(
                              color: const Color(0XFF000000),
                              fontSize: 22.sp,
                              fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
              SizedBox(height: 100.h),
            ],
          ),
          Positioned(
            top: 670,
            child: Container(
              width: 1784.w,
              margin: const EdgeInsets.only(left: 60),
              child: Row(
                children: [
                  CustomButton(
                    label: 'English',
                    onPressed: () {
                      // Add your onPressed logic here
                    },
                    backgroundColor: Colors.white,
                    textColor: Colors.black,
                  ),
                  const SizedBox(width: 20),
                  CustomButton(
                    label: 'عربي',
                    onPressed: () {
                      // Add your onPressed logic here
                    },
                    backgroundColor: const Color(0xFF00000047),
                    textColor: Colors.white,
                  ),
                  const Spacer(),
                  CustomButton(
                    label: 'Help',
                    onPressed: () {
                      // Add your onPressed logic here
                    },
                    backgroundColor: Colors.white,
                    textColor: const Color(0XFF61B947),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

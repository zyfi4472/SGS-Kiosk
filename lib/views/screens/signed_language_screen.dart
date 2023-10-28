import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../widgets/custom_appbar.dart';
import '../widgets/my_button.dart';
import '../widgets/screen_title.dart';
import '../widgets/sl_example_widget.dart';

class SignedLanguageScreen extends StatefulWidget {
  const SignedLanguageScreen({Key? key}) : super(key: key);

  @override
  State<SignedLanguageScreen> createState() => _SignedLanguageScreenState();
}

class _SignedLanguageScreenState extends State<SignedLanguageScreen> {
  bool isProcessing = false;
  bool isResponse = false;
  String helpText = 'Help me find ...';
  String processing = 'Processing ...';

  void toggleProcessing() {
    setState(() {
      isProcessing = !isProcessing;
    });
    if (isProcessing = true) {
      // Set a delayed task to change the help text after 2 seconds
      Future.delayed(const Duration(milliseconds: 1500), () {
        setState(() {
          helpText = 'Help me find an elevator.';
          Future.delayed(const Duration(milliseconds: 1500), () {
            setState(() {
              processing = 'Response';
              isResponse = true;
            });
          });
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
              child: GestureDetector(
                  onTap: () => {Navigator.pop(context)},
                  child: SvgPicture.asset('assets/leftArrow.svg'))),
          Column(
            children: [
              const CustomAppBar(),
              ScreenTitle(title: 'SIGNED LANGUAGE'),
              SizedBox(height: !isResponse ? 50.h : 20.h),
              GestureDetector(
                onTap: toggleProcessing,
                child: SizedBox(
                  width: isResponse ? 674.w : 540.w,
                  height: isResponse ? 380.h : 300.h,
                  child: Image.asset('assets/ganja.png'),
                ),
              ),
              SizedBox(height: !isProcessing || isResponse ? 25.h : 53.h),
              !isProcessing
                  ? Column(
                      children: [
                        SvgPicture.asset('assets/sun.svg'),
                        SizedBox(height: 35.h),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SLExampleWidget('assets/videos/arrivalsVideo.mp4'),
                            SizedBox(width: 16.w),
                            SLExampleWidget('assets/videos/baggageVideo.mp4'),
                            SizedBox(width: 16.w),
                            SLExampleWidget('assets/videos/cartVideo.mp4'),
                          ],
                        ),
                      ],
                    )
                  : !isResponse
                      ? Container(
                          width: 500.w,
                          height: 130.h,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(
                              Radius.circular(4.r),
                            ),
                            color: const Color(0XFFFFFFFF),
                            border: Border.all(
                              color: const Color(0xFF26685C),
                              width: 2.0,
                            ),
                          ),
                          child: Center(
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 58.0),
                              child: Text(
                                helpText,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: const Color(0XFF000000),
                                    fontSize: 32.sp,
                                    fontWeight: FontWeight.w500),
                              ),
                            ),
                          ),
                        )
                      : Container(
                          height: 354.h,
                          width: 1784.w,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(
                              Radius.circular(4.r),
                            ),
                            color: const Color(0XFF0F4B65),
                            border: Border.all(
                              color: const Color(0xFFFFFFFF),
                              width: 2.0,
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(35, 30, 500, 20),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Sure, I can help you with that. To find the nearest elevator, please follow these directions:\n\n'
                                  '1. Head straight ahead towards the main corridor.\n'
                                  '2. Turn right when you reach the corridor.\n'
                                  '3. Continue down the corridor until you see the elevator doors on your left.\n'
                                  '4. Take the elevator to your desired floor.\n\n'
                                  'If you need any further assistance or have more questions, feel free to ask. Safe travels!',
                                  style: TextStyle(
                                      color: const Color(0XFFFFFFFF),
                                      fontSize: 24.sp),
                                )
                              ],
                            ),
                          ),
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

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../widgets/my_button.dart';
import 'signed_language_screen.dart';
import 'voice_command_screen.dart';

class CommandSelectionScreen extends StatefulWidget {
  const CommandSelectionScreen({Key? key}) : super(key: key);

  @override
  State<CommandSelectionScreen> createState() => _CommandSelectionScreenState();
}

class _CommandSelectionScreenState extends State<CommandSelectionScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(1920.w, 100.h),
        child: AppBar(
          backgroundColor: const Color(0xFF0E4B64),
          title: const Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'SGS',
              style: TextStyle(
                fontSize: 24,
              ),
            ),
          ),
          automaticallyImplyLeading: false,
        ),
      ),
      body: Stack(
        children: [
          // Background Image
          Image.asset(
            'assets/backgraound.png',
            width: double.infinity,
            height: double.infinity,
            fit: BoxFit.cover,
          ),
          Column(
            children: [
              Row(
                children: [
                  Container(
                    height: 100.h,
                    width: 1750.w,
                    color: const Color(0XFF26685C),
                    child: const Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Choose Your Preferred Mode Of Communication',
                        style: TextStyle(color: Colors.white),
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
              ),
              Container(
                height: 114.h,
                width: 1920.w,
                color: Colors.white,
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Choose Your Preferred Mode Of Communication',
                    style: TextStyle(
                        color: const Color(0XFF26685C),
                        fontSize: 62.sp,
                        fontFamily: 'Fingerspelling'),
                  ),
                ),
              ),
              SizedBox(height: 55.h),
              Row(
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: GestureDetector(
                      onTap: () => {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    const VoiceCommandScreen()))
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(
                            Radius.circular(10.r),
                          ),
                          color: Colors.white,
                        ),
                        margin: const EdgeInsets.only(left: 60),
                        height: 540.h,
                        width: 580.w,
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(25, 45, 40, 60),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SvgPicture.asset(
                                'assets/voiceCommand.svg',
                                width: 100.w,
                                height: 90.h,
                              ),
                              SizedBox(height: 24.h),
                              const Text(
                                'VOICE COMMAND',
                                style: TextStyle(color: Color(0XFF0E4B64)),
                              ),
                              SizedBox(height: 35.h),
                              const Text(
                                'How To Use Voice Commands',
                                style: TextStyle(color: Color(0XFF26685C)),
                              ),
                              SizedBox(height: 35.h),
                              const Text(
                                '- To begin, stand in front of the kiosk\'s microphone.\n',
                                style: TextStyle(color: Colors.black),
                              ),
                              const Text(
                                '- Clearly say "Start" to activate voice commands.\n',
                                style: TextStyle(color: Colors.black),
                              ),
                              const Text(
                                '- Wait for the acknowledgment prompt, then speak your request.',
                                style: TextStyle(color: Colors.black),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () => {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  const SignedLanguageScreen()))
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(
                          Radius.circular(10.r),
                        ),
                        color: Colors.white,
                      ),
                      margin: const EdgeInsets.only(left: 60),
                      height: 540.h,
                      width: 580.w,
                      child: Stack(
                        // Use Stack to overlay the yellow container
                        children: [
                          Padding(
                            padding: const EdgeInsets.fromLTRB(25, 45, 10, 20),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SvgPicture.asset(
                                  'assets/signedLanguage.svg',
                                  width: 87.w,
                                  height: 100.h,
                                ),
                                SizedBox(height: 24.h),
                                const Text(
                                  'SIGNED LANGUAGE',
                                  style: TextStyle(color: Color(0XFF0E4B64)),
                                ),
                                SizedBox(height: 35.h),
                                const Text(
                                  'How To Use Signed Language',
                                  style: TextStyle(color: Color(0XFF26685C)),
                                ),
                                SizedBox(height: 35.h),
                                const Text(
                                  '- For signed language assistance, stand in front of the camera.\n',
                                  style: TextStyle(color: Colors.black),
                                ),
                                const Text(
                                  '- Perform clear and deliberate sign language gestures.\n',
                                  style: TextStyle(color: Colors.black),
                                ),
                                const Text(
                                  '- The system will recognize and respond to your signs.',
                                  style: TextStyle(color: Colors.black),
                                ),
                              ],
                            ),
                          ),
                          Positioned(
                            top: 10,
                            right: 10,
                            child: Container(
                              width: 110.w,
                              height: 100.h,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(10.r),
                                ),
                                color: Colors.amber,
                                border: Border.all(
                                  color: const Color(0xFF61B947),
                                  width: 3.0,
                                ),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 10.0),
                                    child: SvgPicture.asset(
                                      'assets/playbutton.svg',
                                      height: 30.h,
                                      width: 30.w,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 4.0),
                                    child: Text(
                                      'Video',
                                      style: TextStyle(
                                          color: const Color(0XFF61B947),
                                          fontSize: 32.sp,
                                          fontFamily: 'Fingerspelling'),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                          Positioned(
                            right: 70,
                            bottom: 30,
                            child: SvgPicture.asset(
                              'assets/rightArrow.svg',
                              width: 48.w,
                              height: 30.h,
                            ),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(height: 27.h),
              Container(
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
              )
            ],
          ),
        ],
      ),
    );
  }
}

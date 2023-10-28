import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:video_player/video_player.dart';

class SLExampleWidget extends StatefulWidget {
  final String videoPath;

  SLExampleWidget(this.videoPath, {Key? key}) : super(key: key);

  @override
  _SLExampleWidgetState createState() => _SLExampleWidgetState();
}

class _SLExampleWidgetState extends State<SLExampleWidget> {
  late VideoPlayerController _videoController;

  @override
  void initState() {
    _videoController = VideoPlayerController.asset(widget.videoPath)
      ..initialize().then((_) {
        // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
        setState(() {});
      });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _videoController.setLooping(true);
          _videoController.value.isPlaying
              ? _videoController.pause()
              : _videoController.play();
        });
      },
      child: Container(
        width: 480.w,
        height: 270.h,
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
        child: _videoController.value.isInitialized
            ? AspectRatio(
                aspectRatio: _videoController.value.aspectRatio,
                child: VideoPlayer(_videoController),
              )
            : Container(),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _videoController.dispose();
  }
}

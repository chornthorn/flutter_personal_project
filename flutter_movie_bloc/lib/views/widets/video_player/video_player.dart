import 'package:flick_video_player/flick_video_player.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:my_movie/utils/mock_data.dart';
import 'package:video_player/video_player.dart';
import 'package:visibility_detector/visibility_detector.dart';

import 'video_player_control.dart';

class VideoPlayer extends StatefulWidget {
  final String url;
  VideoPlayer({Key key, this.url}) : super(key: key);

  @override
  _VideoPlayerState createState() => _VideoPlayerState();
}

class _VideoPlayerState extends State<VideoPlayer> {
  FlickManager flickManager;
  @override
  void initState() {
    super.initState();
    flickManager = FlickManager(
      videoPlayerController: VideoPlayerController.network(widget.url),
    );
  }

  @override
  void dispose() {
    flickManager.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return VisibilityDetector(
      key: ObjectKey(flickManager),
      onVisibilityChanged: (visibility) {
        if (visibility.visibleFraction == 0 && this.mounted) {
          flickManager.flickControlManager.autoPause();
        } else if (visibility.visibleFraction == 1) {
          flickManager.flickControlManager.autoResume();
        }
      },
      child: Container(
        child: FlickVideoPlayer(
          flickManager: flickManager,
          preferredDeviceOrientation: [],
          systemUIOverlayFullscreen: [],
          flickVideoWithControls: FlickVideoWithControls(
            controls: VideoPlayControl(
              progressBarSettings: FlickProgressBarSettings(
                playedColor: Color.fromRGBO(108, 165, 242, 0.5),
              ),
            ),
          ),
          flickVideoWithControlsFullscreen: FlickVideoWithControls(
            controls: VideoPlayControl(
              progressBarSettings: FlickProgressBarSettings(
                playedColor: Color.fromRGBO(108, 165, 242, 0.5),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

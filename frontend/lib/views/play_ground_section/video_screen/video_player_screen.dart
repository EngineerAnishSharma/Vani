import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class VideoPlayerScreen extends StatefulWidget {
  final String videoId;
  final String videoName;

  const VideoPlayerScreen({
    Key? key,
    required this.videoName,
    required this.videoId,
  }) : super(key: key);

  @override
  _VideoPlayerScreenState createState() => _VideoPlayerScreenState();
}

class _VideoPlayerScreenState extends State<VideoPlayerScreen> {
  late YoutubePlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = YoutubePlayerController(
      initialVideoId: widget.videoId,
      flags: const YoutubePlayerFlags(
        autoPlay: true,
        mute: false,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SafeArea(
              child: YoutubePlayer(
            controller: _controller,
            bottomActions: [
              PlayPauseButton(),
              ProgressBar(),
              CurrentPosition(),
              RemainingDuration()
            ],
            showVideoProgressIndicator: true,
            progressIndicatorColor: Colors.blue,
            progressColors: const ProgressBarColors(),
          )),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              widget.videoName,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    _controller.dispose();
    super.dispose();
  }
}

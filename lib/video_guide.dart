import 'package:blanc_f/util/commonutil.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class VideoGuidePage extends StatefulWidget {
  const VideoGuidePage({super.key});

  @override
  State<VideoGuidePage> createState() => _VideoGuidePageState();
}

class _VideoGuidePageState extends State<VideoGuidePage> {
  late YoutubePlayerController _controller;

  @override
  void initState() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
    ]);
    super.initState();

    _controller = YoutubePlayerController(
      initialVideoId: 'IBWWb_Xw7ZQ',
      flags: const YoutubePlayerFlags(autoPlay: true, hideControls: true, loop: true),
    );
  }

  @override
  void dispose() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: SystemUiOverlay.values);
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WillPopScope(
        onWillPop: () => _onBackPressed(context),
        child: Scaffold(
          body: getDevType() == "aos" ? _buildGuide() : _buildGuide(),
        ),
      ),
    );
  }

  Future<bool> _onBackPressed(BuildContext context) async {
    Navigator.of(context).pop();
    return true;
  }

  Widget _buildGuide() {
    return Stack(
      children: [
        YoutubePlayerBuilder(
            player: YoutubePlayer(
              controller: _controller,
              showVideoProgressIndicator: true,
            ),
            builder: (context, player) {
              return player;
            }),
        Positioned(
          top: 15 / 2,
          right: 15 / 2,
          child: InkWell(
            onTap: () {
              _onBackPressed(context);
            },
            child: SizedBox.square(
              dimension: 40,
              child: Image.asset('assets/ic_close.png'),
            ),
          ),
        ),
      ],
    );
  }
}

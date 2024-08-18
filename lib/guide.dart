import 'package:blanc_f/util/commonutil.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class GuidePage extends StatefulWidget {
  const GuidePage({super.key});

  @override
  State<GuidePage> createState() => _GuidePageState();
}

class _GuidePageState extends State<GuidePage> {
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
      flags: const YoutubePlayerFlags(
          autoPlay: true, hideControls: true, loop: true),
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

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => _onBackPressed(context),
      child: Scaffold(
        body: getDevType() == "aos" ? _buildGuide() : _buildGuide(),
      ),
    );
  }

  Future<bool> _onBackPressed(BuildContext context) async {
    Navigator.of(context).pop();
    return true;
  }

  Widget _buildGuide() {
    return YoutubePlayerBuilder(
        player: YoutubePlayer(
          aspectRatio: 16 / 9,
          controller: _controller,
          showVideoProgressIndicator: true,
        ),
        builder: (context, player) {
          return player;
        });
  }
}

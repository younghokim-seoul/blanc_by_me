import 'package:blanc_f/util/commonutil.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class GuidePage extends StatelessWidget {
  const GuidePage({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
    ]);

    return WillPopScope(
      onWillPop: () => _onBackPressed(context),
      child: Scaffold(
        body: getDevType() == "aos"
            ? SafeArea(child: _buildGuide(context))
            : _buildGuide(context),
      ),
    );
  }

  Future<bool> _onBackPressed(BuildContext context) async {
    Navigator.of(context).pop();
    return true;
  }

  Widget _buildGuide(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          child: Image.asset(
            "assets/bg.png",
            width: double.infinity,
            height: double.infinity,
            fit: BoxFit.fill,
          ),
        ),
        Positioned(
          top: 15 / 2,
          right: 15 / 2,
          child: InkWell(
            onTap: () {
              _onBackPressed(context);
            },
            child: SizedBox.square(dimension: 40),
          ),
        ),
      ],
    );
  }
}

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

    Future<bool> _onBackPressed(BuildContext context) async {
      Navigator.of(context).pop();
      return true;
    }

    return WillPopScope(
      onWillPop: () => _onBackPressed(context),
      child: Scaffold(
        body: Stack(
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
          ),

      )
    );

    // return WillPopScope(
    //   onWillPop: _onBackPressed(context),
    //   child: Material(
    //     type: MaterialType.transparency,
    //     child: Container(
    //       color: Colors.white,
    //       child: SafeArea(
    //         bottom: false,
    //         child: Container(
    //           child: Scaffold(
    //             key: widget.scaffoldKey,
    //             resizeToAvoidBottomInset: widget.isAvoidResize,
    //             drawer: widget.drawer,
    //             body: SafeArea(
    //               child: Container(
    //                 height: MediaQuery.of(context).size.height,
    //                 color: HOME_BACK,
    //                 child: Center(
    //                   child: widget.child,
    //                 ),
    //               ),
    //             ),
    //             floatingActionButton: widget.floatingButton,
    //           ),
    //         ),
    //       ),
    //     ),
    //   ),
    // );
  }
}

import 'package:flutter/material.dart';

class Bounce extends StatefulWidget {
  final Widget child;
  final Duration duration;

  Bounce({required this.child, required this.duration});

  @override
  BounceState createState() => BounceState();
}

class BounceState extends State<Bounce> with TickerProviderStateMixin {
  late AnimationController bouncingController;
  late Animation bouncingAnimation;
  static const Duration shadowDuration = Duration(milliseconds: 1000);

  Duration get userDuration => widget.duration;
  bool touchedFloor = false;

  @override
  void initState() {
    startAnimation();
    super.initState();
  }

  @override
  void dispose() {
    bouncingController.dispose();
    super.dispose();
  }

  void startAnimation() {
    print("startAnimation");
    bouncingController =
        AnimationController(vsync: this, duration: shadowDuration);
    bouncingAnimation = Tween(begin: Offset(0, 0), end: Offset(0, -10.0))
        .animate(bouncingController);
    bouncingController.addListener(() => setState(() {}));
    bouncingController.forward();

    bouncingController.addStatusListener((status) {
      print("bouncingController status: $status");
      if (status == AnimationStatus.completed) {
        bouncingController.reverse();
        touchedFloor = !touchedFloor;
      } else if (status == AnimationStatus.dismissed) {
        touchedFloor = !touchedFloor;
        bouncingController.forward(from: 0.0);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Transform.translate(
      offset: bouncingAnimation.value,
      child: widget.child,
    );
  }
}

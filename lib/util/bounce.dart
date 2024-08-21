import 'package:flutter/material.dart';
import 'package:flutter/physics.dart';

class Bounce extends StatefulWidget {
  final double size;
  final Widget child;
  final Duration duration;

  const Bounce({super.key, this.size = 92, required this.child, required this.duration});

  @override
  BounceState createState() => BounceState();
}

class BounceState extends State<Bounce> with TickerProviderStateMixin {
  late AnimationController bouncingController;
  late Animation bouncingAnimation;
  late Animation shadowAnimation;
  static const Duration shadowDuration = Duration(milliseconds: 700);

  Duration get userDuration => widget.duration;
  bool touchedFloor = false;

  @override
  void initState() {
    startAnimation();
    super.initState();
  }

  @override
  void dispose() {
    print('boundce dispose');
    bouncingController.dispose();
    super.dispose();
  }

  void startAnimation() {
    print("startAnimation");
    bouncingController = AnimationController(vsync: this, duration: shadowDuration);


    // bouncingAnimation = Tween(begin: Offset(0, 20), end: Offset(0, -50.0)).animate(bouncingController);

    bouncingAnimation = TweenSequence<Offset>(
      <TweenSequenceItem<Offset>>[
        TweenSequenceItem<Offset>(
          tween: Tween(begin: Offset(0, 20), end: Offset(0, -10))
              .chain(CurveTween(curve: Curves.easeIn)),
          weight: 50.0,
        ),
        TweenSequenceItem<Offset>(
          tween: Tween(begin: Offset(0, -10), end: Offset(0, -35))
              .chain(CurveTween(curve: Curves.easeOut)),
          weight: 50.0,
        ),
      ],
    ).animate(bouncingController);


    shadowAnimation = Tween(begin: 1.0, end: 0.0).animate(CurvedAnimation(curve: const Interval(0.4, 1.0), parent: bouncingController));

    bouncingController.addListener(() => setState(() {}));
    bouncingController.forward();

    bouncingController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        bouncingController.reverse();
        touchedFloor = !touchedFloor;
      } else if (status == AnimationStatus.dismissed) {
        touchedFloor = !touchedFloor;
        bouncingController.forward(from: 0.0);
      }
    });
  }

  Widget bouncingWidget() {
    return Transform.translate(offset: bouncingAnimation.value, child: widget.child);
  }

  Widget shadowWidget() {
    double shadowOpacity = shadowAnimation.value;
    Color shadowColor = Colors.black.withOpacity(touchedFloor ? 0.3 : 0.1);
    double shadowHeight = touchedFloor ? 0.25 : 0.25;
    double shadowWidth = widget.size / (touchedFloor ? 5 : 2.5);
    BoxDecoration shadowDecoration = BoxDecoration(
        color: shadowColor,
        borderRadius: BorderRadius.circular(360),
        boxShadow: [BoxShadow(color: shadowColor, blurRadius: 5, spreadRadius: 5)]);

    return AnimatedOpacity(
      duration: shadowDuration,
      opacity: shadowOpacity,
      child: AnimatedContainer(
        height: shadowHeight,
        width: shadowWidth,
        duration: shadowDuration,
        decoration: shadowDecoration,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.all(8.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            bouncingWidget(),
            shadowWidget(),
          ],
        ),);
  }
}

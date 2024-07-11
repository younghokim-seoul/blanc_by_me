import 'package:blanc_f/base/base_state.dart';
import 'package:blanc_f/global/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class PageLayout extends StatefulWidget {
  PageLayout(
      {Key? key,
      required this.child,
      this.onBack,
      this.isLoading,
      this.isAvoidResize,
      this.drawer,
      this.floatingButton,
      this.scaffoldKey})
      : super(key: key) {
    this.isLoading ??= false;
    this.isAvoidResize ??= true;
    this.drawer ??= null;
  }

  Widget child;
  Future<bool> Function()? onBack;
  bool? isLoading;
  bool? isAvoidResize;
  Widget? drawer;
  Widget? floatingButton;
  final GlobalKey<ScaffoldState>? scaffoldKey;

  @override
  PageLayoutState createState() => PageLayoutState();
}

class PageLayoutState extends BaseState<PageLayout> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: widget.onBack,
      child: Material(
        type: MaterialType.transparency,
        child: Container(
          color: Colors.white,
          child: SafeArea(
            bottom: false,
            child: Container(
              child: Scaffold(
                key: widget.scaffoldKey,
                resizeToAvoidBottomInset: widget.isAvoidResize,
                drawer: widget.drawer,
                body: SafeArea(
                  child: Container(
                    height: MediaQuery.of(context).size.height,
                    color: HOME_BACK,
                    child: Center(
                      child: widget.child,
                    ),
                  ),
                ),
                floatingActionButton: widget.floatingButton,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

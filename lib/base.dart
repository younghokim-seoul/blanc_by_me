import 'package:flutter/material.dart';

/**
 * 베이즈 페이지
 */
abstract class BasePage extends StatefulWidget {
  BasePage({Key? key}) : super(key: key);

  BaseState<BasePage>? myState;

  void setState(BaseState<BasePage> state) {
    myState = state;
  }
}

abstract class BaseState<Page extends BasePage> extends State<Page> {
  BuildContext getContext();
}
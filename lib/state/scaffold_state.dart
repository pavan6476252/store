import 'dart:isolate';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyScaffoldState extends ChangeNotifier {
  GlobalKey<ScaffoldState> scaffoldState = GlobalKey<ScaffoldState>();

  setDrawerState() {
    scaffoldState.currentState!.openDrawer();
  }
}

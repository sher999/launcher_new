import 'package:device_apps/device_apps.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:launcher_new/pages/page1.dart';
import 'package:launcher_new/pages/page2.dart';
import 'package:launcher_new/widgets/clock.dart';
import 'dart:core';

import 'package:timer_builder/timer_builder.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var wallpaper;
  bool accessStorage = false;

  final BouncingScrollPhysics _bouncingScrollPhysics =
      const BouncingScrollPhysics();

  @override
  void initState() {
    accessStorage = false;
    super.initState();
  }

  // Future<bool> handleStoragePermission() async {
  //   PermissionStatus storagePermissionStatus = await _getPermissionStatus();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: PageView(
          children: [
            const Page1(),
            const Page2(),
          ],
        ),
      ),
    );
  }
}

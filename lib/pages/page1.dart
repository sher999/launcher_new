import 'package:device_apps/device_apps.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:launcher_new/widgets/brightness.dart';

import '../widgets/clock.dart';

class Page1 extends StatefulWidget {
  const Page1({Key? key}) : super(key: key);

  @override
  State<Page1> createState() => _Page1State();
}

class _Page1State extends State<Page1> {
  final BouncingScrollPhysics _bouncingScrollPhysics =
      const BouncingScrollPhysics();

  @override
  Widget build(BuildContext context) {
    return PageView(
      children: const [
        Clock(),
        
        // second page app list
      ],
    );
  }
}

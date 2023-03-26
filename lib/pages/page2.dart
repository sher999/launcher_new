import 'package:device_apps/device_apps.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:launcher_new/widgets/applist.dart';

import '../widgets/clock.dart';

class Page2 extends StatefulWidget {
  const Page2({Key? key}) : super(key: key);

  @override
  State<Page2> createState() => _Page2State();
}

class _Page2State extends State<Page2> {
  final BouncingScrollPhysics _bouncingScrollPhysics =
      const BouncingScrollPhysics();

  @override
  Widget build(BuildContext context) {
    return PageView(
      children: const [
        AppList(),
      ],
    );
  }
}

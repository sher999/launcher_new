import 'package:device_apps/device_apps.dart';
import 'package:flutter/material.dart';
import 'dart:core';

import 'package:timer_builder/timer_builder.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  BouncingScrollPhysics _bouncingScrollPhysics = BouncingScrollPhysics();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.black,
        child: PageView(
          children: [
            Container(
              child: Column(
                children: [
                  TimerBuilder.periodic(Duration(seconds: 1),
                      builder: (context) {
                    var currentTime = DateTime.now();

                    String seconds = currentTime.second < 10
                        ? "0${currentTime.second}"
                        : "${currentTime.second}";

                    String minute = currentTime.minute < 10
                        ? "0${currentTime.minute}"
                        : "${currentTime.minute}";

                    String hours = currentTime.hour < 10
                        ? "0${currentTime.hour}"
                        : "${currentTime.hour}";

                    return Column(
                      children: [
                        SizedBox(
                          height: 350,
                        ),
                        Text(
                          "$hours",
                          style: TextStyle(color: Colors.white, fontSize: 100),
                        ),
                        // SizedBox(height:0),
                        Text(
                          "$minute",
                          style: TextStyle(color: Colors.white, fontSize: 60),
                        ),
                        SizedBox(
                          height: 3,
                        ),
                        Text(
                          "$seconds",
                          style: TextStyle(color: Colors.white, fontSize: 30),
                        ),
                      ],
                    );
                  })
                ],
              ),
            ),
            // second page app list
            FutureBuilder(
              future: DeviceApps.getInstalledApplications(
                includeSystemApps: true,
                includeAppIcons: true,
                onlyAppsWithLaunchIntent: true,
              ),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  List<Application>? allApps =
                      snapshot.data as List<Application>?;

                  allApps?.sort((a, b) => a.toString().compareTo(b.toString()));

                  return ListView(
                    physics: _bouncingScrollPhysics,
                    children: List.generate(allApps!.length, (index) {
                      return GestureDetector(
                        onTap: () {
                          DeviceApps.openApp(allApps[index].packageName);
                        },
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(16),
                              child: Row(children: [
                                SizedBox(
                                  height: 30,
                                  width: 30,
                                  child: Image.memory(
                                      (allApps[index] as ApplicationWithIcon)
                                          .icon),
                                ),
                                SizedBox(
                                  width: 15,
                                ),
                                Text(
                                  "${allApps[index].appName}",
                                  style: TextStyle(color: Colors.white),
                                ),
                              ]),
                            )
                          ],
                        ),
                      );
                    }),
                  );
                }

                return Container(
                  child: Center(child: CircularProgressIndicator()),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}

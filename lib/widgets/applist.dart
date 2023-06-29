import 'package:device_apps/device_apps.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:hive/hive.dart';
import 'package:launcher_new/main.dart';

class AppList extends StatefulWidget {
  const AppList({Key? key}) : super(key: key);

  @override
  State<AppList> createState() => _AppListState();
}

class _AppListState extends State<AppList> {
  final BouncingScrollPhysics _bouncingScrollPhysics =
      const BouncingScrollPhysics();


  // refrence our box
  final _apps = Hive.box('apps');

  //write data
  void writeData() {}

  //read data
  void readData() {}


  //delete data
  void deleteData() {}
  


  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: DeviceApps.getInstalledApplications(
        includeSystemApps: true,
        includeAppIcons: true,
        onlyAppsWithLaunchIntent: true,
      ),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          List<Application>? allApps = snapshot.data as List<Application>?;
          // Hive.box(Apps).put('apps', allApps);

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
                              (allApps[index] as ApplicationWithIcon).icon),
                        ),
                        const SizedBox(
                          width: 15,
                        ),
                        Text(
                          allApps[index].appName,
                          style: const TextStyle(color: Colors.white),
                        ),
                      ]),
                    )
                  ],
                ),
              );
            }),
          );
        }

        return const Center(child: CircularProgressIndicator());
      },
    );
  }
}

import 'package:device_apps/device_apps.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:launcher_new/widgets/brightness.dart';
import 'package:launcher_new/widgets/screen_brightness.dart';
import 'package:launcher_new/widgets/volume.dart';
import 'package:launcher_new/widgets/weatherScreen.dart';
import 'package:timer_builder/timer_builder.dart';

class Clock extends StatelessWidget {
  const Clock({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TimerBuilder.periodic(const Duration(seconds: 1), builder: (context) {
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

            return Padding(
              padding: const EdgeInsets.fromLTRB(30, 0, 0, 0),
              child: Column(
                // crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 30,
                  ),
                  Text("$hours",
                      style: GoogleFonts.barlow(
                        textStyle: TextStyle(
                          color: Colors.white,
                          fontSize: 90,
                        ),
                      )),
                  SizedBox(height: 0),
                  Text(
                    "$minute",
                    style: TextStyle(color: Colors.white, fontSize: 90),
                  ),
                  // SizedBox(
                  //   height: 3,
                  // ),
                  // Text(
                  //   "$seconds",
                  //   style: TextStyle(color: Colors.white, fontSize: 70),
                  // ),
                ],
              ),
            );
          }),
          SizedBox(
            height: 100,
          ),
          Center(child: Weather()),
          SizedBox(
            height: 200,
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                Container(
                  height: 100,
                  width: 350,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: (() async {
                          // Check whether app is installed
                          bool isInstalled =
                              await DeviceApps.isAppInstalled('com.whatsapp');
          
                          // Call open the application what you want
                          DeviceApps.openApp('com.whatsapp');
                        }),
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              color: Color.fromARGB(115, 27, 26, 26)),
                          height: 70,
                          width: 70,
                          child: Icon(
                            Icons.whatsapp,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: (() async {
                          // Check whether app is installed
                          bool isInstalled =
                              await DeviceApps.isAppInstalled('com.whatsapp');
          
                          // Call open the application what you want
                          DeviceApps.openApp('com.google.android.dialer');
                        }),
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              color: Color.fromARGB(115, 27, 26, 26)),
                          height: 70,
                          width: 70,
                          child: Icon(
                            Icons.phone,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: (() async {
                          // Check whether app is installed
                          bool isInstalled =
                              await DeviceApps.isAppInstalled('com.whatsapp');
          
                          // Call open the application what you want
                          DeviceApps.openApp(
                              'com.google.android.apps.nbu.paisa.user');
                        }),
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              color: Color.fromARGB(115, 27, 26, 26)),
                          height: 70,
                          width: 70,
                          child: Icon(
                            Icons.currency_rupee_outlined,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: (() async {
                          // Check whether app is installed
                          bool isInstalled =
                              await DeviceApps.isAppInstalled('com.whatsapp');
          
                          // Call open the application what you want
                          DeviceApps.openApp('com.spotify.music');
                        }),
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              color: Color.fromARGB(115, 27, 26, 26)),
                          height: 70,
                          width: 70,
                          child: Icon(
                            Icons.music_note_outlined,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
            height: 100,
            width: 350,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: Color.fromARGB(115, 27, 26, 26)),
                  height: 70,
                  width: 70,
                  child: Icon(
                    Icons.swap_vert,
                    color: Colors.white,
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: Color.fromARGB(115, 27, 26, 26)),
                  height: 70,
                  width: 70,
                  child: Icon(
                    Icons.vibration,
                    color: Colors.white,
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: Color.fromARGB(115, 27, 26, 26)),
                  height: 70,
                  width: 70,
                  child: Icon(
                    Icons.wifi_outlined,
                    color: Colors.white,
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: Color.fromARGB(115, 27, 26, 26)),
                  height: 70,
                  width: 70,
                  child: Icon(
                    Icons.light_sharp,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
              ],
            ),
          ),
          
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                Volume(),
                SizedBox(
                  height: 10,
                ),
                Brightness(),
              ],
            ),
          )
        ],
      ),
    );
  }
}

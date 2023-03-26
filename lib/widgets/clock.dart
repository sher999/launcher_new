import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:timer_builder/timer_builder.dart';

class Clock extends StatelessWidget {
  const Clock({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(30, 0, 0, 0),
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
    
            return Column(
              
              // crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                
                SizedBox(
                  height: 30,
                ),
                Text(
                  "$hours",
                  style: GoogleFonts.barlow(
                   textStyle: TextStyle(
                    color: Colors.white,
                    fontSize: 90,
                  ),
                  )
                ),
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
            );
          })
        ],
      ),
    );
  }
}

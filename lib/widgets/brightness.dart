import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_screen_wake/flutter_screen_wake.dart';

class Brightness extends StatefulWidget {
  const Brightness({super.key});

  @override
  State<Brightness> createState() => _BrightnessState();
}

class _BrightnessState extends State<Brightness> {

  double brightness=0;
  Future<void> initPlatformBrightness()async{
    double bright;
    try{
      bright = await FlutterScreenWake.brightness;
    }on PlatformException{
      bright=1;
    }
    if(!mounted)return;

    setState(() {
      brightness= bright;
    });

  }


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initPlatformBrightness();
  }


  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.settings_display_outlined,color: Colors.black,size: 25,),
          Expanded(
            child: Slider(activeColor: Colors.lightBlue.shade400,inactiveColor: Colors.blue.shade100,max: brightness.toInt() < 1 ? 1 : brightness,value: brightness, onChanged: (value) {
              setState(() {
                brightness = value;
              });
              FlutterScreenWake.setBrightness(brightness);
              // if(brightness==0);
            },),
          ),
        ],
      ),
    );
  }
}
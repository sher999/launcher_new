import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:perfect_volume_control/perfect_volume_control.dart';

class Volume extends StatefulWidget {
  const Volume({super.key});

  @override
  State<Volume> createState() => _VolumeState();
}

class _VolumeState extends State<Volume> {
  double currentvol=0.5;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.volume_up_outlined,color: Colors.black,size: 25,),

          Expanded(
            child: Slider(inactiveColor: Colors.blue.shade100,activeColor: Colors.lightBlue.shade400,value: currentvol, onChanged:(Volume) {
              currentvol = Volume;
              PerfectVolumeControl.setVolume(Volume);
              setState(() {
                
              });

            },
            min:0,
            max:1,
            divisions: 100,
            
             )
          ),
        ],
      ),
    );
  }
}
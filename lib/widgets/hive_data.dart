import 'dart:typed_data';

import 'package:hive/hive.dart';

part 'hive_data.g.dart';


@HiveType(typeId:1)
class AppsList {
  AppsList({required this.name,required this.icon });
  @HiveField(0)
  String name;
  
  
  @HiveField(1)
  Uint8List icon;


}
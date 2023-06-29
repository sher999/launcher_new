import 'dart:convert';

import 'package:http/http.dart' as http ;
import 'package:launcher_new/widgets/weatherModel.dart';



class ApiHttp {
  static ApiHttp apiHttp = ApiHttp();

   
  Future<WeatherModel?> getData(String city )async{
    String link ="https://api.openweathermap.org/data/2.5/weather?q=$city,IN&appid=c09f599c88886b8f3802b557d6c1cb46";

    var response = await http.get(Uri.parse(link));
    if(response.statusCode==200){
      var json = jsonDecode(response.body);

      WeatherModel w1   = WeatherModel.fromJson(json);

      return w1;
    }
  }
}

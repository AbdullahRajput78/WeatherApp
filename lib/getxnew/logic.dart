import 'package:get/get.dart';
import 'package:dio/dio.dart';
import 'package:weatherreal/getxnew/weathermodel.dart';

class GetxnewLogic extends GetxController {
  /////////////////////////////////////////////////////////////// for selected cities
  String selectedCity = "Faisalabad";
  List<String> cities = [
    "Faisalabad",
    "Lahore",
    "Karachi",
    "Islamabad",
    "Multan",
    "Bahawalpur",
  ];


  WeatherModel? weatherobject;
  ////////////////////////////////////////////////////////////// for API calling
 final dio = Dio();
 Future<WeatherModel> getHttp() async {
   final response = await dio.get('https://api.weatherapi.com/v1/forecast.json?key=8b7667dfe600400baf561417262007&q=$selectedCity&days=1');
   return WeatherModel.fromJson(response.data);
 }
/////////////////////////////////////////////////////// for changing cities in dropdown
 Future <void> changecity(String city)async{
   selectedCity = city;
   weatherobject = await getHttp();
   update();
 }

 @override
 void onInit() async{
   // TODO: implement onInit
   super.onInit();
   weatherobject= await getHttp();
   // print(weatherobject?.cloud);
   update();
 }

}

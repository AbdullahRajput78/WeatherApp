class WeatherModel {
  String? city;
  String? country;
  String? icon;
  double? temp;
  int? humidity;
  double? wind;
  Map <String,dynamic>? conditionmap;
  int? cloud;
  int? rain;


  WeatherModel({
    this.city,
    this.country,
    this.temp,
    this.humidity,
    this.wind,
    this.conditionmap,
    this.icon,
    this.cloud,
    this.rain
  });

  WeatherModel.fromJson(Map<String, dynamic> json) {
    city = json['location']['name'];
    country = json['location']['country'];
    temp = json['current']['temp_c']?.toDouble();
    humidity = json['current']['humidity'];
    wind = json['current']['wind_kph']?.toDouble();
    conditionmap = json['current']['condition'];
    icon = json['current']['condition']["icon"];
    cloud = json['current']["cloud"];
    rain = json['forecast']['forecastday'][0]['day']['daily_chance_of_rain'];
  }
}


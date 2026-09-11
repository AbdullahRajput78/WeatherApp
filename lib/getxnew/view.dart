import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'logic.dart';

class GetxnewPage extends StatefulWidget {
  GetxnewPage({Key? key}) : super(key: key);

  @override
  State<GetxnewPage> createState() => _GetxnewPageState();
}

class _GetxnewPageState extends State<GetxnewPage> {
  final GetxnewLogic logic = Get.put(GetxnewLogic());

  @override
  void initState() {
    super.initState();
  }

  // final GetxnewState state = Bind.find<GetxnewLogic>().state;

  // final GetxnewState state = Bind.find<GetxnewLogic>().state;
  @override
  Widget build(BuildContext context) {
    var height=MediaQuery.of(context).size.height;
    var width=MediaQuery.of(context).size.width;
    return Scaffold(
      body: GetBuilder<GetxnewLogic>(
        builder: (logic) {
          return logic.weatherobject==null? Center(child: CircularProgressIndicator()):  Stack(
            children: [
              Image.asset(
                'assets/images/ss.png',
                height: double.infinity,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
          SafeArea(
          child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
                  DropdownButton(
                    value: logic.selectedCity,
                    icon:  Icon(
                      Icons.keyboard_arrow_down,
                      color: Colors.white,
                    ),
                    dropdownColor: Colors.black87,
                    style: TextStyle(color: Colors.white, fontSize: 18),
                    underline: Container(),
                    items: logic.cities.map((city) {
                      return DropdownMenuItem(
                        value: city,
                        child: Text(city),

                      );
                    }).toList(),
                    onChanged: (value) {
                      if (value != null) {
                        logic.changecity(value);
                      }
                    },
                  ),
                  Image.network(
                    'https:${logic.weatherobject!.conditionmap!['icon']}',
                  ),
                  Text(
                    "${logic.weatherobject!.temp}℃",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    logic.weatherobject!.conditionmap!['text'],
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.location_on_rounded, color: Colors.white),
                      Text(
                        logic.weatherobject!.city.toString(),
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                      Text(' , ', style: TextStyle(color: Colors.white)),
                      Text(
                        logic.weatherobject!.country.toString(),
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  Container(
                    height: height*0.55,
                    width: width*0.90,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(25),
                      child: Column(
                        spacing: height*0.01,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            children: [
                              Icon(
                                Icons.water_drop,
                                color: Colors.blue,
                                size: 25,
                              ),
                              SizedBox(width: 10),
                              Text(
                                'Humidity',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 17,
                                ),
                              ),
                              Spacer(),
                              Text(
                               '${ logic.weatherobject!.humidity}%',
                                style: TextStyle(
                                  color: Colors.blue,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          Divider(thickness: 1),

                          Row(
                            children: [
                              Icon(
                                Icons.thermostat,
                                color: Colors.red,
                                size: 15,
                              ),
                              SizedBox(width: 10),
                              Text(
                                'Temperature',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 17,
                                ),
                              ),
                              Spacer(),
                              Text(
                                "${logic.weatherobject!.temp}℃",
                                style: TextStyle(
                                  color: Colors.red,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          Divider(thickness: 1),

                          Row(
                            children: [
                              Icon(Icons.cloud, color: Colors.blue, size: 25),
                              SizedBox(width: 10),
                              Text(
                                'Condition',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 17,
                                ),
                              ),
                              Spacer(),
                              Container(
                                width: 60,
                               // color: Colors.red,
                                child: Text(
                                  logic.weatherobject!.conditionmap!['text']
                                      .toString(),
                                  style: TextStyle(
                                    color: Colors.blue,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                  // maxLines: 2,
                                ),
                              ),
                            ],
                          ),
                          Divider(thickness: 1),

                          Row(
                            children: [
                              Icon(
                                Icons.wind_power_outlined,
                                color: Colors.green,
                                size: 25,
                              ),
                              SizedBox(width: 10),
                              Text(
                                'Wind',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 17,
                                ),
                              ),
                              Spacer(),
                              Text(
                                "${logic.weatherobject!.wind} km/h",
                                style: TextStyle(
                                  color: Colors.green,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          Divider(thickness: 1),

                          Row(
                            children: [
                              Icon(
                                Icons.cloud_circle,
                                color: Colors.teal,
                                size: 25,
                              ),
                              SizedBox(width: 10),
                              Text(
                                'Cloud',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 17,
                                ),
                              ),
                              Spacer(),
                              Text(
                                "${logic.weatherobject!.cloud}%",
                                style: TextStyle(
                                  color: Colors.teal,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          Divider(thickness: 1),

                          Row(
                            children: [
                              Icon(
                                Icons.cloudy_snowing,
                                color: Colors.purple,
                                size: 25,
                              ),
                              SizedBox(width: 10),
                              Text(
                                'Chance of Rain',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 17,
                                ),
                              ),
                              Spacer(),
                              Text(
                                '${logic.weatherobject!.rain}%',
                                style: TextStyle(
                                  color: Colors.purple,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),

                        ],
                      ),
                    ),
                  ),
                ],
              ),
          )
            ],

          );
        },
      ),
    );
  }
}

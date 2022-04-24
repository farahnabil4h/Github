import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:ndialog/ndialog.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      home: const MyWeatherPage(),
    );
  }
}

class MyWeatherPage extends StatefulWidget {
  const MyWeatherPage({Key? key}) : super(key: key);

  @override
  State<MyWeatherPage> createState() => _MyWeatherPageState();
}

class _MyWeatherPageState extends State<MyWeatherPage> {
  String selectLoc = "Alor Setar",
      description = "No weather information",
      weather = "";
  double temperature = 0.0,
      feelslike = 0.0; //better use var temp =0.0, weather="";
  int humidity = 0;
  List<String> locList = [
    "Changlun",
    "Jitra",
    "Alor Setar",
    "Baling",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text("Weather APP")),
        body: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Simple Weather APP",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            DropdownButton(
              itemHeight: 60,
              value: selectLoc,
              onChanged: (newValue) {
                //click the drop down, change value
                setState(() {
                  selectLoc = newValue.toString();
                });
              },
              items: locList.map((selectLoc) {
                //populate data
                return DropdownMenuItem(
                  child: Text(
                    selectLoc,
                  ),
                  value: selectLoc,
                );
              }).toList(),
            ),
            ElevatedButton(
                onPressed: _loadWeather, child: const Text("Load Weather")),
            const SizedBox(height: 10),
            Text(
              description,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 32),
            ),
          ],
        )));
  }

  Future<void> _loadWeather() async {
    //async is for no quarantee for the data (basically semua kat internet)
    //when user click
    ProgressDialog progressDialog = ProgressDialog(context,
        message: const Text("Progress"), title: const Text("Searching..."));
    progressDialog.show();
    var apiid = "75f4b386736418374dc1e8a6ef7e182c";
    var url = Uri.parse(
        "https://api.openweathermap.org/data/2.5/weather?q=$selectLoc&appid=$apiid&units-metric"); //uri = class handle url
    var response = await http.get(
        url); //get request method since can nampak full ada http host method gak
    if (response.statusCode == 200) {
      //200 - all good
      var jsonData = response.body;
      var parsedData = json.decode(jsonData);
      temperature = parsedData['main']['temp'];
      humidity = parsedData['main']['humidity'];
      weather = parsedData['weather'][0]['main'];
      feelslike = parsedData['main']['feels_like'];
      setState(() {
        description =
            "The current weather in $selectLoc is $weather. It feels like $feelslike. The current temperature is $temperature Celcius and humidity is $humidity percent.";
      });
      progressDialog.dismiss();
    }
  }
}

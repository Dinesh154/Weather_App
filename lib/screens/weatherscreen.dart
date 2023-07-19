import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'dart:convert';

class Weatherscreen extends StatefulWidget {
  final String cityname;

  const Weatherscreen({Key? key, required this.cityname}) : super(key: key);

  @override
  State<Weatherscreen> createState() => _WeatherscreenState();
}

class _WeatherscreenState extends State<Weatherscreen> {
  var temp;
  var description;
  var currently;
  var humidity;
  var windspeed;

  var city;
  Future getWeather() async {
    http.Response response = await http.get(Uri.parse(
        'https://api.openweathermap.org/data/2.5/weather?q=${widget.cityname.toString()}&units=metric&appid=your api'));
    var results = jsonDecode(response.body);
    setState(() {
      this.temp = results['main']['temp'];
      this.description = results['weather'][0]['description'];
      this.currently = results['weather'][0]['main'];
      this.humidity = results['main']['humidity'];
      this.windspeed = results['wind']['speed'];
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    this.getWeather();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.red,
        title: Text("Weather Report !"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(10),
            height: MediaQuery.of(context).size.height / 3,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20)),
              color: Colors.red,
            ),
            child: Column(children: [
              SizedBox(
                height: 20,
              ),
              Text(
                "currently in " + '${widget.cityname}',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                  color: Colors.white,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                temp != null ? temp.toString() + "\u00B0" : "Loading",
                style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                currently != null ? currently.toString() : "Loading",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                  color: Colors.white,
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(
                    Icons.thermostat,
                    size: 30,
                    color: Colors.white,
                  ),
                  Icon(
                    Icons.thunderstorm,
                    size: 30,
                    color: Colors.white,
                  ),
                  Icon(
                    Icons.wind_power,
                    size: 30,
                    color: Colors.white,
                  ),
                  Icon(
                    Icons.sunny,
                    size: 30,
                    color: Colors.white,
                  ),
                  Icon(
                    Icons.cloud,
                    size: 30,
                    color: Colors.white,
                  ),
                ],
              )
            ]),
          ),
          Expanded(
              child: Padding(
            padding: EdgeInsets.all(20),
            child: ListView(
              children: [
                ListTile(
                  leading: FaIcon(FontAwesomeIcons.thermometer),
                  title: Text("Temperature"),
                  trailing: Text(
                    temp != null ? temp.toString() + "\u00B0" : "Loading",
                  ),
                ),
                ListTile(
                  leading: FaIcon(FontAwesomeIcons.cloud),
                  title: Text("Description"),
                  trailing: Text(
                    description != null ? description.toString() : "Loading",
                  ),
                ),
                ListTile(
                  leading: FaIcon(FontAwesomeIcons.sun),
                  title: Text("Humidity"),
                  trailing: Text(humidity != null
                      ? humidity.toString() + "  g.m^-3"
                      : "Loading"),
                ),
                ListTile(
                  leading: FaIcon(FontAwesomeIcons.wind),
                  title: Text("Wind speed"),
                  trailing: Text(windspeed != null
                      ? windspeed.toString() + " m/s"
                      : "Loading"),
                ),
              ],
            ),
          ))
        ],
      ),
    );
  }
}

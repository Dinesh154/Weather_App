import 'package:flutter/material.dart';
import 'package:weatherapp/screens/weatherscreen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController cityname = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
          child: SafeArea(
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            Container(
              padding: EdgeInsets.all(10),
              height: MediaQuery.of(context).size.height / 3,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(color: Colors.red),
              child: Column(children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.cloud_sharp,
                      size: 50,
                      color: Colors.white,
                    ),
                    Icon(
                      Icons.cloud_sharp,
                      size: 50,
                      color: Colors.white,
                    ),
                    Icon(
                      Icons.cloud_sharp,
                      size: 50,
                      color: Colors.white,
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "Weather App",
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w300,
                    color: Colors.white,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Know weather status of your city",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w300,
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
            SizedBox(
              height: 0,
            ),
            Container(
              height: MediaQuery.of(context).size.height / 4,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(0),
                color: Colors.red,
              ),
              child: Image.asset(
                'assests/RS5Y.gif',
              ),
            ),
            Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(0),
                  color: Colors.red,
                ),
                child: Column(
                  children: [
                    SizedBox(
                      height: 25,
                    ),
                    Text(
                      "Enter your city name",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      padding: EdgeInsets.all(10),
                      height: MediaQuery.of(context).size.height / 8,
                      width: MediaQuery.of(context).size.width / 2,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white,
                      ),
                      child: Center(
                        child: TextField(
                          controller: cityname,
                          decoration: InputDecoration(
                            icon: Icon(
                              Icons.location_city,
                              color: Colors.grey,
                            ),
                            hintText: 'city name',
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      padding: EdgeInsets.all(10),
                      height: MediaQuery.of(context).size.height / 10,
                      width: MediaQuery.of(context).size.width / 3,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white,
                      ),
                      child: Center(
                          child: GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => Weatherscreen(
                                      cityname: cityname.text,
                                    ),
                                  ),
                                );
                              },
                              child: Text(
                                "Submit",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15,
                                  color: Color.fromARGB(255, 22, 21, 21),
                                ),
                              ))),
                    ),
                  ],
                )),
          ],
        ),
      )),
    );
  }
}

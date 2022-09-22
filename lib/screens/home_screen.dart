import 'package:clima/models/weatherModel.dart';
import 'package:clima/utilities/style.dart';
import 'package:flutter/material.dart';

import 'search_location.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key, required this.title, this.weatherData}) : super(key: key);
  final String title;
  final weatherData;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  WeatherModel weatherModel = WeatherModel();
  @override
  void initState() {
    super.initState();
    setState(() {
      updateUI(widget.weatherData);
    });
  }

  updateUI(dynamic weatherData) {
    setState(() {
    if(weatherData==null){
      temperature =0;
      weatherIcon = 'Error';
      weatherMessage = 'Unable to get weather data';
      cityName = '';
      return;
    }
    double temp = weatherData['main']['temp'];
    temperature = temp.toInt();
    weatherMessage = weatherModel.getMessage(temperature);
    int condition = weatherData['weather'][0]['id'];
    weatherIcon = weatherModel.getWeatherIcon(condition);
    cityName = weatherData['name'];
    // double temp = weatherData['list'][0]['main']['temp'];
    // temperature = temp.toInt();
    // weatherMessage = weatherModel.getMessage(temperature);
    // int condition = weatherData['list'][0]['weather'][0]['id'];
    // weatherIcon = weatherModel.getWeatherIcon(condition);
    // cityName = weatherData['list'][0]['name'];
    });
  }

  int temperature = 0;
  String? weatherIcon;
  String? cityName;
  String? weatherMessage;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: Container(
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('images/waterfall.jpg'), fit: BoxFit.cover),
        ),
        constraints: BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                    onPressed: () async{
                      var weatherData = await WeatherModel().getLocationWeather();
                      updateUI(weatherData);
                    },
                    child: Icon(
                      Icons.near_me,
                      color: Colors.white,
                      size: 30.0,
                    ),
                  ),
                  // Text(
                  //   widget.title,
                  //   style: TextStyle(fontSize: 34),
                  // ),
                  TextButton(
                    onPressed: () async{
                      var typeCity = await Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Search()));
                          if(typeCity != null){
                            var data = await weatherModel.getCityWeather(typeCity);
                            updateUI(data);
                          }
                    },
                    child: Icon(
                      Icons.location_city,
                      color: Colors.white,
                      size: 30.0,
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(left: 15.0),
                child: Row(
                  children: [
                    Text(
                      "$temperature°",
                      style: TextStyle(
                        fontSize: 100,
                        color: Colors.white,
                        // fontWeight: FontWeight.bold,
                        fontFamily: 'Spartan MB',
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 8.0),
                      child: Text(
                        weatherIcon.toString(),
                        style: TextStyle(fontSize: 60, color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 15.0),
                child: Text(
                  weatherMessage.toString() +
                      ' in ' +
                      cityName.toString() +
                      ' !',
                  style: kMessageTextStyle,
                  // TextStyle(fontSize: 60, color: Colors.white,fontWeight: FontWeight.bold,fontFamily: 'Spartan MB',),
                  textAlign: TextAlign.right,
                ),
              ),
            ],
          ),
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

import 'dart:async';
import 'package:clima/components/location.dart';
import 'package:clima/models/weatherModel.dart';
import 'package:clima/screens/home_screen.dart';
import 'package:clima/services/Network.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();
    Timer(
      Duration(seconds: 2),
      () {
        getLocation();
      },
    );
  }

  void getLocation() async {
    var weatherData = await WeatherModel().getLocationWeather(); 
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => HomePage(
          // title: 'Clima'
          title: 'Today\'s Weather',
          weatherData: weatherData,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      extendBodyBehindAppBar: true,
      body: Container(
        child: Center(
          child: SpinKitFadingCircle(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}

import 'package:clima/components/location.dart';
import 'package:clima/services/Network.dart';

class WeatherModel {
  String apiKey = '860ccb7dabdb114b876a26b08c5e162f';
  Future<dynamic> getCityWeather(String cityName) async {
    NetworkHelper networkHelper = NetworkHelper(
      "https://api.openweathermap.org/data/2.5/weather?q=$cityName&appid=$apiKey&units=metric",
    );
    var weatherData = await networkHelper.network();
    return weatherData;
  }

  Future<Map<String, dynamic>> getLocationWeather() async {
    Location _location = Location();
    await _location.getCurrentLocation();
    print("${_location.lat} " + "${_location.long}");
    NetworkHelper networkHelper = NetworkHelper(
      "https://api.openweathermap.org/data/2.5/weather?lat=${_location.lat}&lon=${_location.long}&appid=$apiKey&units=metric",
      // "https://api.openweathermap.org/data/2.5/find?lat=${_location.lat}&lon=${_location.long}&cnt=10&appid=$apiKey&units=metric",
    );
    var weatherData = await networkHelper.network();
    return weatherData;
  }

  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '🌩';
    } else if (condition < 400) {
      return '🌧';
    } else if (condition < 600) {
      return '☔';
    } else if (condition < 700) {
      return '⛄';
    } else if (condition < 800) {
      return '🌫';
    } else if (condition == 800) {
      return '☀';
    } else if (condition <= 804) {
      return '☁';
    } else {
      return '🤷‍♀️';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s 🍦 time';
    } else if (temp > 20) {
      return 'Time for shorts and 👕';
    } else if (temp < 10) { 
      return 'You\'ll need 👢 and 🧤';
    } else {
      return 'Bring a 🧥 just in case';
    }
  }
}

// ignore_for_file: lines_longer_than_80_chars

import 'package:clima/screens/location_screen.dart';
import 'package:clima/services/get_location_permission.dart';
import 'package:clima/services/weather.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    super.initState();
    getLocationPermission();
    getLocationData();
  }

  void getLocationData() async {
    var weatherData = await WeatherModel().getLocationWeather();

    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => LocationScreen(
                locationWeather: weatherData,
              )),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SpinKitDoubleBounce(
          size: 100,
          color: Theme.of(context).primaryColor,
        ),
      ),
    );
  }
}

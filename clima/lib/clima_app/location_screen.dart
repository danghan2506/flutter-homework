import 'package:flutter/material.dart';
import 'city_screen.dart';
import 'clima_constants.dart';
import 'package:clima_app/services/weather.dart';

class LocationScreen extends StatefulWidget {
  LocationScreen({required this.locationWeather});

  final locationWeather;

  @override
  _LocationScreenState createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  double temperature = 0.0;
  String weatherIcon = '';
  String cityGreeting = '';

  WeatherModel weatherModel = WeatherModel();

  @override
  void initState() {
    super.initState();
    updateUI(widget.locationWeather);
  }

  void updateUI(dynamic weatherData) {
    setState(() {
      if (weatherData == null) {
        temperature = 0.0;
        weatherIcon = 'Error';
        cityGreeting = 'Unable to get weather data';
        return;
      }

      temperature = weatherData['main']['temp'];
      temperature = temperature.roundToDouble();
      var condition = weatherData['weather'][0]['id'];
      weatherIcon = weatherModel.getWeatherIcon(condition);
      var cityName = weatherData['name'];
      cityGreeting =
          '${weatherModel.getMessage(temperature.toInt())} in $cityName';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/location_background.jpg'),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
              Colors.white.withAlpha((0.8 * 255).toInt()),
              BlendMode.dstATop,
            ),
          ),
        ),
        constraints: BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  TextButton(
                    onPressed: () async {
                      var weatherData = await weatherModel.getLocation();
                      updateUI(weatherData);
                    },
                    child: Icon(Icons.near_me, size: 50.0),
                  ),
                  TextButton(
                    onPressed: () async {
                      var typeNamed = await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return CityScreen();
                          },
                        ),
                      );

                      if (typeNamed != null) {
                        var weatherData =
                            await weatherModel.getCityWeather(typeNamed);
                        updateUI(weatherData);
                      }
                    },
                    child: Icon(Icons.location_city, size: 50.0),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(left: 15.0),
                child: Row(
                  children: <Widget>[
                    Text('$temperature°', style: kTempTextStyle),
                    Text(weatherIcon, style: kConditionTextStyle),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(right: 15.0),
                child: Text(
                  cityGreeting,
                  textAlign: TextAlign.right,
                  style: kMessageTextStyle,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import '../models/weather_model.dart';

class WeatherInformationWidget extends StatelessWidget {
  const WeatherInformationWidget({Key? key, required this.weatherModel})
      : super(key: key);
  final WeatherModel weatherModel;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.8,
      width: MediaQuery.of(context).size.width,
      child: Card(
        shadowColor: Colors.red,
        shape: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.red, width: 1)),
        margin: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '${weatherModel.name}',
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
            Image.network(
              "http://openweathermap.org/img/w/${weatherModel.weather.first.icon}.png",
              height: 100,
              width: 100,
              fit: BoxFit.fill,
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                      alignment: Alignment.center,
                      child: Text(
                        '${weatherModel.main.temp}°C',
                        style: TextStyle(fontSize: 20),
                      )),
                  const SizedBox(
                    height: 10,
                  ),
                  Text('Weather: ${weatherModel.weather.first.description}'),
                  const SizedBox(
                    height: 10,
                  ),
                  Text('Pressure: ${weatherModel.main.pressure}'),
                  const SizedBox(
                    height: 10,
                  ),
                  Text('Humidity: ${weatherModel.main.humidity}'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

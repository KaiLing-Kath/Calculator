import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../widget/weather_information_widget.dart';
import '../state/weather_cubit.dart';
import '../state/weather_state.dart';

class WeatherDetail extends StatelessWidget {
  const WeatherDetail({required this.cityName, Key? key}) : super(key: key);
  final String cityName;

  @override
  Widget build(BuildContext context) {
    WeatherCubit cubit = BlocProvider.of<WeatherCubit>(context)
      ..fetchWeather(cityName);

    return Scaffold(
      appBar: AppBar(
        title: Text("Weather Detail"),
      ),
      body: Center(
          child: BlocBuilder<WeatherCubit, WeatherState>(
        bloc: cubit,
        builder: (context, state) {
          if (state is WeatherLoading) {
            return const CircularProgressIndicator();
          }
          if (state is WeatherLoaded) {
            return WeatherInformationWidget(weatherModel: state.weatherModel);
          }
          return Text(
              state is WeatherError ? state.errorMessage : 'Unknown error');
        },
      )),
    );
  }
}

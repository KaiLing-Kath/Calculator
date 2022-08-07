import 'package:flutter/material.dart';
import 'package:flutter_api/pages/weather_detail.dart';

class homePage extends StatefulWidget {
  const homePage({Key? key}) : super(key: key);

  @override
  State<homePage> createState() => _homePageState();
}

class _homePageState extends State<homePage> {
  //add a controller for textfield
  //Whenever the user modifies a text field with an associated TextEditingController,
  //the text field updates value and the controller notifies its listeners.
  late final TextEditingController _controller;
  bool _isCityNameEmpty = true;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
    //listen to anything changed in the text field.
    _controller.addListener(() {
      //"_controller.text.isEmpty" will return true or false
      setState((() => _isCityNameEmpty = _controller.text.isEmpty));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Search City"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Please enter city name',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: TextField(
                controller: _controller,
                decoration: InputDecoration(
                  label: Text('City name'),
                  floatingLabelBehavior: FloatingLabelBehavior.auto,
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            //null disable button else enable button "(){}"
            ElevatedButton(
              onPressed: _isCityNameEmpty
                  ? null
                  : () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return WeatherDetail(cityName: _controller.text);
                      }));
                    },
              child: const Text('Search'),
            )
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:weather_app/controller/api.dart';
import 'package:weather_app/controller/constants/constants.dart';
import 'package:weather_app/model/weather_response.dart';
import 'package:weather_app/view/widgets/details_location.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _locationName = TextEditingController();

  final _formkey = GlobalKey<FormState>();

  WeatherResponse? _weatherResponse;
  bool isstart = true;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var height = size.height;
    var width = size.width;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.black54,
        title: const Text(
          'Weather ',
          style: TextStyle(
            color: Color.fromARGB(255, 0, 0, 0),
          ),
        ),
      ),
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      body: SafeArea(
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                top: 20,
                left: 25,
                right: 25,
              ),
            ),
            const SizedBox(
              height: 100,
            ),
            TextFormField(
              validator: (value) =>
                  value!.isEmpty ? 'Please Enter a location' : null,
              controller: _locationName,
              decoration: InputDecoration(
                suffixIcon: IconButton(
                  icon: const Icon(
                    Icons.search,
                    color: Colors.black,
                  ),
                  onPressed: () async {
                    _formkey.currentState!.validate();
                    final inputedtext = _locationName.text;
                    var dataresult = await getdetails(
                      location: inputedtext,
                    );
                    _locationName.clear();
                    isstart = false;
                    FocusManager.instance.primaryFocus?.unfocus();
                    setState(
                      () {
                        _weatherResponse = dataresult;
                      },
                    );
                  },
                ),
                fillColor: Colors.grey,
                hintText: 'Search Your Location',
                border: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(
                      30,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              width: width * 0.4,
              height: height * 0.5,
              child: isstart
                  ? Column(
                      children: [
                        const Text('Please Search Your Location'),
                        Image.network(
                          'https://i.pinimg.com/originals/e9/e9/90/e9e99039ad9f8445e9b747f8e0b159ab.gif',
                          fit: BoxFit.cover,
                        ),
                      ],
                    )
                  : Column(
                      children: [
                        Text(
                          _weatherResponse?.name ?? 'Not Found',
                          textAlign: TextAlign.center,
                          style: listHeadText,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          "${_weatherResponse?.tempC.toString() ?? '-'}°c ",
                          style: const TextStyle(
                              fontSize: 40, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          _weatherResponse?.text ?? '',
                        ),
                        const SizedBox(
                          height: 50,
                        ),
                        DetailsLocation(
                          leftheadText: 'Real Feel',
                          leftsubText:
                              "${_weatherResponse?.feelslikeC.toString() ?? '-'}°c",
                          rightheadText: 'Humidity',
                          rightsubText:
                              "${_weatherResponse?.humidity.toString() ?? '-'} % ",
                        ),
                        sizedBox10,
                        DetailsLocation(
                          leftheadText: 'Wind Speed',
                          leftsubText:
                              "${_weatherResponse?.windMph.toString() ?? '-'} mph",
                          rightheadText: 'Pressure',
                          rightsubText:
                              "${_weatherResponse?.pressureMb.toString() ?? '-'} mb",
                        ),
                      ],
                    ),
            ),
          ],
        ),
      ),
    );
  }
}

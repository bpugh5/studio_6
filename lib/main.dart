import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:studio_6_layout_challenge/widgets/styledText.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Map<String, String> forecast = {
    "name": "today",
    "temperature": "35",
    "shortForecast": "Snowy",
    "detailedForecast": "Snowy all day",
    "windSpeed": "10",
    "windDirection": "SE",
    "isDaytime": "true",
    "probabilityOfPercipitation": "100"
  };

  Map<String, String> location = {
    "city": "Bend",
    "state": "Oregon",
    "zip": "97702"
  };

  bool isLightTheme = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedContainer(
        duration: const Duration(milliseconds: 500),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [
              Colors.blue,
              (isLightTheme) ? Colors.yellow : Colors.black,
            ],
          ),
        ),
        child: Column(
          children: [
            const SizedBox(height: 50),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                StyledText(
                  text:
                      "Weather for ${location["city"]}, ${location["state"]}, ${location["zip"]}:",
                  color: (isLightTheme) ? Colors.black : Colors.white,
                ),
              ],
            ),
            Card(
              elevation: 10,
              shadowColor: Colors.black,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      StyledText(
                          text: "${forecast["temperature"]}°F",
                          size: 80,
                          color: Colors.black),
                      const Icon(Icons.cloudy_snowing, size: 80),
                    ],
                  ),
                  StyledText(
                      text: forecast["detailedForecast"]!, color: Colors.black),
                  const SizedBox(height: 10),
                  StyledText(
                      text:
                          "The wind is moving ${forecast["windDirection"]} at ${forecast["windSpeed"]}MPH!",
                      size: 20,
                      color: Colors.black),
                ]),
              ),
            ),
            Container(
              height: 150,
              child: ListView.builder(
                padding: const EdgeInsets.all(8),
                scrollDirection: Axis.horizontal,
                itemCount: 15,
                itemBuilder: (BuildContext context, int index) => SizedBox(
                  width: 100,
                  child: Card(
                    child: Center(
                      child: Text("Forecast $index"),
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Switch(
                    value: false,
                    onChanged: (bool value) {
                      setState(() {
                        isLightTheme = value;
                      });
                    }
                  ),
                  // ElevatedButton(
                  //   onPressed: toggleDarkMode,
                  //   style: const ButtonStyle(
                  //       backgroundColor: MaterialStatePropertyAll(Colors.blue)),
                  //   child: const Text(
                  //     "Toggle Dark Mode",
                  //     style: TextStyle(color: Colors.white),
                  //   ),
                  // ),
                  const SizedBox(height: 50),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

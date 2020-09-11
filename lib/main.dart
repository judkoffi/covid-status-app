import 'package:covid_info_app/models/service_locator.dart';
import 'package:covid_info_app/views/home_page.dart';
import 'package:flutter/material.dart';

void main() {
  getServices();
  runApp(App());
}

class App extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Covid status',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomePage(title: 'Home'),
    );
  }
}

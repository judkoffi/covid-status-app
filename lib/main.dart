import 'package:covid_info_app/common/style.dart';
import 'package:covid_info_app/di/ioc_locator.dart';
import 'package:covid_info_app/views/root_page.dart';
import 'package:flutter/material.dart';

void main() {
  iocLocator();
  runApp(App());
}

class App extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Covid status',
      theme: ThemeData(
        primarySwatch: Colors.teal,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        backgroundColor: Style.bgColor,
      ),
      debugShowCheckedModeBanner: false,
      home: RootPage(
        title: 'Summary',
      ),
    );
  }
}

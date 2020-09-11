import 'package:flutter/material.dart';

class CountriesPage extends StatefulWidget {
  CountriesPage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _CountriesPageState createState() => _CountriesPageState();
}

class _CountriesPageState extends State<CountriesPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(),
    );
  }
}

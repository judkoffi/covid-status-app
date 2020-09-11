import 'package:covid_info_app/views/countries_page.dart';
import 'package:covid_info_app/views/summary_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectedIndex = 0;
  final widgetOptions = [
    SummaryPage(),
    CountriesPage(),
  ];

  final items = [
    BottomNavigationBarItem(
      icon: Icon(Icons.info),
      title: Text('Summary'),
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.flag),
      title: Text('Countries'),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: Text(widget.title)),
        body: Center(
          child: widgetOptions.elementAt(
            selectedIndex,
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: items,
          currentIndex: selectedIndex,
          fixedColor: Colors.deepPurple,
          onTap: onItemTapped,
        ),
      ),
    );
  }

  void onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }
}

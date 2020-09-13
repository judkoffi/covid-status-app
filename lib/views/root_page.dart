import 'package:covid_info_app/common/style.dart';
import 'package:covid_info_app/views/countries.dart';
import 'package:covid_info_app/views/global_summary.dart';
import 'package:flutter/material.dart';
import 'package:fluttericon/linecons_icons.dart';
import 'package:fluttericon/typicons_icons.dart';

class RootPage extends StatefulWidget {
  RootPage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _RootPageState createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> {
  int selectedIndex = 0;
  final widgetOptions = [
    GlobalSummaryView(
      title: 'Global',
    ),
    CountriesView(
      title: 'Countries',
    ),
  ];

  final items = [
    BottomNavigationBarItem(
      icon: Icon(Linecons.globe),
      title: Text('Global'),
    ),
    BottomNavigationBarItem(
      icon: Icon(Typicons.flag),
      title: Text('Countries'),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Style.bgColor,
        appBar: AppBar(title: Text(widget.title)),
        body: Center(
          child: widgetOptions.elementAt(
            selectedIndex,
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: items,
          currentIndex: selectedIndex,
          fixedColor: Colors.teal,
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

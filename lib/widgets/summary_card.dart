import 'package:covid_info_app/models/summary_global.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class SummaryCard extends StatelessWidget {
  final SummaryGlobal response;

/*
 "Global": {
    "NewConfirmed": 13090846,
    "TotalConfirmed": 40949395,
    "NewDeaths": 5823,
    "TotalDeaths": 909458,
    "NewRecovered": 215600,
    "TotalRecovered": 18989930
  },
  */
  SummaryCard(this.response);

  Widget buildTile(String key, int value) {
    return ListTile(
      leading: Icon(
        Icons.new_releases,
        size: 70,
      ),
      title: Text(
        '$key',
        style: TextStyle(color: Colors.white),
      ),
      subtitle: Text(
        '$value',
        style: TextStyle(color: Colors.white),
      ),
      contentPadding: EdgeInsets.all(10),
    );
  }

  @override
  Widget build(BuildContext context) {
    var widgets = response.global
        .toMap()
        .entries
        .map((e) => buildTile(e.key, e.value))
        .toList();
    return Container(
      //width: 200,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        color: Colors.grey,
        elevation: 10,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: widgets,
        ),
      ),
    );
  }
}

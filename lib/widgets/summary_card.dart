import 'package:covid_info_app/models/summary_response.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class SummaryCard extends StatelessWidget {
  final SummaryResponse response;

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
  SummaryCard(this.response) {}


  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Container(
        //width: 200,
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          color: Colors.grey,
          elevation: 10,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              ListTile(
                leading: Icon(
                  Icons.new_releases,
                  size: 70,
                ),
                title: Text(
                  'New Confirmed ',
                  style: TextStyle(color: Colors.white),
                ),
                subtitle: Text(
                  '${response.global.newConfirmed}',
                  style: TextStyle(color: Colors.white),
                ),
                contentPadding: EdgeInsets.all(10),
              ),
            ],
          ),
        ),
      ),
    ]);
  }
}

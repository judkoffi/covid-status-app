import 'package:charts_flutter/flutter.dart' as charts;
import 'package:covid_info_app/common/style.dart';
import 'package:covid_info_app/models/country_base.dart';
import 'package:covid_info_app/models/summary_country.dart';
import 'package:covid_info_app/widgets/icon_tile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SummaryCountryCard extends StatefulWidget {
  final List<SummaryCountry> summaries;
  final CountryBase country;

  SummaryCountryCard(this.summaries, this.country);

  @override
  _SummaryCountryCardState createState() =>
      _SummaryCountryCardState(this.summaries, this.country);
}

class _SummaryCountryCardState extends State<SummaryCountryCard> {
  final List<SummaryCountry> summaries;
  final CountryBase country;
  _SummaryCountryCardState(this.summaries, this.country);

  @override
  Widget build(BuildContext context) {
    var series = [
      charts.Series(
        id: "Active",
        domainFn: (SummaryCountry data, _) => DateTime.parse(data.date),
        measureFn: (SummaryCountry data, _) => data.active,
        data: summaries,
      ),
      charts.Series(
        id: "Deaths",
        domainFn: (SummaryCountry data, _) => DateTime.parse(data.date),
        measureFn: (SummaryCountry data, _) => data.deaths,
        data: summaries,
      ),
      charts.Series(
        id: "Recovered",
        domainFn: (SummaryCountry data, _) => DateTime.parse(data.date),
        measureFn: (SummaryCountry data, _) => data.recovered,
        data: summaries,
      ),
    ];

    var chart = charts.TimeSeriesChart(
      series,
      animate: true,
      domainAxis: charts.DateTimeAxisSpec(
        tickFormatterSpec: charts.AutoDateTimeTickFormatterSpec(
          day: charts.TimeFormatterSpec(
            format: 'dd',
            transitionFormat: 'dd',
          ),
          month: charts.TimeFormatterSpec(
            format: 'MM',
            transitionFormat: 'MM',
          ),
          year: charts.TimeFormatterSpec(
            format: 'yyyy',
            transitionFormat: 'yyyy',
          ),
          minute: charts.TimeFormatterSpec(
            format: 'mm',
            transitionFormat: 'HH:mm',
          ),
        ),
      ),
      behaviors: [charts.SeriesLegend()],
    );

    var chartWidget = Padding(
      padding: EdgeInsets.all(1.0),
      child: SizedBox(
        height: 200.0,
        width: 500.0,
        child: chart,
      ),
    );

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Style.bgColor,
        elevation: 0.0,
        brightness: Brightness.light,
        iconTheme: IconThemeData(color: Colors.black87),
      ),
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              children: <Widget>[
                Image.network(country.pictureUrl, height: 80),
                Container(
                  width: MediaQuery.of(context).size.width - 100,
                  height: 220,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        country.name,
                        style: TextStyle(fontSize: 20),
                      ),
                      Text(
                        country.iso2,
                        style: TextStyle(fontSize: 15, color: Colors.grey),
                      ),
                      SizedBox(height: 20),
                      Row(
                        children: [
                          Column(
                            children: [
                              Row(
                                children: <Widget>[
                                  IconTile(
                                    backColor: Color(0xffFFECDD),
                                    icon: Icons.info,
                                    value: '${summaries.last.active} cases',
                                  ),
                                ],
                              ),
                              SizedBox(height: 10),
                              Row(
                                children: <Widget>[
                                  IconTile(
                                    backColor: Color(0xffFFECDD),
                                    icon: Icons.info,
                                    value: '${summaries.last.deaths} death',
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              Row(
                                children: <Widget>[
                                  IconTile(
                                    backColor: Color(0xffFFECDD),
                                    icon: Icons.info,
                                    value:
                                        '${summaries.last.recovered} recovered',
                                  ),
                                ],
                              ),
                              SizedBox(height: 10),
                              Row(
                                children: <Widget>[
                                  IconTile(
                                    backColor: Color(0xffFFECDD),
                                    icon: Icons.info,
                                    value: '${summaries.last.confirmed} cases',
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 26),
            Text(
              "Charts",
              style: TextStyle(fontSize: 22),
            ),
            SizedBox(height: 16),
            chartWidget,
          ],
        ),
      ),
    );
  }
}

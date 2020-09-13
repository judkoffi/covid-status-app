import 'package:covid_info_app/models/country_base.dart';
import 'package:covid_info_app/models/summary_country.dart';
import 'package:covid_info_app/services/covid_api_service.dart';
import 'package:covid_info_app/widgets/summary_country_card.dart';
import 'package:flutter/material.dart';
import 'package:ioc/ioc.dart';

class CountrySummaryView extends StatefulWidget {
  final CountryBase country;
  CountrySummaryView(this.country);

  @override
  _CountrySummaryViewState createState() => _CountrySummaryViewState(country);
}

class _CountrySummaryViewState extends State<CountrySummaryView> {
  final CountryBase country;
  final CovidAPIService infoService = Ioc().use('CovidAPIService');
  _CountrySummaryViewState(this.country);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: FutureBuilder(
            future: infoService.getSummaryByCountry(
              country.slug,
              DateTime.now().subtract(Duration(days: 30 * 6)).toIso8601String(),
            ),
            builder: builderFunc,
          ),
        ),
      ),
    );
  }

  Widget builderFunc(context, AsyncSnapshot<List<SummaryCountry>> snapshot) {
    Widget card;
    if (snapshot.hasError) {
      card = Padding(
        padding: const EdgeInsets.only(top: 16),
        child: Text('Error: ${snapshot.error}'),
      );
    } else if (snapshot.hasData) {
      card = SummaryCountryCard(snapshot.data, country);
    } else {
      // Spinner
      card = SizedBox(
        child: CircularProgressIndicator(),
        width: 60,
        height: 60,
      );
    }
    return card;
  }
}

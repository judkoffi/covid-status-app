import 'package:covid_info_app/models/country_base.dart';
import 'package:covid_info_app/services/covid_api_service.dart';
import 'package:flutter/material.dart';
import 'package:ioc/ioc.dart';

class CountriesPage extends StatefulWidget {
  CountriesPage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _CountriesPageState createState() => _CountriesPageState();
}

class _CountriesPageState extends State<CountriesPage> {
  final CovidAPIService infoService = Ioc().use('CovidAPIService');

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: FutureBuilder(
            future: infoService.getCountries(),
            builder: builderFunc,
          ),
        ),
      ),
    );
  }

  Widget builderFunc(context, AsyncSnapshot<List<CountryBase>> snapshot) {
    Widget child;
    if (snapshot.hasError) {
      child = Padding(
        padding: const EdgeInsets.only(top: 16),
        child: Text('Error: ${snapshot.error}'),
      );
    } else if (snapshot.hasData) {
      List<CountryBase> countries = snapshot.data;
      child = ListView.builder(
        itemCount: countries.length,
        itemBuilder: (BuildContext ctx, int index) {
          return Card(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                ListTile(
                  leading: FadeInImage(
                    image: NetworkImage(countries[index].pictureUrl),
                    placeholder: AssetImage('question-mark.png'),
                  ),
                  title: Text('${countries[index].name}'),
                  subtitle: Text('${countries[index].iso2}'),
                ),
              ],
            ),
          );
        },
      );
    } else {
      // Spinner
      child = SizedBox(
        child: CircularProgressIndicator(),
        width: 60,
        height: 60,
      );
    }
    return Center(child: child);
  }
}

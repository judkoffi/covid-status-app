import 'package:covid_info_app/models/summary_global.dart';
import 'package:covid_info_app/services/covid_api_service.dart';
import 'package:covid_info_app/widgets/summary_card.dart';
import 'package:flutter/material.dart';
import 'package:ioc/ioc.dart';

//GetIt getIt = GetIt.instance;

class GlobalSummaryView extends StatefulWidget {
  GlobalSummaryView({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _GlobalSummaryViewState createState() => _GlobalSummaryViewState();
}

class _GlobalSummaryViewState extends State<GlobalSummaryView> {
  final CovidAPIService infoService = Ioc().use('CovidAPIService');

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: FutureBuilder(
            future: infoService.getSummary(),
            builder: builderFunc,
          ),
        ),
      ),
    );
  }

  Widget builderFunc(context, AsyncSnapshot<SummaryGlobal> snapshot) {
    Widget card;
    if (snapshot.hasError) {
      card = Padding(
        padding: const EdgeInsets.only(top: 16),
        child: Text('Error: ${snapshot.error}'),
      );
    } else if (snapshot.hasData) {
      card = SummaryCard(snapshot.data);
    } else {
      // Spinner
      card = SizedBox(
        child: CircularProgressIndicator(),
        width: 60,
        height: 60,
      );
    }
    return Center(
      child: card,
    );
  }
}

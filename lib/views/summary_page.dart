import 'package:covid_info_app/services/covid_api_service.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

GetIt getIt = GetIt.instance;

class SummaryPage extends StatefulWidget {
  SummaryPage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _SummaryPageState createState() => _SummaryPageState();
}

class _SummaryPageState extends State<SummaryPage> {
  final CovidAPIService service = new CovidAPIService();
  final infoService = getIt.get<CovidAPIService>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(),
    );
  }
}

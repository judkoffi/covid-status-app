import 'package:flutter/material.dart';

class SummaryPage extends StatefulWidget {
  SummaryPage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _SummaryPageState createState() => _SummaryPageState();
}

class _SummaryPageState extends State<SummaryPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(),
    );
  }
}

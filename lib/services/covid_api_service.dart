import 'dart:convert';

import 'package:covid_info_app/models/country_base.dart';
import 'package:covid_info_app/models/summary_country.dart';
import 'package:covid_info_app/models/summary_global.dart';
import 'package:http/http.dart' as http;

class CovidAPIService {
  static const BASE_URL = 'https://api.covid19api.com';
  static const HEADERS = {'Content-Type': 'application/json'};

  Future<List<CountryBase>> getCountries() async {
    var url = '$BASE_URL/countries';
    try {
      var response = await http.get(url, headers: HEADERS);
      Iterable<dynamic> list = json.decode(utf8.decode(response.bodyBytes));
      return list.map((elt) => CountryBase.fromJson(elt)).toList();
    } catch (e) {
      return new List<CountryBase>();
    }
  }

  Future<SummaryGlobal> getSummary() async {
    var url = '$BASE_URL/summary';
    try {
      var response = await http.get(url, headers: HEADERS);
      var str = json.decode(utf8.decode(response.bodyBytes));
      return SummaryGlobal.fromJson(str);
    } catch (e) {
      print(e);
      return null;
    }
  }

  Future<List<SummaryCountry>> getSummaryByCountry(
    String countryCode,
    String fromDate,
  ) async {
    var today = DateTime.now();
    var to = today.toIso8601String();
    var from = fromDate ?? today.subtract(Duration(days: 1));
    var url = '$BASE_URL/country/$countryCode?from=$from&to=$to';
    try {
      var response = await http.get(url, headers: HEADERS);
      Iterable<dynamic> list = json.decode(utf8.decode(response.bodyBytes));
      return list.map((elt) => SummaryCountry.fromJson(elt)).toList();
    } catch (e) {
      print(e);
      return null;
    }
  }
}

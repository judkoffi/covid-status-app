import 'dart:convert';

import 'package:covid_info_app/models/country_base.dart';
import 'package:covid_info_app/models/summary_response.dart';
import 'package:http/http.dart' as http;

class CovidAPIService {
  static const API_BASE_URL = 'https://api.covid19api.com';
  static const HEADERS = {'Content-Type': 'application/json'};

  Future<List<CountryBase>> getCountries() async {
    const url = API_BASE_URL + '/countries';
    try {
      var response = await http.get(url, headers: HEADERS);
      Iterable<dynamic> list = json.decode(utf8.decode(response.bodyBytes));
      return list.map((elt) => CountryBase.fromJson(elt)).toList();
    } catch (e) {
      return new List<CountryBase>();
    }
  }

  Future<SummaryResponse> getSummary() async {
    const url = API_BASE_URL + '/summary';
    try {
      var response = await http.get(url, headers: HEADERS);
      var str = json.decode(utf8.decode(response.bodyBytes));
      return SummaryResponse.fromJson(str);
    } catch (e) {
      return null;
    }
  }
}

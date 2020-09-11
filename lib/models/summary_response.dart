/*
 "Message": "",
  "Global": {
    "NewConfirmed": 13090846,
    "TotalConfirmed": 40949395,
    "NewDeaths": 5823,
    "TotalDeaths": 909458,
    "NewRecovered": 215600,
    "TotalRecovered": 18989930
  },
  "Countries": [
    {
      "Country": "Afghanistan",
      "CountryCode": "AF",
      "Slug": "afghanistan",
      "NewConfirmed": 28,
      "TotalConfirmed": 38572,
      "NewDeaths": 0,
      "TotalDeaths": 1420,
      "NewRecovered": 81,
      "TotalRecovered": 31129,
      "Date": "2020-09-11T21:40:33Z",
      "Premium": {}
    }
  ]
  */

import 'package:covid_info_app/models/country.dart';
import 'package:covid_info_app/models/country_base.dart';
import 'package:covid_info_app/models/global.dart';

class SummaryResponse {
  String message;
  Global global;
  List<Country> countries;

  SummaryResponse(this.message, this.global, this.countries) {}

  factory SummaryResponse.fromJson(Map<String, dynamic> json) {
    Iterable<dynamic> rawCountries = json["Countries"];
    var countries = rawCountries //
        .map((elt) => CountryBase.fromJson(elt))
        .toList();

    return SummaryResponse(
      json["Message"],
      Global.fromJson(json["Global"]),
      countries,
    );
  }
}

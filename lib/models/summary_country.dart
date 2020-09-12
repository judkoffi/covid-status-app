/*
[
  {
    "Country": "South Africa",
    "CountryCode": "ZA",
    "Province": "",
    "City": "",
    "CityCode": "",
    "Lat": "-30.56",
    "Lon": "22.94",
    "Confirmed": 646398,
    "Deaths": 15378,
    "Recovered": 574587,
    "Active": 56433,
    "Date": "2020-09-11T00:00:00Z"
  }
]
  */

class SummaryCountry {
  String country;
  String countryCode;
  String province;
  String city;
  String cityCode;
  double latitude;
  double longitude;
  int confirmed;
  int deaths;
  int recovered;
  int active;
  String date;

  SummaryCountry(
    this.country,
    this.countryCode,
    this.province,
    this.city,
    this.cityCode,
    this.latitude,
    this.longitude,
    this.confirmed,
    this.deaths,
    this.recovered,
    this.active,
    this.date,
  );

  factory SummaryCountry.fromJson(Map<String, dynamic> json) {
    return SummaryCountry(
      json["Country"],
      json["CountryCode"],
      json["Province"],
      json["City"],
      json["CityCode"],
      json["Lat"],
      json["Lon"],
      json["Confirmed"],
      json["Deaths"],
      json["Recovered"],
      json["Active"],
      json["Date"],
    );
  }
}

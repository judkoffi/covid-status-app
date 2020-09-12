/*
  {
    "Country": "Barbados",
    "Slug": "barbados",
    "ISO2": "BB"
  }*/

class CountryBase {
  String name;
  String slug;
  String iso2;
  String pictureUrl;

  CountryBase(this.name, this.slug, this.iso2) {
    this.pictureUrl =
        'https://www.countryflags.io/${this.iso2.toString().toLowerCase()}/shiny/64.png';
  }

  factory CountryBase.fromJson(Map<String, dynamic> json) {
    return CountryBase(
      json['Country'],
      json['Slug'],
      json.containsKey('CountryCode') ? json['CountryCode'] : json['ISO2'],
    );
  }
}

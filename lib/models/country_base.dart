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

  CountryBase(this.name, this.slug, this.iso2) {}

  factory CountryBase.fromJson(Map<String, dynamic> json) {
    return CountryBase(
      json['Country'],
      json['Slug'],
      json['ISO2'],
    );
  }
}

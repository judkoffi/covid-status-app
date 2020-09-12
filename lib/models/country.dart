import 'package:covid_info_app/models/country_base.dart';
import 'package:covid_info_app/models/global.dart';

class Country extends CountryBase {
  Global global;

  Country(
    String name,
    String slug,
    String countryCode,
    this.global,
  ) : super(name, slug, countryCode);

  factory Country.fromJson(Map<String, dynamic> json) {
    var baseCountry = CountryBase.fromJson(json);
    return Country(
      baseCountry.name,
      baseCountry.slug,
      baseCountry.iso2,
      Global.fromJson(json),
    );
  }
}

import 'package:covid_info_app/services/covid_api_service.dart';
import 'package:ioc/ioc.dart';

void iocLocator() {
  Ioc().bind('CovidAPIService', (ioc) => CovidAPIService());
}

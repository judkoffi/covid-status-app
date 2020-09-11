import 'package:covid_info_app/services/covid_api_service.dart';
import 'package:get_it/get_it.dart';

GetIt getIt = GetIt.instance;

void getServices() {
  getIt.registerSingleton(() => CovidAPIService());
}

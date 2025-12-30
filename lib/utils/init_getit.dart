import 'package:flutter_mvvm_statemanagement_practice/services/navigation_service.dart';
import 'package:get_it/get_it.dart';

GetIt getIt = GetIt.instance;

void setupNavigator() {
  getIt.registerLazySingleton<NavigationService>(() => NavigationService());
}

import 'package:assessment/app_navigations/navigation_helper.dart';
import 'package:assessment/services/api_service/api_service.dart';
import 'package:mobx/mobx.dart';

import '../../models/event_model/event_model.dart';
import '../../services/local_storage_service/local_storage_service.dart';
import '../widgets/popup.dart';

part 'splash_screen_model.g.dart';

class SplashScreenModel extends _SplashScreenModel
    with _$SplashScreenModel , NavigationMixin,PopupMixin{}

abstract class _SplashScreenModel with Store {
  LocalStorageService localStorageService = LocalStorageService();
  ApiService apiService = ApiService();

  @observable
  List<Event> events = [];




  @action
  void setListOfEvents(List<Event> events) {
    this.events = events;
  }
}

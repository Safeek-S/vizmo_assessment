import 'package:assessment/app_navigations/navigation_helper.dart';
import 'package:assessment/services/api_service/api_service.dart';
import 'package:mobx/mobx.dart';

import '../../models/event_model/event_model.dart';
import '../../services/local_storage_service/local_storage_service.dart';

part 'events_screen_model.g.dart';

class EventsScreenModel extends _EventsScreenModel
    with _$EventsScreenModel, NavigationMixin {}

abstract class _EventsScreenModel with Store {
  LocalStorageService localStorageService = LocalStorageService();
  ApiService apiService = ApiService();

  @observable
  List<Event> events = [];

  @observable
  List<Event> chosenEvents = [];

  @observable
  DateTime selectedDate = DateTime.now();

  @action
  void setSelectedDate(DateTime selectedDate){
    this.selectedDate = selectedDate;
  }

  @action
  void setListOfEvents(List<Event> events) {
    this.events = events;
  }
   @action
  void setChosenEvents(List<Event> events) {
    chosenEvents = events;
  }
}

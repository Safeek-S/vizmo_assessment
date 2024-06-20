import 'package:assessment/screens/events_screen/events_screen_model.dart';

import '../../app_navigations/app_routes.dart';
import '../../app_navigations/navigation_helper.dart';
import '../../models/event_model/event_model.dart';

class EventsScreenViewModel extends EventsScreenModel {
  void fetchEventsFromPreviousScreen(List<Event> events) {
    try {
      setListOfEvents(events);
    } catch (e) {
      print(e.toString());
    }
  }

  void getEventsForDate(DateTime selectedDate) {
    chosenEvents = [];

    // Filter events for the selected date
    chosenEvents.addAll(events.where((event) =>
        event.startAt!.year == selectedDate.year &&
        event.startAt!.month == selectedDate.month &&
        event.startAt!.day == selectedDate.day));
    setChosenEvents(chosenEvents);
    
  }

  void navigateToEventInfoScreen(Event event) {
    try {
      navigationSink.add(Navigation(
          navigationType: NavigationType.push,
          appRoute: AppRoute.eventInfoScreen,
          data: event));
    } catch (e) {
      print(e.toString());
    }
  }
}

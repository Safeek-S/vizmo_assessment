import 'package:assessment/screens/splash_screen/splash_screen_model.dart';
import 'package:assessment/utils/service_result.dart';
import 'package:assessment/utils/utils.dart';

import '../../constants/app_constants.dart';
import '../../app_navigations/app_routes.dart';
import '../../app_navigations/navigation_helper.dart';
import '../../models/event_model/event_model.dart';
import '../widgets/popup.dart';

class SplashScreenViewModel extends SplashScreenModel {
  Future<void> fetchEvents() async {
    try {
     
      await _fetchEventsFromLocal();
    } catch (e) {
      print(e.toString());
    }
  }

  Future<void> fetchEventsFromInternet() async {
    try {
      if (await NetworkConnectivity.isConnected()) {
        var resultFromApiService = await apiService.fetchEventsFromServer();
        if (resultFromApiService.statusCode == StatusCode.success) {
          _addEventsToLocal(resultFromApiService.data!);
        } else {
          _showNoInternetPopup(fetchEventsFromInternet);
        }
      }
    } catch (e) {
      print(e.toString());
    }
  }

  Future<void> _fetchEventsFromLocal() async {
    try {
      var resultsFromLocal = await localStorageService.fetchEvents();
      if (resultsFromLocal.statusCode == StatusCode.success) {
        setListOfEvents(resultsFromLocal.data);
       
        _navigateToEventsScreen();
      } else if (resultsFromLocal.statusCode == StatusCode.failure ||
          resultsFromLocal.statusCode == StatusCode.error) {
        await fetchEventsFromInternet();
      }
    } catch (e) {
      print(e.toString());
    }
  }

  Future<void> _addEventsToLocal(List<Event> events) async {
    try {
      var resultsOfAddingEventsToLocal =
          await localStorageService.insertEvent(events);
      if (resultsOfAddingEventsToLocal.statusCode == StatusCode.success) {
        await _fetchEventsFromLocal();
      }
    } catch (e) {
      print(e.toString());
    }
  }

  void _navigateToEventsScreen() {
    try {
      navigationSink.add(Navigation(
          navigationType: NavigationType.push,
          appRoute: AppRoute.eventsScreen,
          data: events));
    } catch (e) {
      print(e.toString());
    }
  }

  void _showNoInternetPopup(Function callback) {
    try {
      popupSink.add(
        PopupEvent(
            imagePath: AppConstants.noInternetImagePath,
            message: AppConstants.noInternetMessage,
            title: AppConstants.noInternetTitle,
            buttonText: 'Retry',
            callback: callback),
      );
    } catch (e) {
      print(e.toString());
    }
  }
}

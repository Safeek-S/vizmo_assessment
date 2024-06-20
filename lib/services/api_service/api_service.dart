import 'package:assessment/constants/app_constants.dart';
import 'package:assessment/utils/service_result.dart';
import 'package:dio/dio.dart';

import '../../models/event_model/event_model.dart';

class ApiService {
  final Dio _dio = Dio();
  Future<ServiceResult<List<Event>?>> fetchEventsFromServer() async {
    try {
      var headers = {'Authorization': AppConstants.token};
      final response = await _dio.get(
          AppConstants.baseUrl + AppConstants.eventEndPoint,
          options: Options(headers: headers));

      final listOfEvents = response.data['data'] as List<dynamic>;

      List<Event> events = listOfEvents.map((event) {
        return Event.fromJson(event);
      }).toList();

      return response.statusCode == 200
          ? ServiceResult(
              StatusCode.success, "successfully fetched data", events)
          : ServiceResult(StatusCode.error, response.statusMessage ?? "", null);
    } catch (error) {
      return ServiceResult(StatusCode.failure, error.toString(), null);
    }
  }
}

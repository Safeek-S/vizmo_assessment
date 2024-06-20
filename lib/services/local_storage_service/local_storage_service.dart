import 'package:assessment/utils/service_result.dart';
import 'package:sqflite/sqflite.dart';
import '../../models/event_model/event_model.dart';
import '../../repository/events_repository.dart';

class LocalStorageService {
  final DatabaseHelper _dbHelper = DatabaseHelper();

  Future<ServiceResult<int>> insertEvent(List<Event> events) async {
    try {
      final db = await _dbHelper.database;
      await db.transaction((txn) async {
        for (var event in events) {
          await txn.insert(
            'events',
            event.toJson(),
            conflictAlgorithm: ConflictAlgorithm.replace,
          );
        }
      });
      
      return ServiceResult(StatusCode.success, 'inserted events successfully', 1);
    } catch (e) {
      return ServiceResult(StatusCode.error, e.toString(), -99);
    }
  }

  Future<ServiceResult<List<Event>>> fetchEvents() async {
    try {
      final db = await _dbHelper.database;
      final List<Map<String, dynamic>> listOfEvents = await db.query('events');
      if (listOfEvents.isNotEmpty) {
        var events =
            listOfEvents.map((retailer) => Event.fromJson(retailer)).toList();
        return ServiceResult(StatusCode.success, "Events fetched", events);
      } else {
        return ServiceResult(StatusCode.failure, 'No Events Available', []);
      }
    } catch (e) {
      return ServiceResult(StatusCode.error, e.toString(), []);
    }
  }

  Future<ServiceResult<int>> deleteEvent(String id) async {
    try {
      final db = await _dbHelper.database;
      var res = await db.delete(
        'events',
        where: 'id = ?',
        whereArgs: [id],
      );
      return ServiceResult(StatusCode.success, 'deleted successfully', res);
    } catch (e) {
      return ServiceResult(StatusCode.error, e.toString(), -99);
    }
  }

  Future<ServiceResult<int>> updateEvent(Event event) async {
    try {
      final db = await _dbHelper.database;
      var res = await db.update(
        'events',
        event.toJson(),
        where: 'id = ?',
        whereArgs: [event.id],
      );
      return ServiceResult(StatusCode.success, 'updated successfully', res);
    } catch (e) {
      return ServiceResult(StatusCode.error, e.toString(), -99);
    }
  }
}

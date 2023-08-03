import 'package:passionshower/domain/model/alarms/alarms.dart';

abstract class AlarmsRepository {
  List<Alarms> get alarms;

  Future<void> loadAlarms();
  Future<void> saveAlarms();
}

import 'package:passionshower/data/data_source/alarm_data_source.dart';
import 'package:passionshower/domain/model/alarms/alarms.dart';
import 'package:passionshower/domain/repository/alarm_repository.dart';

class AlarmsRepositoryImpl implements AlarmsRepository {
  final AlarmDataSource _dataSource;

  @override
  List<Alarms> get alarms => _dataSource.alarms;

  AlarmsRepositoryImpl(this._dataSource);

  @override
  Future<void> loadAlarms() async {
    await _dataSource.loadAlarms();
  }

  @override
  Future<void> saveAlarms() async {
    await _dataSource.saveAlarms();
  }

  @override
  Future<void> deleteAlarm(int alarms) async {
    await _dataSource.deleteAlarm(alarms);
  }
}

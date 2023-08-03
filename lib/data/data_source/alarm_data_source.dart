import 'dart:convert';
import 'package:passionshower/domain/model/alarms/alarms.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AlarmDataSource {
  List<Alarms> _alarms = [];

  List<Alarms> get alarms => _alarms;

  Future<void> saveAlarms() async {
    final prefs = await SharedPreferences.getInstance();
    final alarmsJson = _alarms.map((alarm) => alarm.toJson()).toList();
    prefs.setString('alarms', jsonEncode(alarmsJson));
  }

  Future<void> loadAlarms() async {
    final prefs = await SharedPreferences.getInstance();
    final alarmsJson = prefs.getString('alarms');
    if (alarmsJson != null) {
      final alarmsList = jsonDecode(alarmsJson) as List<dynamic>;
      _alarms = alarmsList.map((json) => Alarms.fromJson(json)).toList();
    } else {
      _alarms = [];
    }
  }

  Future<void> deleteAlarm(int alarmId) async {
    _alarms.removeWhere((alarm) => alarm.id == alarmId);
    await saveAlarms();
  }
}

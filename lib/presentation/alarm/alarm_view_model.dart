import 'package:flutter/material.dart';
import 'package:day_night_time_picker/day_night_time_picker.dart';

class Alarm2ViewModel extends ChangeNotifier {
  Time _time = Time(hour: 11, minute: 30, second: 20);
  bool _iosStyle = true;

  Time get selectedTime => _time;
  bool get isIosStyle => _iosStyle;

  void onTimeChanged(Time newTime) {
    _time = newTime;
    notifyListeners();
  }

  void toggleIosStyle(bool newValue) {
    _iosStyle = newValue;
    notifyListeners();
  }
}

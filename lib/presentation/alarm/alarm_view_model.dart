import 'dart:convert';
import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';
import 'package:passionshower/core/notifications.dart';
import 'package:passionshower/core/utility.dart';
import 'package:passionshower/domain/model/quotes/quotes.dart';
import 'package:passionshower/domain/model/alarms/alarms.dart';
import 'package:passionshower/domain/repository/alarm_repository.dart';
import 'package:passionshower/domain/repository/quotes_repositoy.dart';

class AlarmViewModel extends ChangeNotifier {
  final QuotesRepository _quotesRepository;
  final AlarmsRepository _alarmsRepository;

  AlarmViewModel(this._quotesRepository, this._alarmsRepository);

  List<Quotes> _quotes = [];
  List<Quotes> get quotes => _quotes;

  List<Alarms> get alarms => _alarmsRepository.alarms;

  Future<void> fetch() async {
    final quotes = await _quotesRepository.fetch();
    _quotes = quotes;
    notifyListeners();
  }

  Future<Quotes?> getRandomQuote() async {
    if (_quotes.isEmpty) {
      await fetch();
    }
    _quotes.shuffle();
    return _quotes.isNotEmpty ? _quotes.first : null;
  }

  Future<void> onAddAlarmButtonPressed(BuildContext context, int? id) async {
    int alarmId = createUniqueId();
    NotificationWeekAndTime? pickedSchedule = await pickSchedule(context, id);

    if (pickedSchedule != null) {
      Quotes? randomQuote = await getRandomQuote();

      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text(
          '알람이 생성되었습니다.',
        ),
      ));
      if (randomQuote != null) {
        print('alarmId : $alarmId');
        createQuotesReminderNotification(
          notificationSchedule: pickedSchedule.copyWith(id: alarmId),
          title: randomQuote.message,
          body: randomQuote.author,
          id: alarmId,
        );
      }
      _alarmsRepository.alarms
          .add(pickedSchedule.copyWith(id: alarmId) as Alarms);
      print('alarmId : $alarmId');
      notifyListeners();
    }
  }

  void onCancelAlarmButtonPressed() {
    cancelScheduledNotifications();
  }

  Future<void> cancel(int id) {
    return AwesomeNotifications().cancel(id);
  }

  void onToggleAlarmStatus(int index, bool newValue) async {
    Quotes? randomQuote = await getRandomQuote();

    if (index >= 0 && index < alarms.length) {
      _alarmsRepository.alarms[index] =
          alarms[index].copyWith(isActive: newValue);
      notifyListeners();

      // Implement your logic to handle the activation status of the alarm here
      if (newValue) {
        // If the alarm is toggled ON, create a notification
        createQuotesReminderNotification(
          notificationSchedule: alarms[index] as NotificationWeekAndTime,
          title: randomQuote?.message ?? 'Your notification title',
          body: randomQuote?.author ?? 'Your notification body',
          id: alarms[index].id,
        );
      } else {
        // If the alarm is toggled OFF, cancel the notification
        int alarmId = alarms[index].id;
        print('alarmId2 : $alarmId');
        await AwesomeNotifications().cancel(alarmId);
      }
    }
  }

  String getDayOfWeekString(int dayOfWeek) {
    switch (dayOfWeek) {
      case DateTime.sunday:
        return '일';
      case DateTime.monday:
        return '월';
      case DateTime.tuesday:
        return '화';
      case DateTime.wednesday:
        return '수';
      case DateTime.thursday:
        return '목';
      case DateTime.friday:
        return '금';
      case DateTime.saturday:
        return '토';
      default:
        return '';
    }
  }
}

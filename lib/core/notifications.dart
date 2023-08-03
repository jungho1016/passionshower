import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:passionshower/domain/model/alarms/alarms.dart';

import 'utility.dart';

Future<void> createQuotesNotification() async {
  await AwesomeNotifications().createNotification(
    content: NotificationContent(
      id: createUniqueId(),
      channelKey: 'basic_channel',
      title: '지식보다 중요한 것은 상상력이다.',
      body: '알버트 아인슈타인',
      bigPicture: 'asset://assets/einstein.jpg',
      notificationLayout: NotificationLayout.BigPicture,
      locked: false,
    ),
  );
}

// Future<void> createQuotesReminderNotification(
//     NotificationWeekAndTime notificationSchedule) async {
//   await AwesomeNotifications().createNotification(
//       content: NotificationContent(
//         id: createUniqueId(),
//         channelKey: 'schedule_channel',
//         title: '지식보다 중요한 것은 상상력이다.',
//         body: '알버트 아인슈타인',
//         notificationLayout: NotificationLayout.Default,
//       ),
//       actionButtons: [
//         NotificationActionButton(key: 'Mark_Done', label: 'Mark_Done'),
//       ],
//       schedule: NotificationCalendar(
//         weekday: notificationSchedule.dayOfTheWeek,
//         hour: notificationSchedule.timeOfDay.hour,
//         minute: notificationSchedule.timeOfDay.minute,
//         second: 0,
//         millisecond: 0,
//         repeats: true,
//       ));
// }

Future<void> createQuotesReminderNotification(
    {required Alarms notificationSchedule,
    required String title,
    required String body,
    required int id}) async {
  await AwesomeNotifications().createNotification(
    content: NotificationContent(
        // id: createUniqueId(),
        id: id,
        channelKey: 'scheduled_channel',
        title: title,
        body: body,
        notificationLayout: NotificationLayout.Default,
        locked: false),
    actionButtons: [
      NotificationActionButton(
        key: 'open',
        label: '열기',
      ),
    ],
    //   NotificationActionButton(
    //     key: 'delete',
    //     label: '닫기',
    //   ),
    // ],
    schedule: NotificationCalendar(
      weekday: notificationSchedule.dayOfTheWeek,
      hour: notificationSchedule.timeOfDay.hour,
      minute: notificationSchedule.timeOfDay.minute,
      second: 0,
      millisecond: 0,
      repeats: true,
    ),
  );
}

Future<void> cancelScheduledNotifications() async {
  await AwesomeNotifications().cancelAllSchedules();
}

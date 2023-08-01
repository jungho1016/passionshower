import 'package:awesome_notifications/awesome_notifications.dart';

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
      locked: true,
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
    NotificationWeekAndTime notificationSchedule) async {
  await AwesomeNotifications().createNotification(
      content: NotificationContent(
        id: createUniqueId(),
        channelKey: 'schedule_channel',
        title: '지식보다 중요한 것은 상상력이다.',
        body: '알버트 아인슈타인',
        notificationLayout: NotificationLayout.Default,
      ),
      actionButtons: [
        NotificationActionButton(key: 'Mark_Done', label: 'Mark_Done'),
      ],
      schedule: NotificationCalendar(
        weekday: notificationSchedule.dayOfTheWeek,
        hour: notificationSchedule.timeOfDay.hour,
        minute: notificationSchedule.timeOfDay.minute,
        second: 0,
        millisecond: 0,
        repeats: true,
      ));
}

Future<void> cancelScheduledNotifications() async {
  await AwesomeNotifications().cancelAllSchedules();
}

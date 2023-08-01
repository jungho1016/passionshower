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
      channelKey: 'scheduled_channel',
      title: '늙어서 놀기를 멈추는 것이 아니라 노는 것을 멈춰서 늙는것이다.',
      body: '버나드 쇼 명언 모음',
      bigPicture: 'asset://assets/thumb6.jpg',
      notificationLayout: NotificationLayout.BigPicture,
    ),
    // actionButtons: [
    //   NotificationActionButton(
    //     key: 'MARK_DONE',
    //     label: 'Mark Done',
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

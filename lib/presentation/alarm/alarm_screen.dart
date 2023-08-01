import 'package:flutter/material.dart';
import 'package:passionshower/core/notifications.dart';
import 'package:passionshower/core/utility.dart';
import 'package:passionshower/presentation/alarm/alarm_view_model.dart';

class AlarmScreen extends StatelessWidget {
  AlarmScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () async {
              NotificationWeekAndTime? pickedSchedule =
                  await pickSchedule(context);

              if (pickedSchedule != null) {
                createQuotesReminderNotification(pickedSchedule);
              }
            },
            backgroundColor: Colors.black,
            child: const Icon(
              Icons.add_alarm,
            ),
          ),
          const SizedBox(width: 8),
          const FloatingActionButton(
            onPressed: cancelScheduledNotifications,
            backgroundColor: Colors.black,
            child: Icon(
              Icons.cancel,
            ),
          ),
        ],
      ),
      body: Center(
        child: Column(
          children: [
            const ElevatedButton(
              onPressed: createQuotesNotification,
              child: Text('알람'),
            ),
          ],
        ),
      ),
    );
  }
}

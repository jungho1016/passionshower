import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:passionshower/presentation/alarm/alarm_view_model.dart';
import 'package:provider/provider.dart';

class AlarmScreen extends StatelessWidget {
  const AlarmScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<AlarmViewModel>();
    return Scaffold(
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () async {
              viewModel.onAddAlarmButtonPressed(context, null);
            },
            backgroundColor: Colors.black,
            child: const Icon(Icons.add_alarm),
          ),
          const SizedBox(width: 8),
          FloatingActionButton(
            onPressed: viewModel.onCancelAlarmButtonPressed,
            backgroundColor: Colors.black,
            child: const Icon(Icons.cancel),
          ),
        ],
      ),
      body: (viewModel.alarms.isEmpty)
          ? Center(
              child: Text(
                '알람을 추가해주세요',
                style: GoogleFonts.nanumPenScript(
                  textStyle: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 36,
                  ),
                ),
              ),
            )
          : ListView.builder(
              itemCount: viewModel.alarms.length,
              itemBuilder: (context, index) {
                final alarm = viewModel.alarms[index];
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4.0),
                  child: Dismissible(
                    key: UniqueKey(),
                    background: Container(
                      color: Colors
                          .red, // Set the background color when swiping to delete
                      alignment: Alignment.centerRight,
                      padding: const EdgeInsets.only(right: 16),
                      child: const Icon(
                        Icons.delete,
                        color: Colors.white,
                      ),
                    ),
                    direction: DismissDirection.endToStart,
                    onDismissed: (_) {
                      int alarmId = alarm.id!;
                      AwesomeNotifications().cancel(alarmId);
                      viewModel.deleteAlarm(alarmId);
                    },
                    child: Card(
                      elevation: 2.0,
                      child: ListTile(
                        title: Text(
                          alarm.timeOfDay.format(context),
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 24),
                        ),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(
                              height: 8,
                            ),
                            Text(
                              '${viewModel.getDayOfWeekString(alarm.dayOfTheWeek)}요일',
                              style: const TextStyle(color: Colors.blueAccent),
                            ),
                          ],
                        ),
                        trailing: Switch(
                          activeColor: Colors.black,
                          value: alarm.isActive!,
                          onChanged: (newValue) {
                            viewModel.onToggleAlarmStatus(index, newValue);
                          },
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:passionshower/core/notifications.dart';
import 'package:passionshower/presentation/alarm/alarm_view_model.dart';
import 'package:provider/provider.dart';
import 'package:day_night_time_picker/day_night_time_picker.dart';

class Alarm2Screen extends StatelessWidget {
  const Alarm2Screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<Alarm2ViewModel>();

    return Scaffold(
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () async {
              // createQuotesReminderNotification(viewModel.selectedTime);
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
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                ListTile(
                  title: Text(
                    "${viewModel.selectedTime.hour}:${viewModel.selectedTime.minute}:${viewModel.selectedTime.second} ${viewModel.selectedTime.period.name}"
                        .toUpperCase(),
                    textAlign: TextAlign.start,
                  ),
                ),
                const SizedBox(height: 10),
                TextButton(
                  style: TextButton.styleFrom(
                    backgroundColor: Theme.of(context).colorScheme.secondary,
                  ),
                  onPressed: () {
                    Navigator.of(context).push(
                      showPicker(
                        showSecondSelector: true,
                        context: context,
                        value: viewModel.selectedTime,
                        onChange: viewModel.onTimeChanged,
                        minuteInterval: TimePickerInterval.FIVE,
                        // Optional onChange to receive value as DateTime
                        onChangeDateTime: (DateTime dateTime) {
                          // print(dateTime);
                          debugPrint("[debug datetime]:  $dateTime");
                        },
                      ),
                    );
                  },
                  child: const Text(
                    "Open time picker",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                const SizedBox(height: 10),
                const Divider(),
                const SizedBox(height: 10),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

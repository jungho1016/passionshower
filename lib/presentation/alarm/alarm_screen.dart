import 'package:flutter/material.dart';
import 'package:passionshower/presentation/alarm/alarm_view_model.dart';

class AlarmScreen extends StatelessWidget {
  AlarmScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () async {
            await createPlantFoodNotification();
          },
          child: const Text('알람'),
        ),
      ),
    );
  }
}

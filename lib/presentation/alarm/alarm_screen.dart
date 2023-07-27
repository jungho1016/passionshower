import 'package:flutter/material.dart';

class AlarmScreen extends StatelessWidget {
  const AlarmScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text(
          'Alarms will be displayed here',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}

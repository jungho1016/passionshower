// 알람 ID를 생성하는 유틸리티 함수입니다.
import 'package:flutter/material.dart';
import 'package:passionshower/domain/model/alarms/alarms.dart';

int _uniqueId = 0;

int createUniqueId() {
  _uniqueId++;
  return _uniqueId % 100000;
}

Future<Alarms?> pickSchedule(
  BuildContext context,
  int? id, // 추가된 nullable id 매개변수
) async {
  List<String> weekdays = [
    '월',
    '화',
    '수',
    '목',
    '금',
    '토',
    '일',
  ];
  TimeOfDay? timeOfDay;
  DateTime now = DateTime.now();
  int? selectedDay; // null로 초기화

  await showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        content: Wrap(
          direction: Axis.horizontal,
          alignment: WrapAlignment.center,
          spacing: 4,
          runSpacing: 0,
          children: [
            for (int index = 0; index < weekdays.length; index++)
              ElevatedButton(
                onPressed: () {
                  selectedDay = index + 1;
                  Navigator.pop(context);
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(
                    // 토요일(토요일은 6번째 인덱스)
                    index == 5
                        ? Colors.blue
                        :
                        // 일요일(일요일은 7번째 인덱스)
                        index == 6
                            ? Colors.red
                            : Colors.black,
                  ),
                ),
                child: Text(weekdays[index]),
              ),
          ],
        ),
      );
    },
  );

  if (selectedDay != null) {
    timeOfDay = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.fromDateTime(
        now.add(
          const Duration(minutes: 1),
        ),
      ),
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: ThemeData(
            colorScheme: const ColorScheme.light(
              primary: Colors.black,
            ),
          ),
          child: child!,
        );
      },
    );

    if (timeOfDay != null) {
      // "매일"을 나타내는 값이 아닌 경우에만 Alarms 객체를 생성합니다.
      return Alarms(
        id: id,
        dayOfTheWeek: selectedDay!,
        timeOfDay: timeOfDay,
        isActive: true,
      );
    }
  }

  return null;
}

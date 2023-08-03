// 알람 ID를 생성하는 유틸리티 함수입니다.
import 'package:flutter/material.dart';

int _uniqueId = 0;

int createUniqueId() {
  _uniqueId++;
  return _uniqueId % 100000;
}

class NotificationWeekAndTime {
  final int? id; // 알람 ID 추가, nullable로 변경
  final int dayOfTheWeek;
  final TimeOfDay timeOfDay;
  bool isActive;

  NotificationWeekAndTime({
    // 알람 ID를 생성자에서 받도록 추가
    this.id, // nullable로 변경
    required this.dayOfTheWeek,
    required this.timeOfDay,
    this.isActive = true,
  });

  // 업데이트된 속성을 사용하여 새로운 인스턴스를 생성하는 copyWith 메서드를 정의합니다.
  NotificationWeekAndTime copyWith({
    int? id,
    int? dayOfTheWeek,
    TimeOfDay? timeOfDay,
    bool? isActive,
  }) {
    return NotificationWeekAndTime(
      id: id ?? this.id,
      dayOfTheWeek: dayOfTheWeek ?? this.dayOfTheWeek,
      timeOfDay: timeOfDay ?? this.timeOfDay,
      isActive: isActive ?? this.isActive,
    );
  }
}

// 알람의 요일과 시간을 선택하는 다이얼로그를 표시하고 선택한 값을 반환하는 유틸리티 함수입니다.
Future<NotificationWeekAndTime?> pickSchedule(
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
  int? selectedDay;

  await showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        content: Wrap(
          alignment: WrapAlignment.center,
          spacing: 3,
          children: [
            for (int index = 0; index < weekdays.length; index++)
              ElevatedButton(
                onPressed: () {
                  selectedDay = index + 1;
                  Navigator.pop(context);
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(
                    Colors.black,
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
          Duration(minutes: 1),
        ),
      ),
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: ThemeData(
            colorScheme: ColorScheme.light(
              primary: Colors.black,
            ),
          ),
          child: child!,
        );
      },
    );

    if (timeOfDay != null) {
      return NotificationWeekAndTime(
        id: id,
        dayOfTheWeek: selectedDay!,
        timeOfDay: timeOfDay,
      );
    }
  }

  return null;
}

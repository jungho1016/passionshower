import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:passionshower/presentation/alarm/alarm_screen.dart';
import 'package:passionshower/presentation/like/like_screen.dart';
import 'package:passionshower/presentation/main/main_screen.dart';

class MyHomeScreen extends StatefulWidget {
  const MyHomeScreen({Key? key}) : super(key: key);

  @override
  State<MyHomeScreen> createState() => _MyHomeScreenState();
}

class _MyHomeScreenState extends State<MyHomeScreen> {
  int _currentIndex = 0;
  final List<Widget> _children = [
    const MainScreen(),
    const LikeScreen(),
    const AlarmScreen(),
  ];

  @override
  void initState() {
    super.initState();

    AwesomeNotifications().isNotificationAllowed().then(
      (isAllowed) {
        if (!isAllowed) {
          showDialog(
            context: context,
            builder: (context) => AlertDialog(
              title: const Text('알람 권한'),
              content: const Text('열정 샤워 앱에서 알람 권한을 요청'),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text(
                    '거절',
                    style: TextStyle(color: Colors.red, fontSize: 18),
                  ),
                ),
                TextButton(
                  onPressed: () => AwesomeNotifications()
                      .requestPermissionToSendNotifications()
                      .then((_) => Navigator.pop(context)),
                  child: const Text(
                    '허락',
                    style: TextStyle(
                      color: Colors.indigo,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          );
        }
      },
    );
  }

  void _showLicensePage(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => Theme(
          data: ThemeData.dark(),
          child: const LicensePage(
            applicationName: '열정 샤워 앱',
            applicationVersion: '1.0.0',
            applicationLegalese: '© 2023 Creted By Confu',
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '열정 샤워',
          style: GoogleFonts.nanumBrushScript(
            textStyle: const TextStyle(
                fontWeight: FontWeight.bold, fontSize: 36, color: Colors.white),
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.black,
        actions: [
          IconButton(
            onPressed: () => _showLicensePage(context),
            icon: const Icon(
              Icons.description,
              color: Colors.grey,
            ),
          ),
        ],
      ),
      body: _children[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.black,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        currentIndex: _currentIndex,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: '홈',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            label: '좋아요',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.alarm),
            label: '알람',
          ),
        ],
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey,
      ),
    );
  }
}

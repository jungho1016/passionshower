import 'package:flutter/material.dart';
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
    MainScreen(),
    const LikeScreen(),
    const AlarmScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          '열정 샤워',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      body: _children[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.black,
        onTap: (index) {
          // Handle bottom navigation item taps here
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

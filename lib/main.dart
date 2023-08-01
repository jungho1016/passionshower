import 'package:flutter/material.dart';
import 'package:passionshower/data/data_source/like_data_source.dart';
import 'package:passionshower/data/repository/quotes_repository_impl.dart';
import 'package:passionshower/presentation/alarm/alarm_view_model.dart';
import 'package:passionshower/presentation/main/main_view_model.dart';
import 'package:passionshower/presentation/myhome/myhome_screen.dart';
import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:provider/provider.dart';

import 'presentation/like/like_view_model.dart';

void main() {
  final likeDataSource = LikeDataSource();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<MainScreenViewModel>(
          create: (context) =>
              MainScreenViewModel(QuotesRepositoryImpl(), likeDataSource),
        ),
        ChangeNotifierProvider<LikeScreenViewModel>(
          create: (context) => LikeScreenViewModel(likeDataSource),
        ),
        // ChangeNotifierProvider<Alarm2ViewModel>(
        //   create: (context) => Alarm2ViewModel(),
        // ),
      ],
      child: const MyApp(),
    ),
  );

  AwesomeNotifications().initialize(
      // set the icon to null if you want to use the default app icon
      'resource://drawable/res_image',
      // 'asset://assets/ic_launcher-playstore.png',
      [
        NotificationChannel(
            channelGroupKey: 'basic_channel_group',
            channelKey: 'basic_channel',
            channelName: 'Basic notifications',
            channelDescription: 'Notification channel for basic',
            defaultColor: Colors.redAccent,
            importance: NotificationImportance.High,
            channelShowBadge: true,
            soundSource: null,
            playSound: null,
            ledColor: Colors.red),
        NotificationChannel(
            channelGroupKey: 'schedule_channel_group',
            channelKey: 'schedule_channel',
            channelName: 'Schedule notifications',
            channelDescription: 'Notification channel for schedule',
            defaultColor: Colors.indigo,
            importance: NotificationImportance.High,
            channelShowBadge: true,
            soundSource: null,
            playSound: null,
            ledColor: Colors.red),
      ],
      // Channel groups are only visual and are not required
      // channelGroups: [
      //   NotificationChannelGroup(
      //       channelGroupkey: 'basic_channel_group',
      //       channelGroupName: 'Basic group')
      // ],
      debug: true);
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(),
      home: const MyHomeScreen(),
    );
  }
}

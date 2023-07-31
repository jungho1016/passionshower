import 'package:flutter/material.dart';
import 'package:passionshower/data/data_source/like_data_source.dart';
import 'package:passionshower/data/repository/quotes_repository_impl.dart';
import 'package:passionshower/presentation/main/main_view_model.dart';
import 'package:passionshower/presentation/myhome/myhome_screen.dart';
import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:provider/provider.dart';

import 'presentation/like/like_view_model.dart';

void main() {
  AwesomeNotifications().initialize(
      // set the icon to null if you want to use the default app icon
      'resource://drawable/res_app_icon',
      [
        NotificationChannel(
            channelGroupKey: 'basic_channel_group',
            channelKey: 'basic_channel',
            channelName: 'Basic notifications',
            channelDescription: 'Notification channel for basic tests',
            defaultColor: Color(0xFF9D50DD),
            ledColor: Colors.white)
      ],
      // Channel groups are only visual and are not required
      channelGroups: [
        NotificationChannelGroup(
            channelGroupkey: 'basic_channel_group',
            channelGroupName: 'Basic group')
      ],
      debug: true);

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
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
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

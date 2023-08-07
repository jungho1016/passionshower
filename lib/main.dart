import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:passionshower/di/di_setup.dart';
import 'package:passionshower/presentation/alarm/alarm_view_model.dart';
import 'package:passionshower/presentation/main/main_view_model.dart';
import 'package:passionshower/presentation/myhome/my_home_screen.dart';
import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:provider/provider.dart';
import 'presentation/like/like_view_model.dart';

void main() async {
  configureDependencies();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<MainViewModel>(
            create: (context) => getIt<MainViewModel>()),
        ChangeNotifierProvider<LikeViewModel>(
            create: (context) => getIt<LikeViewModel>()),
        ChangeNotifierProvider<AlarmViewModel>(
            create: (context) => getIt<AlarmViewModel>()),
      ],
      child: const MyApp(),
    ),
  );

  AwesomeNotifications().initialize(
      'resource://drawable/ic_stat_name',
      [
        NotificationChannel(
          channelKey: 'scheduled_channel',
          channelName: 'Scheduled Notifications',
          defaultColor: Colors.teal,
          locked: true,
          importance: NotificationImportance.High,
          channelDescription: '',
        )
      ],
      channelGroups: [
        NotificationChannelGroup(
            channelGroupkey: 'scheduled_channel_group',
            channelGroupName: 'Scheduled group')
      ],
      debug: true);
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      localizationsDelegates: [
        // ... app-specific localization delegate(s) here
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: <Locale>[
        Locale('ko', 'KR'), // 한국어
        Locale('en', 'US'), // English
      ],
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home: MyHomeScreen(),
    );
  }
}

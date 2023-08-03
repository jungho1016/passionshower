import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:passionshower/core/di/di_setup.dart';
import 'package:passionshower/data/data_source/alarm_data_source.dart';
import 'package:passionshower/data/data_source/like_data_source.dart';
import 'package:passionshower/data/repository/alarm_repository_impl.dart';
import 'package:passionshower/data/repository/like_repository_impl.dart';
import 'package:passionshower/data/repository/quotes_repository_impl.dart';
import 'package:passionshower/domain/use_case/get_random_quote_use_case.dart';
import 'package:passionshower/presentation/alarm/alarm_view_model.dart';
import 'package:passionshower/presentation/main/main_view_model.dart';
import 'package:passionshower/presentation/myhome/my_home_screen.dart';
import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:provider/provider.dart';
import 'presentation/like/like_view_model.dart';

// void main() {
//   runApp(
//     MultiProvider(
//       providers: [
//         ChangeNotifierProvider<MainViewModel>(
//             create: (context) => getIt<MainViewModel>()),
//         ChangeNotifierProvider<LikeViewModel>(
//             create: (context) => getIt<LikeViewModel>()),
//         ChangeNotifierProvider<AlarmViewModel>(
//             create: (context) => getIt<AlarmViewModel>()),
//       ],
//       child: const MyApp(),
//     ),
//   );
// {"exception":"Bad state: Tried to read a provider that threw during the creation of its value.\nThe exception occurred during the creation of type MainViewModel.

void main() {
  final likeRepositoryimple = LikeRepositoryimpl(LikeDataSource());
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<MainViewModel>(
          create: (context) => MainViewModel(
            GetRandomQuoteUseCase(QuotesRepositoryImpl()),
            likeRepositoryimple,
          ),
        ),
        ChangeNotifierProvider<LikeViewModel>(
          create: (context) => LikeViewModel(likeRepositoryimple),
        ),
        ChangeNotifierProvider<AlarmViewModel>(
          create: (context) => AlarmViewModel(
            (QuotesRepositoryImpl()),
            AlarmsRepositoryImpl(AlarmDataSource()),
          ),
          // ChangeNotifierProvider<Alarm2ViewModel>(
          //   create: (context) => Alarm2ViewModel(),
          // ),
        )
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
      // Channel groups are only visual and are not required
      // channelGroups: [
      //   NotificationChannelGroup(
      //       channelGroupkey: 'basic_channel_group',
      //       channelGroupName: 'Basic group')
      // ],
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

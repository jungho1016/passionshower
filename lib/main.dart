import 'package:flutter/material.dart';
import 'package:passionshower/data/data_source/like_data_source.dart';
import 'package:passionshower/data/repository/quotes_repository_impl.dart';
import 'package:passionshower/presentation/main/main_view_model.dart';
import 'package:passionshower/presentation/myhome/myhome_screen.dart';
import 'package:provider/provider.dart';

import 'presentation/like/like_view_model.dart';

void main() {
  final likeDataSource = LikeDataSource();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<MainScreenViewModel>(
          create: (context) => MainScreenViewModel(QuotesRepositoryImpl(), likeDataSource),
        ),
        ChangeNotifierProvider<LikeScreenViewModel>(
          create: (context) => LikeScreenViewModel(likeDataSource),
        ),
      ],
      child: const MyApp(),
    ),
  );
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

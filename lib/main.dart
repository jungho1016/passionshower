import 'package:flutter/material.dart';
import 'package:passionshower/data/repository/quotes_repository_impl.dart';
import 'package:passionshower/presentation/main/main_view_model.dart';
import 'package:passionshower/presentation/myhome/myhome_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => MainScreenViewModel(QuotesRepositoryImpl()),
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

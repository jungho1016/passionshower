import 'dart:async';

import 'package:passionshower/presentation/myhome/my_home_event.dart';

class MyHomeViewModel {
  final _eventController = StreamController<MyHomeEvent>.broadcast();

  Stream<MyHomeEvent> get eventStream => _eventController.stream;
}

import 'package:rxdart/rxdart.dart';

class NotAuthLogic {
  factory NotAuthLogic() => _singleton;

  NotAuthLogic._internal();
  static final NotAuthLogic _singleton = NotAuthLogic._internal();

  BehaviorSubject<int> statusSubject = BehaviorSubject<int>();

  void dispose() {
    statusSubject.close();
  }
}

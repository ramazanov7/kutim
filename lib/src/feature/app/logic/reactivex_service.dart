import 'package:kutim/src/feature/app/logic/push_data_dto.dart';
import 'package:rxdart/rxdart.dart';

class ReactiveXService {
  static final ReactiveXService _singleton = ReactiveXService._internal();

  factory ReactiveXService() {
    return _singleton;
  }

  ReactiveXService._internal();

  BehaviorSubject<PushDataDTO> pushRepeater = BehaviorSubject<PushDataDTO>();
}

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:model/model.dart';

part 'active_value_model.freezed.dart';

//part 'active_value_model.g.dart';

// flutter pub run build_runner build --delete-conflicting-outputs
@unfreezed
class ActiveValue with _$ActiveValue {
  factory ActiveValue({
    int? arrhythmia,
    double? oxygen,
    int? heartRate,
    double? sleepinbed,
    double? energyBurned,
    int? steps,
  }) = _ActiveValue;

}
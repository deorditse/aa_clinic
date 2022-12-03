import 'package:freezed_annotation/freezed_annotation.dart';

part 'real_time_call_socket_event_model.freezed.dart';

part 'real_time_call_socket_event_model.g.dart';

// flutter pub run build_runner build --delete-conflicting-outputs
@freezed
class RealTimeCallSocketEvent with _$RealTimeCallSocketEvent {
  const factory RealTimeCallSocketEvent({
    required String id,
    required String from,
  }) = _RealTimeCallSocketEvent;

  factory RealTimeCallSocketEvent.fromJson(Map<String, Object?> json) =>
      _$RealTimeCallSocketEventFromJson(json);
}

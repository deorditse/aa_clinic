import 'package:freezed_annotation/freezed_annotation.dart';

part 'real_time_call_model.freezed.dart';

part 'real_time_call_model.g.dart';

// flutter pub run build_runner build --delete-conflicting-outputs
@freezed
class RealTimeCallModel with _$RealTimeCallModel {
  const factory RealTimeCallModel({
    @Default([]) List<RealTimeCall> docs,
    required int totalDocs,
    required int page,
    required int limit,
    required int totalPages,
    bool? hasPrevPage,
    bool? hasNextPage,
    String? prevPage,
    String? nextPage,
  }) = _RealTimeCallModel;

  factory RealTimeCallModel.fromJson(Map<String, Object?> json) =>
      _$RealTimeCallModelFromJson(json);
}

@freezed
class RealTimeCall with _$RealTimeCall {
  const factory RealTimeCall({
    required String id,
    @Default([]) List<String?> members,
    required String? token,
    required String? appId,
    required String channelName,
    String? createdAt,
    String? finishedAt,
  }) = _RealTimeCall;

  factory RealTimeCall.fromJson(Map<String, Object?> json) =>
      _$RealTimeCallFromJson(json);
}

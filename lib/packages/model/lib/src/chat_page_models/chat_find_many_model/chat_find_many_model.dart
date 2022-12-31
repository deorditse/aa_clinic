import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:model/model.dart';

part 'chat_find_many_model.freezed.dart';

part 'chat_find_many_model.g.dart';

// flutter pub run build_runner build --delete-conflicting-outputs

@unfreezed
class ChatFindManyModel with _$ChatFindManyModel {
  factory ChatFindManyModel({
    required String id,
    UserMinifiedDataIdModel? userMinifiedData,
    String? specialistId,
    String? patientId,
    @Default(false) bool isHidden,
    String? lastMessageDate,
    String? lastMessage,
    int? unreadedMessages,
    required bool isSpecialistOnline,
  }) = _ChatFindManyModel;

  factory ChatFindManyModel.fromJson(Map<String, Object?> json) =>
      _$ChatFindManyModelFromJson(json);
}

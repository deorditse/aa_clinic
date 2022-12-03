import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_minified_data_id.freezed.dart';

part 'user_minified_data_id.g.dart';

// flutter pub run build_runner build --delete-conflicting-outputs

@freezed
class UserMinifiedDataIdModel with _$UserMinifiedDataIdModel {
  factory UserMinifiedDataIdModel({
    required String id,
    String? lastName,
    String? firstName,
    String? middleName,
    String? avatar,
    @Default({}) Map<String, String> specialist,
  }) = _UserMinifiedDataIdModel;

  factory UserMinifiedDataIdModel.fromJson(Map<String, Object?> json) =>
      _$UserMinifiedDataIdModelFromJson(json);
}

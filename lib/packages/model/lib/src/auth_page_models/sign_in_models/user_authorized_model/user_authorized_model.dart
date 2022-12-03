import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_authorized_model.freezed.dart';

part 'user_authorized_model.g.dart';

// flutter pub run build_runner build --delete-conflicting-outputs
@freezed
class UserAuthorizedModel with _$UserAuthorizedModel {
  const factory UserAuthorizedModel({
     String? id,
     String? firstName, //firstName
     String? lastName,
     String? username,  //username
    required double role, //role
    required String accessToken, //accessToken
    required String refreshToken, //refreshToken
    required double expiresIn, //expiresIn

  }) = _UserAuthorizedModel;

  factory UserAuthorizedModel.fromJson(Map<String, Object?> json) =>
      _$UserAuthorizedModelFromJson(json);
}

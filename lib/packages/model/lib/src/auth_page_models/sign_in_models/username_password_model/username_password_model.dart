import 'package:freezed_annotation/freezed_annotation.dart';

part 'username_password_model.freezed.dart';

// flutter pub run build_runner build --delete-conflicting-outputs
@freezed
class UsernamePasswordModel with _$UsernamePasswordModel {
  const factory UsernamePasswordModel({
    required String username,
    required String password,
  }) = _UsernamePasswordModel;
}

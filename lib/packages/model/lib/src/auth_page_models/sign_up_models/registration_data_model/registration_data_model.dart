import 'package:freezed_annotation/freezed_annotation.dart';

part 'registration_data_model.freezed.dart';
part 'registration_data_model.g.dart';

// flutter pub run build_runner build --delete-conflicting-outputs
@freezed
class RegistrationDataModel with _$RegistrationDataModel {
  const factory RegistrationDataModel({
    required String firstName,
    required String lastName,
    required String email,
    required String password,
  }) = _RegistrationDataModel;

  factory RegistrationDataModel.fromJson(Map<String, Object?> json) =>
      _$RegistrationDataModelFromJson(json);
}

import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_data_model.freezed.dart';

part 'user_data_model.g.dart';

// flutter pub run build_runner build --delete-conflicting-outputs
@unfreezed
class UserDataModel with _$UserDataModel {
  factory UserDataModel({
    required String id,
    required String username,
    String? lastName,
    required String firstName,
    String? middleName,
    required int? gender,
    String? lastRequest,
    required String email,
    bool? isBanned,
    bool? isEmailVerified,
    required int role,
    // //[ 0 - patient, 1 - specialist, 2 - moder, 5 - admin, 7 - InnerService ]
    String? subscription,
    required List<String?> attachedSpecialists,
    String? bio,
    required int availableAppointments,
    required List<String?> achievements,
    String? bdate,
    String? phoneNumber,
    String? location,
    Address? address,
    String? avatar,
    String? avatarThumbnail,
    String? lang,
    String? createdAt,
    String? updatedAt,
    required bool isOnline,
  }) = _UserDataModel;

  factory UserDataModel.fromJson(Map<String, Object?> json) =>
      _$UserDataModelFromJson(json);
}

@unfreezed
class Address with _$Address {
  factory Address({
    String? zipCode,
    String? country,
    String? city,
    String? street,
    String? house,
    String? appartment,
  }) = _Address;

  factory Address.fromJson(Map<String, Object?> json) =>
      _$AddressFromJson(json);
}

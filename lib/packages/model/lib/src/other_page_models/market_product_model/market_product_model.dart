import 'package:freezed_annotation/freezed_annotation.dart';

part 'market_product_model.freezed.dart';

part 'market_product_model.g.dart';

// flutter pub run build_runner build --delete-conflicting-outputs
@freezed
class MarketProductModel with _$MarketProductModel {
  const factory MarketProductModel({
    required String id,
    required String creatorId,
    //Артикль продукта
    String? sku,
    double? priceIn,
    double? price,
    String? currency,
    String? currencyCode,
    String? title,
    String? description,
    int? volume,
    String? volumeUnits,
    String? category,
    @Default([]) List<String?> imagesFileIds,
    @Default([]) List<Availability?> availability,
    String? createdAt,
    String? updatedAt,
  }) = _MarketProductModel;

  factory MarketProductModel.fromJson(Map<String, Object?> json) =>
      _$MarketProductModelFromJson(json);
}

@freezed
class Availability with _$Availability {
  const factory Availability({
    String? country,
    String? city,
    @Default({}) Map geolocation,
    String? partnerId,
    int? count,
  }) = _Availability;

  factory Availability.fromJson(Map<String, Object?> json) =>
      _$AvailabilityFromJson(json);
}

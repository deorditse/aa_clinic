import 'package:freezed_annotation/freezed_annotation.dart';

part 'subscriptions_model.freezed.dart';

part 'subscriptions_model.g.dart';

// flutter pub run build_runner build --delete-conflicting-outputs
@freezed
class SubscriptionsModel with _$SubscriptionsModel {
  const factory SubscriptionsModel({
    @Default([]) List<MarketSubscription?> docs,
    int? totalDocs,
    int? limit,
    required int page,
    required int totalPages,
    @Default(false) bool hasPrevPage,
    @Default(false) bool hasNextPage,
    int? prevPage,
    int? nextPage,
  }) = _SubscriptionsModel;

  factory SubscriptionsModel.fromJson(Map<String, Object?> json) =>
      _$SubscriptionsModelFromJson(json);
}

@freezed
class MarketSubscription with _$MarketSubscription {
  const factory MarketSubscription({
    required String id,
    String? creatorId,
    int? pricePerMonth,
    String? currency,
    String? currencyCode,
    String? title,
    String? description,
    String? mark,
    String? image,
    String? createdAt,
    String? updatedAt,
  }) = _MarketSubscription;

  factory MarketSubscription.fromJson(Map<String, Object?> json) =>
      _$MarketSubscriptionFromJson(json);
}

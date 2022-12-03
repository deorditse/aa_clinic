// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'subscriptions_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_SubscriptionsModel _$$_SubscriptionsModelFromJson(
        Map<String, dynamic> json) =>
    _$_SubscriptionsModel(
      docs: (json['docs'] as List<dynamic>?)
              ?.map((e) => e == null
                  ? null
                  : MarketSubscription.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      totalDocs: json['totalDocs'] as int?,
      limit: json['limit'] as int?,
      page: json['page'] as int,
      totalPages: json['totalPages'] as int,
      hasPrevPage: json['hasPrevPage'] as bool? ?? false,
      hasNextPage: json['hasNextPage'] as bool? ?? false,
      prevPage: json['prevPage'] as int?,
      nextPage: json['nextPage'] as int?,
    );

Map<String, dynamic> _$$_SubscriptionsModelToJson(
        _$_SubscriptionsModel instance) =>
    <String, dynamic>{
      'docs': instance.docs,
      'totalDocs': instance.totalDocs,
      'limit': instance.limit,
      'page': instance.page,
      'totalPages': instance.totalPages,
      'hasPrevPage': instance.hasPrevPage,
      'hasNextPage': instance.hasNextPage,
      'prevPage': instance.prevPage,
      'nextPage': instance.nextPage,
    };

_$_MarketSubscription _$$_MarketSubscriptionFromJson(
        Map<String, dynamic> json) =>
    _$_MarketSubscription(
      id: json['id'] as String,
      creatorId: json['creatorId'] as String?,
      pricePerMonth: json['pricePerMonth'] as int?,
      currency: json['currency'] as String?,
      currencyCode: json['currencyCode'] as String?,
      title: json['title'] as String?,
      description: json['description'] as String?,
      mark: json['mark'] as String?,
      image: json['image'] as String?,
      createdAt: json['createdAt'] as String?,
      updatedAt: json['updatedAt'] as String?,
    );

Map<String, dynamic> _$$_MarketSubscriptionToJson(
        _$_MarketSubscription instance) =>
    <String, dynamic>{
      'id': instance.id,
      'creatorId': instance.creatorId,
      'pricePerMonth': instance.pricePerMonth,
      'currency': instance.currency,
      'currencyCode': instance.currencyCode,
      'title': instance.title,
      'description': instance.description,
      'mark': instance.mark,
      'image': instance.image,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
    };

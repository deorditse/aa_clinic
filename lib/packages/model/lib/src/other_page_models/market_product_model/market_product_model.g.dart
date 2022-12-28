// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'market_product_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_MarketProductModel _$$_MarketProductModelFromJson(
        Map<String, dynamic> json) =>
    _$_MarketProductModel(
      id: json['id'] as String,
      creatorId: json['creatorId'] as String,
      sku: json['sku'] as String?,
      priceIn: (json['priceIn'] as num?)?.toDouble(),
      price: (json['price'] as num?)?.toDouble(),
      currency: json['currency'] as String?,
      currencyCode: json['currencyCode'] as String?,
      title: json['title'] as String?,
      description: json['description'] as String?,
      volume: json['volume'] as int?,
      volumeUnits: json['volumeUnits'] as String?,
      category: json['category'] as String?,
      imagesFileIds: (json['imagesFileIds'] as List<dynamic>?)
              ?.map((e) => e as String?)
              .toList() ??
          const [],
      availability: (json['availability'] as List<dynamic>?)
              ?.map((e) => e == null
                  ? null
                  : Availability.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      createdAt: json['createdAt'] as String?,
      updatedAt: json['updatedAt'] as String?,
    );

Map<String, dynamic> _$$_MarketProductModelToJson(
        _$_MarketProductModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'creatorId': instance.creatorId,
      'sku': instance.sku,
      'priceIn': instance.priceIn,
      'price': instance.price,
      'currency': instance.currency,
      'currencyCode': instance.currencyCode,
      'title': instance.title,
      'description': instance.description,
      'volume': instance.volume,
      'volumeUnits': instance.volumeUnits,
      'category': instance.category,
      'imagesFileIds': instance.imagesFileIds,
      'availability': instance.availability,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
    };

_$_Availability _$$_AvailabilityFromJson(Map<String, dynamic> json) =>
    _$_Availability(
      country: json['country'] as String?,
      city: json['city'] as String?,
      geolocation: json['geolocation'] as Map<String, dynamic>? ?? const {},
      partnerId: json['partnerId'] as String?,
      count: json['count'] as int?,
    );

Map<String, dynamic> _$$_AvailabilityToJson(_$_Availability instance) =>
    <String, dynamic>{
      'country': instance.country,
      'city': instance.city,
      'geolocation': instance.geolocation,
      'partnerId': instance.partnerId,
      'count': instance.count,
    };

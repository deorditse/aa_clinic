// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_OrdersModel _$$_OrdersModelFromJson(Map<String, dynamic> json) =>
    _$_OrdersModel(
      docs: (json['docs'] as List<dynamic>?)
              ?.map((e) =>
                  e == null ? null : Order.fromJson(e as Map<String, dynamic>))
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

Map<String, dynamic> _$$_OrdersModelToJson(_$_OrdersModel instance) =>
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

_$_Order _$$_OrderFromJson(Map<String, dynamic> json) => _$_Order(
      id: json['id'] as String,
      cart: (json['cart'] as List<dynamic>?)
              ?.map((e) =>
                  e == null ? null : Cart.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      totalPrice: json['totalPrice'] as int?,
      currencyCode: json['currencyCode'] as String?,
      currency: json['currency'] as String?,
      creatorId: json['creatorId'] as String?,
      userId: json['userId'] as String?,
      address: json['address'] as String?,
      payedAt: json['payedAt'] as String?,
      sendedAt: json['sendedAt'] as String?,
      status: json['status'] as String?,
      description: json['description'] as String?,
      isUpdateable: json['isUpdateable'] as bool?,
      createdAt: json['createdAt'] as String?,
      updatedAt: json['updatedAt'] as String?,
    );

Map<String, dynamic> _$$_OrderToJson(_$_Order instance) => <String, dynamic>{
      'id': instance.id,
      'cart': instance.cart,
      'totalPrice': instance.totalPrice,
      'currencyCode': instance.currencyCode,
      'currency': instance.currency,
      'creatorId': instance.creatorId,
      'userId': instance.userId,
      'address': instance.address,
      'payedAt': instance.payedAt,
      'sendedAt': instance.sendedAt,
      'status': instance.status,
      'description': instance.description,
      'isUpdateable': instance.isUpdateable,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
    };

_$_Cart _$$_CartFromJson(Map<String, dynamic> json) => _$_Cart(
      marketElementId: json['marketElementId'] as String?,
      elementType: json['elementType'] as String?,
      count: json['count'] as int? ?? 0,
      totalPrice: (json['totalPrice'] as num?)?.toDouble(),
      currencyCode: json['currencyCode'] as String?,
      currency: json['currency'] as String?,
    );

Map<String, dynamic> _$$_CartToJson(_$_Cart instance) => <String, dynamic>{
      'marketElementId': instance.marketElementId,
      'elementType': instance.elementType,
      'count': instance.count,
      'totalPrice': instance.totalPrice,
      'currencyCode': instance.currencyCode,
      'currency': instance.currency,
    };

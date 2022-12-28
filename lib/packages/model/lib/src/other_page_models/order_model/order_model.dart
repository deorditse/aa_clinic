import 'package:freezed_annotation/freezed_annotation.dart';

part 'order_model.freezed.dart';

part 'order_model.g.dart';

// flutter pub run build_runner build --delete-conflicting-outputs
@freezed
class OrdersModel with _$OrdersModel {
  const factory OrdersModel({
    @Default([]) List<Order?> docs,
    int? totalDocs,
    int? limit,
    required int page,
    required int totalPages,
    @Default(false) bool hasPrevPage,
    @Default(false) bool hasNextPage,
    int? prevPage,
    int? nextPage,
  }) = _OrdersModel;

  factory OrdersModel.fromJson(Map<String, Object?> json) =>
      _$OrdersModelFromJson(json);
}

@freezed
class Order with _$Order {
  const factory Order({
    //id заказа
    required String id,
    @Default([]) List<Cart?> cart,
    //Финальная стоимость
    int? totalPrice,
    String? currencyCode,
    String? currency,
    String? creatorId,
    String? userId,
    //дата оплаты
    String? address,
    String? payedAt,
    //Дата выставления заказа пациенту
    String? sendedAt,
    String? status,
    String? description,
    bool? isUpdateable,
    String? createdAt,
    String? updatedAt,
  }) = _Order;

  factory Order.fromJson(Map<String, Object?> json) => _$OrderFromJson(json);
}

@freezed
class Cart with _$Cart {
  //Корзина заказа, массив представляющий из себя объект c marketElementId,elementType, количеством, финальной ценой, валютой и кодом валюты
  const factory Cart({
    String? marketElementId,
    String? elementType,
    @Default(0) int count,
    double? totalPrice,
    String? currencyCode,
    String? currency,
  }) = _Cart;

  factory Cart.fromJson(Map<String, Object?> json) => _$CartFromJson(json);
}

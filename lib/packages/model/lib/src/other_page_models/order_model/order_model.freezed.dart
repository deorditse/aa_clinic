// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'order_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

OrdersModel _$OrdersModelFromJson(Map<String, dynamic> json) {
  return _OrdersModel.fromJson(json);
}

/// @nodoc
mixin _$OrdersModel {
  List<Order?> get docs => throw _privateConstructorUsedError;
  int? get totalDocs => throw _privateConstructorUsedError;
  int? get limit => throw _privateConstructorUsedError;
  int get page => throw _privateConstructorUsedError;
  int get totalPages => throw _privateConstructorUsedError;
  bool get hasPrevPage => throw _privateConstructorUsedError;
  bool get hasNextPage => throw _privateConstructorUsedError;
  int? get prevPage => throw _privateConstructorUsedError;
  int? get nextPage => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $OrdersModelCopyWith<OrdersModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OrdersModelCopyWith<$Res> {
  factory $OrdersModelCopyWith(
          OrdersModel value, $Res Function(OrdersModel) then) =
      _$OrdersModelCopyWithImpl<$Res, OrdersModel>;
  @useResult
  $Res call(
      {List<Order?> docs,
      int? totalDocs,
      int? limit,
      int page,
      int totalPages,
      bool hasPrevPage,
      bool hasNextPage,
      int? prevPage,
      int? nextPage});
}

/// @nodoc
class _$OrdersModelCopyWithImpl<$Res, $Val extends OrdersModel>
    implements $OrdersModelCopyWith<$Res> {
  _$OrdersModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? docs = null,
    Object? totalDocs = freezed,
    Object? limit = freezed,
    Object? page = null,
    Object? totalPages = null,
    Object? hasPrevPage = null,
    Object? hasNextPage = null,
    Object? prevPage = freezed,
    Object? nextPage = freezed,
  }) {
    return _then(_value.copyWith(
      docs: null == docs
          ? _value.docs
          : docs // ignore: cast_nullable_to_non_nullable
              as List<Order?>,
      totalDocs: freezed == totalDocs
          ? _value.totalDocs
          : totalDocs // ignore: cast_nullable_to_non_nullable
              as int?,
      limit: freezed == limit
          ? _value.limit
          : limit // ignore: cast_nullable_to_non_nullable
              as int?,
      page: null == page
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as int,
      totalPages: null == totalPages
          ? _value.totalPages
          : totalPages // ignore: cast_nullable_to_non_nullable
              as int,
      hasPrevPage: null == hasPrevPage
          ? _value.hasPrevPage
          : hasPrevPage // ignore: cast_nullable_to_non_nullable
              as bool,
      hasNextPage: null == hasNextPage
          ? _value.hasNextPage
          : hasNextPage // ignore: cast_nullable_to_non_nullable
              as bool,
      prevPage: freezed == prevPage
          ? _value.prevPage
          : prevPage // ignore: cast_nullable_to_non_nullable
              as int?,
      nextPage: freezed == nextPage
          ? _value.nextPage
          : nextPage // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_OrdersModelCopyWith<$Res>
    implements $OrdersModelCopyWith<$Res> {
  factory _$$_OrdersModelCopyWith(
          _$_OrdersModel value, $Res Function(_$_OrdersModel) then) =
      __$$_OrdersModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<Order?> docs,
      int? totalDocs,
      int? limit,
      int page,
      int totalPages,
      bool hasPrevPage,
      bool hasNextPage,
      int? prevPage,
      int? nextPage});
}

/// @nodoc
class __$$_OrdersModelCopyWithImpl<$Res>
    extends _$OrdersModelCopyWithImpl<$Res, _$_OrdersModel>
    implements _$$_OrdersModelCopyWith<$Res> {
  __$$_OrdersModelCopyWithImpl(
      _$_OrdersModel _value, $Res Function(_$_OrdersModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? docs = null,
    Object? totalDocs = freezed,
    Object? limit = freezed,
    Object? page = null,
    Object? totalPages = null,
    Object? hasPrevPage = null,
    Object? hasNextPage = null,
    Object? prevPage = freezed,
    Object? nextPage = freezed,
  }) {
    return _then(_$_OrdersModel(
      docs: null == docs
          ? _value._docs
          : docs // ignore: cast_nullable_to_non_nullable
              as List<Order?>,
      totalDocs: freezed == totalDocs
          ? _value.totalDocs
          : totalDocs // ignore: cast_nullable_to_non_nullable
              as int?,
      limit: freezed == limit
          ? _value.limit
          : limit // ignore: cast_nullable_to_non_nullable
              as int?,
      page: null == page
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as int,
      totalPages: null == totalPages
          ? _value.totalPages
          : totalPages // ignore: cast_nullable_to_non_nullable
              as int,
      hasPrevPage: null == hasPrevPage
          ? _value.hasPrevPage
          : hasPrevPage // ignore: cast_nullable_to_non_nullable
              as bool,
      hasNextPage: null == hasNextPage
          ? _value.hasNextPage
          : hasNextPage // ignore: cast_nullable_to_non_nullable
              as bool,
      prevPage: freezed == prevPage
          ? _value.prevPage
          : prevPage // ignore: cast_nullable_to_non_nullable
              as int?,
      nextPage: freezed == nextPage
          ? _value.nextPage
          : nextPage // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_OrdersModel implements _OrdersModel {
  const _$_OrdersModel(
      {final List<Order?> docs = const [],
      this.totalDocs,
      this.limit,
      required this.page,
      required this.totalPages,
      this.hasPrevPage = false,
      this.hasNextPage = false,
      this.prevPage,
      this.nextPage})
      : _docs = docs;

  factory _$_OrdersModel.fromJson(Map<String, dynamic> json) =>
      _$$_OrdersModelFromJson(json);

  final List<Order?> _docs;
  @override
  @JsonKey()
  List<Order?> get docs {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_docs);
  }

  @override
  final int? totalDocs;
  @override
  final int? limit;
  @override
  final int page;
  @override
  final int totalPages;
  @override
  @JsonKey()
  final bool hasPrevPage;
  @override
  @JsonKey()
  final bool hasNextPage;
  @override
  final int? prevPage;
  @override
  final int? nextPage;

  @override
  String toString() {
    return 'OrdersModel(docs: $docs, totalDocs: $totalDocs, limit: $limit, page: $page, totalPages: $totalPages, hasPrevPage: $hasPrevPage, hasNextPage: $hasNextPage, prevPage: $prevPage, nextPage: $nextPage)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_OrdersModel &&
            const DeepCollectionEquality().equals(other._docs, _docs) &&
            (identical(other.totalDocs, totalDocs) ||
                other.totalDocs == totalDocs) &&
            (identical(other.limit, limit) || other.limit == limit) &&
            (identical(other.page, page) || other.page == page) &&
            (identical(other.totalPages, totalPages) ||
                other.totalPages == totalPages) &&
            (identical(other.hasPrevPage, hasPrevPage) ||
                other.hasPrevPage == hasPrevPage) &&
            (identical(other.hasNextPage, hasNextPage) ||
                other.hasNextPage == hasNextPage) &&
            (identical(other.prevPage, prevPage) ||
                other.prevPage == prevPage) &&
            (identical(other.nextPage, nextPage) ||
                other.nextPage == nextPage));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_docs),
      totalDocs,
      limit,
      page,
      totalPages,
      hasPrevPage,
      hasNextPage,
      prevPage,
      nextPage);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_OrdersModelCopyWith<_$_OrdersModel> get copyWith =>
      __$$_OrdersModelCopyWithImpl<_$_OrdersModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_OrdersModelToJson(
      this,
    );
  }
}

abstract class _OrdersModel implements OrdersModel {
  const factory _OrdersModel(
      {final List<Order?> docs,
      final int? totalDocs,
      final int? limit,
      required final int page,
      required final int totalPages,
      final bool hasPrevPage,
      final bool hasNextPage,
      final int? prevPage,
      final int? nextPage}) = _$_OrdersModel;

  factory _OrdersModel.fromJson(Map<String, dynamic> json) =
      _$_OrdersModel.fromJson;

  @override
  List<Order?> get docs;
  @override
  int? get totalDocs;
  @override
  int? get limit;
  @override
  int get page;
  @override
  int get totalPages;
  @override
  bool get hasPrevPage;
  @override
  bool get hasNextPage;
  @override
  int? get prevPage;
  @override
  int? get nextPage;
  @override
  @JsonKey(ignore: true)
  _$$_OrdersModelCopyWith<_$_OrdersModel> get copyWith =>
      throw _privateConstructorUsedError;
}

Order _$OrderFromJson(Map<String, dynamic> json) {
  return _Order.fromJson(json);
}

/// @nodoc
mixin _$Order {
//id заказа
  String get id => throw _privateConstructorUsedError;
  List<Cart?> get cart =>
      throw _privateConstructorUsedError; //Финальная стоимость
  int? get totalPrice => throw _privateConstructorUsedError;
  String? get currencyCode => throw _privateConstructorUsedError;
  String? get currency => throw _privateConstructorUsedError;
  String? get creatorId => throw _privateConstructorUsedError;
  String? get userId => throw _privateConstructorUsedError; //дата оплаты
  String? get address => throw _privateConstructorUsedError;
  String? get payedAt =>
      throw _privateConstructorUsedError; //Дата выставления заказа пациенту
  String? get sendedAt => throw _privateConstructorUsedError;
  String? get status => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  bool? get isUpdateable => throw _privateConstructorUsedError;
  String? get createdAt => throw _privateConstructorUsedError;
  String? get updatedAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $OrderCopyWith<Order> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OrderCopyWith<$Res> {
  factory $OrderCopyWith(Order value, $Res Function(Order) then) =
      _$OrderCopyWithImpl<$Res, Order>;
  @useResult
  $Res call(
      {String id,
      List<Cart?> cart,
      int? totalPrice,
      String? currencyCode,
      String? currency,
      String? creatorId,
      String? userId,
      String? address,
      String? payedAt,
      String? sendedAt,
      String? status,
      String? description,
      bool? isUpdateable,
      String? createdAt,
      String? updatedAt});
}

/// @nodoc
class _$OrderCopyWithImpl<$Res, $Val extends Order>
    implements $OrderCopyWith<$Res> {
  _$OrderCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? cart = null,
    Object? totalPrice = freezed,
    Object? currencyCode = freezed,
    Object? currency = freezed,
    Object? creatorId = freezed,
    Object? userId = freezed,
    Object? address = freezed,
    Object? payedAt = freezed,
    Object? sendedAt = freezed,
    Object? status = freezed,
    Object? description = freezed,
    Object? isUpdateable = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      cart: null == cart
          ? _value.cart
          : cart // ignore: cast_nullable_to_non_nullable
              as List<Cart?>,
      totalPrice: freezed == totalPrice
          ? _value.totalPrice
          : totalPrice // ignore: cast_nullable_to_non_nullable
              as int?,
      currencyCode: freezed == currencyCode
          ? _value.currencyCode
          : currencyCode // ignore: cast_nullable_to_non_nullable
              as String?,
      currency: freezed == currency
          ? _value.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as String?,
      creatorId: freezed == creatorId
          ? _value.creatorId
          : creatorId // ignore: cast_nullable_to_non_nullable
              as String?,
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String?,
      address: freezed == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String?,
      payedAt: freezed == payedAt
          ? _value.payedAt
          : payedAt // ignore: cast_nullable_to_non_nullable
              as String?,
      sendedAt: freezed == sendedAt
          ? _value.sendedAt
          : sendedAt // ignore: cast_nullable_to_non_nullable
              as String?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      isUpdateable: freezed == isUpdateable
          ? _value.isUpdateable
          : isUpdateable // ignore: cast_nullable_to_non_nullable
              as bool?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_OrderCopyWith<$Res> implements $OrderCopyWith<$Res> {
  factory _$$_OrderCopyWith(_$_Order value, $Res Function(_$_Order) then) =
      __$$_OrderCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      List<Cart?> cart,
      int? totalPrice,
      String? currencyCode,
      String? currency,
      String? creatorId,
      String? userId,
      String? address,
      String? payedAt,
      String? sendedAt,
      String? status,
      String? description,
      bool? isUpdateable,
      String? createdAt,
      String? updatedAt});
}

/// @nodoc
class __$$_OrderCopyWithImpl<$Res> extends _$OrderCopyWithImpl<$Res, _$_Order>
    implements _$$_OrderCopyWith<$Res> {
  __$$_OrderCopyWithImpl(_$_Order _value, $Res Function(_$_Order) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? cart = null,
    Object? totalPrice = freezed,
    Object? currencyCode = freezed,
    Object? currency = freezed,
    Object? creatorId = freezed,
    Object? userId = freezed,
    Object? address = freezed,
    Object? payedAt = freezed,
    Object? sendedAt = freezed,
    Object? status = freezed,
    Object? description = freezed,
    Object? isUpdateable = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_$_Order(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      cart: null == cart
          ? _value._cart
          : cart // ignore: cast_nullable_to_non_nullable
              as List<Cart?>,
      totalPrice: freezed == totalPrice
          ? _value.totalPrice
          : totalPrice // ignore: cast_nullable_to_non_nullable
              as int?,
      currencyCode: freezed == currencyCode
          ? _value.currencyCode
          : currencyCode // ignore: cast_nullable_to_non_nullable
              as String?,
      currency: freezed == currency
          ? _value.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as String?,
      creatorId: freezed == creatorId
          ? _value.creatorId
          : creatorId // ignore: cast_nullable_to_non_nullable
              as String?,
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String?,
      address: freezed == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String?,
      payedAt: freezed == payedAt
          ? _value.payedAt
          : payedAt // ignore: cast_nullable_to_non_nullable
              as String?,
      sendedAt: freezed == sendedAt
          ? _value.sendedAt
          : sendedAt // ignore: cast_nullable_to_non_nullable
              as String?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      isUpdateable: freezed == isUpdateable
          ? _value.isUpdateable
          : isUpdateable // ignore: cast_nullable_to_non_nullable
              as bool?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Order implements _Order {
  const _$_Order(
      {required this.id,
      final List<Cart?> cart = const [],
      this.totalPrice,
      this.currencyCode,
      this.currency,
      this.creatorId,
      this.userId,
      this.address,
      this.payedAt,
      this.sendedAt,
      this.status,
      this.description,
      this.isUpdateable,
      this.createdAt,
      this.updatedAt})
      : _cart = cart;

  factory _$_Order.fromJson(Map<String, dynamic> json) =>
      _$$_OrderFromJson(json);

//id заказа
  @override
  final String id;
  final List<Cart?> _cart;
  @override
  @JsonKey()
  List<Cart?> get cart {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_cart);
  }

//Финальная стоимость
  @override
  final int? totalPrice;
  @override
  final String? currencyCode;
  @override
  final String? currency;
  @override
  final String? creatorId;
  @override
  final String? userId;
//дата оплаты
  @override
  final String? address;
  @override
  final String? payedAt;
//Дата выставления заказа пациенту
  @override
  final String? sendedAt;
  @override
  final String? status;
  @override
  final String? description;
  @override
  final bool? isUpdateable;
  @override
  final String? createdAt;
  @override
  final String? updatedAt;

  @override
  String toString() {
    return 'Order(id: $id, cart: $cart, totalPrice: $totalPrice, currencyCode: $currencyCode, currency: $currency, creatorId: $creatorId, userId: $userId, address: $address, payedAt: $payedAt, sendedAt: $sendedAt, status: $status, description: $description, isUpdateable: $isUpdateable, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Order &&
            (identical(other.id, id) || other.id == id) &&
            const DeepCollectionEquality().equals(other._cart, _cart) &&
            (identical(other.totalPrice, totalPrice) ||
                other.totalPrice == totalPrice) &&
            (identical(other.currencyCode, currencyCode) ||
                other.currencyCode == currencyCode) &&
            (identical(other.currency, currency) ||
                other.currency == currency) &&
            (identical(other.creatorId, creatorId) ||
                other.creatorId == creatorId) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.payedAt, payedAt) || other.payedAt == payedAt) &&
            (identical(other.sendedAt, sendedAt) ||
                other.sendedAt == sendedAt) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.isUpdateable, isUpdateable) ||
                other.isUpdateable == isUpdateable) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      const DeepCollectionEquality().hash(_cart),
      totalPrice,
      currencyCode,
      currency,
      creatorId,
      userId,
      address,
      payedAt,
      sendedAt,
      status,
      description,
      isUpdateable,
      createdAt,
      updatedAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_OrderCopyWith<_$_Order> get copyWith =>
      __$$_OrderCopyWithImpl<_$_Order>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_OrderToJson(
      this,
    );
  }
}

abstract class _Order implements Order {
  const factory _Order(
      {required final String id,
      final List<Cart?> cart,
      final int? totalPrice,
      final String? currencyCode,
      final String? currency,
      final String? creatorId,
      final String? userId,
      final String? address,
      final String? payedAt,
      final String? sendedAt,
      final String? status,
      final String? description,
      final bool? isUpdateable,
      final String? createdAt,
      final String? updatedAt}) = _$_Order;

  factory _Order.fromJson(Map<String, dynamic> json) = _$_Order.fromJson;

  @override //id заказа
  String get id;
  @override
  List<Cart?> get cart;
  @override //Финальная стоимость
  int? get totalPrice;
  @override
  String? get currencyCode;
  @override
  String? get currency;
  @override
  String? get creatorId;
  @override
  String? get userId;
  @override //дата оплаты
  String? get address;
  @override
  String? get payedAt;
  @override //Дата выставления заказа пациенту
  String? get sendedAt;
  @override
  String? get status;
  @override
  String? get description;
  @override
  bool? get isUpdateable;
  @override
  String? get createdAt;
  @override
  String? get updatedAt;
  @override
  @JsonKey(ignore: true)
  _$$_OrderCopyWith<_$_Order> get copyWith =>
      throw _privateConstructorUsedError;
}

Cart _$CartFromJson(Map<String, dynamic> json) {
  return _Cart.fromJson(json);
}

/// @nodoc
mixin _$Cart {
  String? get marketElementId => throw _privateConstructorUsedError;
  String? get elementType => throw _privateConstructorUsedError;
  int get count => throw _privateConstructorUsedError;
  double? get totalPrice => throw _privateConstructorUsedError;
  String? get currencyCode => throw _privateConstructorUsedError;
  String? get currency => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CartCopyWith<Cart> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CartCopyWith<$Res> {
  factory $CartCopyWith(Cart value, $Res Function(Cart) then) =
      _$CartCopyWithImpl<$Res, Cart>;
  @useResult
  $Res call(
      {String? marketElementId,
      String? elementType,
      int count,
      double? totalPrice,
      String? currencyCode,
      String? currency});
}

/// @nodoc
class _$CartCopyWithImpl<$Res, $Val extends Cart>
    implements $CartCopyWith<$Res> {
  _$CartCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? marketElementId = freezed,
    Object? elementType = freezed,
    Object? count = null,
    Object? totalPrice = freezed,
    Object? currencyCode = freezed,
    Object? currency = freezed,
  }) {
    return _then(_value.copyWith(
      marketElementId: freezed == marketElementId
          ? _value.marketElementId
          : marketElementId // ignore: cast_nullable_to_non_nullable
              as String?,
      elementType: freezed == elementType
          ? _value.elementType
          : elementType // ignore: cast_nullable_to_non_nullable
              as String?,
      count: null == count
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int,
      totalPrice: freezed == totalPrice
          ? _value.totalPrice
          : totalPrice // ignore: cast_nullable_to_non_nullable
              as double?,
      currencyCode: freezed == currencyCode
          ? _value.currencyCode
          : currencyCode // ignore: cast_nullable_to_non_nullable
              as String?,
      currency: freezed == currency
          ? _value.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_CartCopyWith<$Res> implements $CartCopyWith<$Res> {
  factory _$$_CartCopyWith(_$_Cart value, $Res Function(_$_Cart) then) =
      __$$_CartCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? marketElementId,
      String? elementType,
      int count,
      double? totalPrice,
      String? currencyCode,
      String? currency});
}

/// @nodoc
class __$$_CartCopyWithImpl<$Res> extends _$CartCopyWithImpl<$Res, _$_Cart>
    implements _$$_CartCopyWith<$Res> {
  __$$_CartCopyWithImpl(_$_Cart _value, $Res Function(_$_Cart) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? marketElementId = freezed,
    Object? elementType = freezed,
    Object? count = null,
    Object? totalPrice = freezed,
    Object? currencyCode = freezed,
    Object? currency = freezed,
  }) {
    return _then(_$_Cart(
      marketElementId: freezed == marketElementId
          ? _value.marketElementId
          : marketElementId // ignore: cast_nullable_to_non_nullable
              as String?,
      elementType: freezed == elementType
          ? _value.elementType
          : elementType // ignore: cast_nullable_to_non_nullable
              as String?,
      count: null == count
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int,
      totalPrice: freezed == totalPrice
          ? _value.totalPrice
          : totalPrice // ignore: cast_nullable_to_non_nullable
              as double?,
      currencyCode: freezed == currencyCode
          ? _value.currencyCode
          : currencyCode // ignore: cast_nullable_to_non_nullable
              as String?,
      currency: freezed == currency
          ? _value.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Cart implements _Cart {
  const _$_Cart(
      {this.marketElementId,
      this.elementType,
      this.count = 0,
      this.totalPrice,
      this.currencyCode,
      this.currency});

  factory _$_Cart.fromJson(Map<String, dynamic> json) => _$$_CartFromJson(json);

  @override
  final String? marketElementId;
  @override
  final String? elementType;
  @override
  @JsonKey()
  final int count;
  @override
  final double? totalPrice;
  @override
  final String? currencyCode;
  @override
  final String? currency;

  @override
  String toString() {
    return 'Cart(marketElementId: $marketElementId, elementType: $elementType, count: $count, totalPrice: $totalPrice, currencyCode: $currencyCode, currency: $currency)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Cart &&
            (identical(other.marketElementId, marketElementId) ||
                other.marketElementId == marketElementId) &&
            (identical(other.elementType, elementType) ||
                other.elementType == elementType) &&
            (identical(other.count, count) || other.count == count) &&
            (identical(other.totalPrice, totalPrice) ||
                other.totalPrice == totalPrice) &&
            (identical(other.currencyCode, currencyCode) ||
                other.currencyCode == currencyCode) &&
            (identical(other.currency, currency) ||
                other.currency == currency));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, marketElementId, elementType,
      count, totalPrice, currencyCode, currency);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CartCopyWith<_$_Cart> get copyWith =>
      __$$_CartCopyWithImpl<_$_Cart>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_CartToJson(
      this,
    );
  }
}

abstract class _Cart implements Cart {
  const factory _Cart(
      {final String? marketElementId,
      final String? elementType,
      final int count,
      final double? totalPrice,
      final String? currencyCode,
      final String? currency}) = _$_Cart;

  factory _Cart.fromJson(Map<String, dynamic> json) = _$_Cart.fromJson;

  @override
  String? get marketElementId;
  @override
  String? get elementType;
  @override
  int get count;
  @override
  double? get totalPrice;
  @override
  String? get currencyCode;
  @override
  String? get currency;
  @override
  @JsonKey(ignore: true)
  _$$_CartCopyWith<_$_Cart> get copyWith => throw _privateConstructorUsedError;
}

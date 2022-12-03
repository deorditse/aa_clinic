// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'market_product_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

MarketProductModel _$MarketProductModelFromJson(Map<String, dynamic> json) {
  return _MarketProductModel.fromJson(json);
}

/// @nodoc
mixin _$MarketProductModel {
  String get id => throw _privateConstructorUsedError;
  String get creatorId => throw _privateConstructorUsedError; //Артикль продукта
  String? get sku => throw _privateConstructorUsedError;
  double? get priceIn => throw _privateConstructorUsedError;
  double? get price => throw _privateConstructorUsedError;
  String? get currency => throw _privateConstructorUsedError;
  String? get currencyCode => throw _privateConstructorUsedError;
  String? get title => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  int? get volume => throw _privateConstructorUsedError;
  String? get volumeUnits => throw _privateConstructorUsedError;
  String? get category => throw _privateConstructorUsedError;
  List<String?> get imagesFileIds => throw _privateConstructorUsedError;
  List<Availability?> get availability => throw _privateConstructorUsedError;
  String? get createdAt => throw _privateConstructorUsedError;
  String? get updatedAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MarketProductModelCopyWith<MarketProductModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MarketProductModelCopyWith<$Res> {
  factory $MarketProductModelCopyWith(
          MarketProductModel value, $Res Function(MarketProductModel) then) =
      _$MarketProductModelCopyWithImpl<$Res, MarketProductModel>;
  @useResult
  $Res call(
      {String id,
      String creatorId,
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
      List<String?> imagesFileIds,
      List<Availability?> availability,
      String? createdAt,
      String? updatedAt});
}

/// @nodoc
class _$MarketProductModelCopyWithImpl<$Res, $Val extends MarketProductModel>
    implements $MarketProductModelCopyWith<$Res> {
  _$MarketProductModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? creatorId = null,
    Object? sku = freezed,
    Object? priceIn = freezed,
    Object? price = freezed,
    Object? currency = freezed,
    Object? currencyCode = freezed,
    Object? title = freezed,
    Object? description = freezed,
    Object? volume = freezed,
    Object? volumeUnits = freezed,
    Object? category = freezed,
    Object? imagesFileIds = null,
    Object? availability = null,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      creatorId: null == creatorId
          ? _value.creatorId
          : creatorId // ignore: cast_nullable_to_non_nullable
              as String,
      sku: freezed == sku
          ? _value.sku
          : sku // ignore: cast_nullable_to_non_nullable
              as String?,
      priceIn: freezed == priceIn
          ? _value.priceIn
          : priceIn // ignore: cast_nullable_to_non_nullable
              as double?,
      price: freezed == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double?,
      currency: freezed == currency
          ? _value.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as String?,
      currencyCode: freezed == currencyCode
          ? _value.currencyCode
          : currencyCode // ignore: cast_nullable_to_non_nullable
              as String?,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      volume: freezed == volume
          ? _value.volume
          : volume // ignore: cast_nullable_to_non_nullable
              as int?,
      volumeUnits: freezed == volumeUnits
          ? _value.volumeUnits
          : volumeUnits // ignore: cast_nullable_to_non_nullable
              as String?,
      category: freezed == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String?,
      imagesFileIds: null == imagesFileIds
          ? _value.imagesFileIds
          : imagesFileIds // ignore: cast_nullable_to_non_nullable
              as List<String?>,
      availability: null == availability
          ? _value.availability
          : availability // ignore: cast_nullable_to_non_nullable
              as List<Availability?>,
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
abstract class _$$_MarketProductModelCopyWith<$Res>
    implements $MarketProductModelCopyWith<$Res> {
  factory _$$_MarketProductModelCopyWith(_$_MarketProductModel value,
          $Res Function(_$_MarketProductModel) then) =
      __$$_MarketProductModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String creatorId,
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
      List<String?> imagesFileIds,
      List<Availability?> availability,
      String? createdAt,
      String? updatedAt});
}

/// @nodoc
class __$$_MarketProductModelCopyWithImpl<$Res>
    extends _$MarketProductModelCopyWithImpl<$Res, _$_MarketProductModel>
    implements _$$_MarketProductModelCopyWith<$Res> {
  __$$_MarketProductModelCopyWithImpl(
      _$_MarketProductModel _value, $Res Function(_$_MarketProductModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? creatorId = null,
    Object? sku = freezed,
    Object? priceIn = freezed,
    Object? price = freezed,
    Object? currency = freezed,
    Object? currencyCode = freezed,
    Object? title = freezed,
    Object? description = freezed,
    Object? volume = freezed,
    Object? volumeUnits = freezed,
    Object? category = freezed,
    Object? imagesFileIds = null,
    Object? availability = null,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_$_MarketProductModel(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      creatorId: null == creatorId
          ? _value.creatorId
          : creatorId // ignore: cast_nullable_to_non_nullable
              as String,
      sku: freezed == sku
          ? _value.sku
          : sku // ignore: cast_nullable_to_non_nullable
              as String?,
      priceIn: freezed == priceIn
          ? _value.priceIn
          : priceIn // ignore: cast_nullable_to_non_nullable
              as double?,
      price: freezed == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double?,
      currency: freezed == currency
          ? _value.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as String?,
      currencyCode: freezed == currencyCode
          ? _value.currencyCode
          : currencyCode // ignore: cast_nullable_to_non_nullable
              as String?,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      volume: freezed == volume
          ? _value.volume
          : volume // ignore: cast_nullable_to_non_nullable
              as int?,
      volumeUnits: freezed == volumeUnits
          ? _value.volumeUnits
          : volumeUnits // ignore: cast_nullable_to_non_nullable
              as String?,
      category: freezed == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String?,
      imagesFileIds: null == imagesFileIds
          ? _value._imagesFileIds
          : imagesFileIds // ignore: cast_nullable_to_non_nullable
              as List<String?>,
      availability: null == availability
          ? _value._availability
          : availability // ignore: cast_nullable_to_non_nullable
              as List<Availability?>,
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
class _$_MarketProductModel implements _MarketProductModel {
  const _$_MarketProductModel(
      {required this.id,
      required this.creatorId,
      this.sku,
      this.priceIn,
      this.price,
      this.currency,
      this.currencyCode,
      this.title,
      this.description,
      this.volume,
      this.volumeUnits,
      this.category,
      final List<String?> imagesFileIds = const [],
      final List<Availability?> availability = const [],
      this.createdAt,
      this.updatedAt})
      : _imagesFileIds = imagesFileIds,
        _availability = availability;

  factory _$_MarketProductModel.fromJson(Map<String, dynamic> json) =>
      _$$_MarketProductModelFromJson(json);

  @override
  final String id;
  @override
  final String creatorId;
//Артикль продукта
  @override
  final String? sku;
  @override
  final double? priceIn;
  @override
  final double? price;
  @override
  final String? currency;
  @override
  final String? currencyCode;
  @override
  final String? title;
  @override
  final String? description;
  @override
  final int? volume;
  @override
  final String? volumeUnits;
  @override
  final String? category;
  final List<String?> _imagesFileIds;
  @override
  @JsonKey()
  List<String?> get imagesFileIds {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_imagesFileIds);
  }

  final List<Availability?> _availability;
  @override
  @JsonKey()
  List<Availability?> get availability {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_availability);
  }

  @override
  final String? createdAt;
  @override
  final String? updatedAt;

  @override
  String toString() {
    return 'MarketProductModel(id: $id, creatorId: $creatorId, sku: $sku, priceIn: $priceIn, price: $price, currency: $currency, currencyCode: $currencyCode, title: $title, description: $description, volume: $volume, volumeUnits: $volumeUnits, category: $category, imagesFileIds: $imagesFileIds, availability: $availability, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_MarketProductModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.creatorId, creatorId) ||
                other.creatorId == creatorId) &&
            (identical(other.sku, sku) || other.sku == sku) &&
            (identical(other.priceIn, priceIn) || other.priceIn == priceIn) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.currency, currency) ||
                other.currency == currency) &&
            (identical(other.currencyCode, currencyCode) ||
                other.currencyCode == currencyCode) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.volume, volume) || other.volume == volume) &&
            (identical(other.volumeUnits, volumeUnits) ||
                other.volumeUnits == volumeUnits) &&
            (identical(other.category, category) ||
                other.category == category) &&
            const DeepCollectionEquality()
                .equals(other._imagesFileIds, _imagesFileIds) &&
            const DeepCollectionEquality()
                .equals(other._availability, _availability) &&
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
      creatorId,
      sku,
      priceIn,
      price,
      currency,
      currencyCode,
      title,
      description,
      volume,
      volumeUnits,
      category,
      const DeepCollectionEquality().hash(_imagesFileIds),
      const DeepCollectionEquality().hash(_availability),
      createdAt,
      updatedAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_MarketProductModelCopyWith<_$_MarketProductModel> get copyWith =>
      __$$_MarketProductModelCopyWithImpl<_$_MarketProductModel>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_MarketProductModelToJson(
      this,
    );
  }
}

abstract class _MarketProductModel implements MarketProductModel {
  const factory _MarketProductModel(
      {required final String id,
      required final String creatorId,
      final String? sku,
      final double? priceIn,
      final double? price,
      final String? currency,
      final String? currencyCode,
      final String? title,
      final String? description,
      final int? volume,
      final String? volumeUnits,
      final String? category,
      final List<String?> imagesFileIds,
      final List<Availability?> availability,
      final String? createdAt,
      final String? updatedAt}) = _$_MarketProductModel;

  factory _MarketProductModel.fromJson(Map<String, dynamic> json) =
      _$_MarketProductModel.fromJson;

  @override
  String get id;
  @override
  String get creatorId;
  @override //Артикль продукта
  String? get sku;
  @override
  double? get priceIn;
  @override
  double? get price;
  @override
  String? get currency;
  @override
  String? get currencyCode;
  @override
  String? get title;
  @override
  String? get description;
  @override
  int? get volume;
  @override
  String? get volumeUnits;
  @override
  String? get category;
  @override
  List<String?> get imagesFileIds;
  @override
  List<Availability?> get availability;
  @override
  String? get createdAt;
  @override
  String? get updatedAt;
  @override
  @JsonKey(ignore: true)
  _$$_MarketProductModelCopyWith<_$_MarketProductModel> get copyWith =>
      throw _privateConstructorUsedError;
}

Availability _$AvailabilityFromJson(Map<String, dynamic> json) {
  return _Availability.fromJson(json);
}

/// @nodoc
mixin _$Availability {
  String? get country => throw _privateConstructorUsedError;
  String? get city => throw _privateConstructorUsedError;
  Map<dynamic, dynamic> get geolocation => throw _privateConstructorUsedError;
  String? get partnerId => throw _privateConstructorUsedError;
  int? get count => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AvailabilityCopyWith<Availability> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AvailabilityCopyWith<$Res> {
  factory $AvailabilityCopyWith(
          Availability value, $Res Function(Availability) then) =
      _$AvailabilityCopyWithImpl<$Res, Availability>;
  @useResult
  $Res call(
      {String? country,
      String? city,
      Map<dynamic, dynamic> geolocation,
      String? partnerId,
      int? count});
}

/// @nodoc
class _$AvailabilityCopyWithImpl<$Res, $Val extends Availability>
    implements $AvailabilityCopyWith<$Res> {
  _$AvailabilityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? country = freezed,
    Object? city = freezed,
    Object? geolocation = null,
    Object? partnerId = freezed,
    Object? count = freezed,
  }) {
    return _then(_value.copyWith(
      country: freezed == country
          ? _value.country
          : country // ignore: cast_nullable_to_non_nullable
              as String?,
      city: freezed == city
          ? _value.city
          : city // ignore: cast_nullable_to_non_nullable
              as String?,
      geolocation: null == geolocation
          ? _value.geolocation
          : geolocation // ignore: cast_nullable_to_non_nullable
              as Map<dynamic, dynamic>,
      partnerId: freezed == partnerId
          ? _value.partnerId
          : partnerId // ignore: cast_nullable_to_non_nullable
              as String?,
      count: freezed == count
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_AvailabilityCopyWith<$Res>
    implements $AvailabilityCopyWith<$Res> {
  factory _$$_AvailabilityCopyWith(
          _$_Availability value, $Res Function(_$_Availability) then) =
      __$$_AvailabilityCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? country,
      String? city,
      Map<dynamic, dynamic> geolocation,
      String? partnerId,
      int? count});
}

/// @nodoc
class __$$_AvailabilityCopyWithImpl<$Res>
    extends _$AvailabilityCopyWithImpl<$Res, _$_Availability>
    implements _$$_AvailabilityCopyWith<$Res> {
  __$$_AvailabilityCopyWithImpl(
      _$_Availability _value, $Res Function(_$_Availability) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? country = freezed,
    Object? city = freezed,
    Object? geolocation = null,
    Object? partnerId = freezed,
    Object? count = freezed,
  }) {
    return _then(_$_Availability(
      country: freezed == country
          ? _value.country
          : country // ignore: cast_nullable_to_non_nullable
              as String?,
      city: freezed == city
          ? _value.city
          : city // ignore: cast_nullable_to_non_nullable
              as String?,
      geolocation: null == geolocation
          ? _value._geolocation
          : geolocation // ignore: cast_nullable_to_non_nullable
              as Map<dynamic, dynamic>,
      partnerId: freezed == partnerId
          ? _value.partnerId
          : partnerId // ignore: cast_nullable_to_non_nullable
              as String?,
      count: freezed == count
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Availability implements _Availability {
  const _$_Availability(
      {this.country,
      this.city,
      final Map<dynamic, dynamic> geolocation = const {},
      this.partnerId,
      this.count})
      : _geolocation = geolocation;

  factory _$_Availability.fromJson(Map<String, dynamic> json) =>
      _$$_AvailabilityFromJson(json);

  @override
  final String? country;
  @override
  final String? city;
  final Map<dynamic, dynamic> _geolocation;
  @override
  @JsonKey()
  Map<dynamic, dynamic> get geolocation {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_geolocation);
  }

  @override
  final String? partnerId;
  @override
  final int? count;

  @override
  String toString() {
    return 'Availability(country: $country, city: $city, geolocation: $geolocation, partnerId: $partnerId, count: $count)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Availability &&
            (identical(other.country, country) || other.country == country) &&
            (identical(other.city, city) || other.city == city) &&
            const DeepCollectionEquality()
                .equals(other._geolocation, _geolocation) &&
            (identical(other.partnerId, partnerId) ||
                other.partnerId == partnerId) &&
            (identical(other.count, count) || other.count == count));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, country, city,
      const DeepCollectionEquality().hash(_geolocation), partnerId, count);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AvailabilityCopyWith<_$_Availability> get copyWith =>
      __$$_AvailabilityCopyWithImpl<_$_Availability>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_AvailabilityToJson(
      this,
    );
  }
}

abstract class _Availability implements Availability {
  const factory _Availability(
      {final String? country,
      final String? city,
      final Map<dynamic, dynamic> geolocation,
      final String? partnerId,
      final int? count}) = _$_Availability;

  factory _Availability.fromJson(Map<String, dynamic> json) =
      _$_Availability.fromJson;

  @override
  String? get country;
  @override
  String? get city;
  @override
  Map<dynamic, dynamic> get geolocation;
  @override
  String? get partnerId;
  @override
  int? get count;
  @override
  @JsonKey(ignore: true)
  _$$_AvailabilityCopyWith<_$_Availability> get copyWith =>
      throw _privateConstructorUsedError;
}

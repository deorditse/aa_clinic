// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'calendar_nutri_meals_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

NutriMealsModel _$NutriMealsModelFromJson(Map<String, dynamic> json) {
  return _NutriMealsModel.fromJson(json);
}

/// @nodoc
mixin _$NutriMealsModel {
  String get id => throw _privateConstructorUsedError;
  String get creatorId => throw _privateConstructorUsedError;
  String get userId => throw _privateConstructorUsedError;
  String get title =>
      throw _privateConstructorUsedError; //array with dishes objects
  List<NutriDishModel?> get dishes => throw _privateConstructorUsedError;
  String? get typeId => throw _privateConstructorUsedError;
  Map<dynamic, dynamic> get additionalData =>
      throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  String? get comment => throw _privateConstructorUsedError;
  String? get startedAt => throw _privateConstructorUsedError;
  String? get finishedAt => throw _privateConstructorUsedError;
  int get fulfillment => throw _privateConstructorUsedError;
  String? get createdAt => throw _privateConstructorUsedError;
  String? get updatedAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $NutriMealsModelCopyWith<NutriMealsModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NutriMealsModelCopyWith<$Res> {
  factory $NutriMealsModelCopyWith(
          NutriMealsModel value, $Res Function(NutriMealsModel) then) =
      _$NutriMealsModelCopyWithImpl<$Res, NutriMealsModel>;
  @useResult
  $Res call(
      {String id,
      String creatorId,
      String userId,
      String title,
      List<NutriDishModel?> dishes,
      String? typeId,
      Map<dynamic, dynamic> additionalData,
      String? description,
      String? comment,
      String? startedAt,
      String? finishedAt,
      int fulfillment,
      String? createdAt,
      String? updatedAt});
}

/// @nodoc
class _$NutriMealsModelCopyWithImpl<$Res, $Val extends NutriMealsModel>
    implements $NutriMealsModelCopyWith<$Res> {
  _$NutriMealsModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? creatorId = null,
    Object? userId = null,
    Object? title = null,
    Object? dishes = null,
    Object? typeId = freezed,
    Object? additionalData = null,
    Object? description = freezed,
    Object? comment = freezed,
    Object? startedAt = freezed,
    Object? finishedAt = freezed,
    Object? fulfillment = null,
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
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      dishes: null == dishes
          ? _value.dishes
          : dishes // ignore: cast_nullable_to_non_nullable
              as List<NutriDishModel?>,
      typeId: freezed == typeId
          ? _value.typeId
          : typeId // ignore: cast_nullable_to_non_nullable
              as String?,
      additionalData: null == additionalData
          ? _value.additionalData
          : additionalData // ignore: cast_nullable_to_non_nullable
              as Map<dynamic, dynamic>,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      comment: freezed == comment
          ? _value.comment
          : comment // ignore: cast_nullable_to_non_nullable
              as String?,
      startedAt: freezed == startedAt
          ? _value.startedAt
          : startedAt // ignore: cast_nullable_to_non_nullable
              as String?,
      finishedAt: freezed == finishedAt
          ? _value.finishedAt
          : finishedAt // ignore: cast_nullable_to_non_nullable
              as String?,
      fulfillment: null == fulfillment
          ? _value.fulfillment
          : fulfillment // ignore: cast_nullable_to_non_nullable
              as int,
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
abstract class _$$_NutriMealsModelCopyWith<$Res>
    implements $NutriMealsModelCopyWith<$Res> {
  factory _$$_NutriMealsModelCopyWith(
          _$_NutriMealsModel value, $Res Function(_$_NutriMealsModel) then) =
      __$$_NutriMealsModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String creatorId,
      String userId,
      String title,
      List<NutriDishModel?> dishes,
      String? typeId,
      Map<dynamic, dynamic> additionalData,
      String? description,
      String? comment,
      String? startedAt,
      String? finishedAt,
      int fulfillment,
      String? createdAt,
      String? updatedAt});
}

/// @nodoc
class __$$_NutriMealsModelCopyWithImpl<$Res>
    extends _$NutriMealsModelCopyWithImpl<$Res, _$_NutriMealsModel>
    implements _$$_NutriMealsModelCopyWith<$Res> {
  __$$_NutriMealsModelCopyWithImpl(
      _$_NutriMealsModel _value, $Res Function(_$_NutriMealsModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? creatorId = null,
    Object? userId = null,
    Object? title = null,
    Object? dishes = null,
    Object? typeId = freezed,
    Object? additionalData = null,
    Object? description = freezed,
    Object? comment = freezed,
    Object? startedAt = freezed,
    Object? finishedAt = freezed,
    Object? fulfillment = null,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_$_NutriMealsModel(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      creatorId: null == creatorId
          ? _value.creatorId
          : creatorId // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      dishes: null == dishes
          ? _value._dishes
          : dishes // ignore: cast_nullable_to_non_nullable
              as List<NutriDishModel?>,
      typeId: freezed == typeId
          ? _value.typeId
          : typeId // ignore: cast_nullable_to_non_nullable
              as String?,
      additionalData: null == additionalData
          ? _value._additionalData
          : additionalData // ignore: cast_nullable_to_non_nullable
              as Map<dynamic, dynamic>,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      comment: freezed == comment
          ? _value.comment
          : comment // ignore: cast_nullable_to_non_nullable
              as String?,
      startedAt: freezed == startedAt
          ? _value.startedAt
          : startedAt // ignore: cast_nullable_to_non_nullable
              as String?,
      finishedAt: freezed == finishedAt
          ? _value.finishedAt
          : finishedAt // ignore: cast_nullable_to_non_nullable
              as String?,
      fulfillment: null == fulfillment
          ? _value.fulfillment
          : fulfillment // ignore: cast_nullable_to_non_nullable
              as int,
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
class _$_NutriMealsModel implements _NutriMealsModel {
  const _$_NutriMealsModel(
      {required this.id,
      required this.creatorId,
      required this.userId,
      required this.title,
      final List<NutriDishModel?> dishes = const [],
      this.typeId,
      final Map<dynamic, dynamic> additionalData = const {},
      this.description,
      this.comment,
      this.startedAt,
      this.finishedAt,
      this.fulfillment = 0,
      this.createdAt,
      this.updatedAt})
      : _dishes = dishes,
        _additionalData = additionalData;

  factory _$_NutriMealsModel.fromJson(Map<String, dynamic> json) =>
      _$$_NutriMealsModelFromJson(json);

  @override
  final String id;
  @override
  final String creatorId;
  @override
  final String userId;
  @override
  final String title;
//array with dishes objects
  final List<NutriDishModel?> _dishes;
//array with dishes objects
  @override
  @JsonKey()
  List<NutriDishModel?> get dishes {
    if (_dishes is EqualUnmodifiableListView) return _dishes;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_dishes);
  }

  @override
  final String? typeId;
  final Map<dynamic, dynamic> _additionalData;
  @override
  @JsonKey()
  Map<dynamic, dynamic> get additionalData {
    if (_additionalData is EqualUnmodifiableMapView) return _additionalData;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_additionalData);
  }

  @override
  final String? description;
  @override
  final String? comment;
  @override
  final String? startedAt;
  @override
  final String? finishedAt;
  @override
  @JsonKey()
  final int fulfillment;
  @override
  final String? createdAt;
  @override
  final String? updatedAt;

  @override
  String toString() {
    return 'NutriMealsModel(id: $id, creatorId: $creatorId, userId: $userId, title: $title, dishes: $dishes, typeId: $typeId, additionalData: $additionalData, description: $description, comment: $comment, startedAt: $startedAt, finishedAt: $finishedAt, fulfillment: $fulfillment, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_NutriMealsModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.creatorId, creatorId) ||
                other.creatorId == creatorId) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.title, title) || other.title == title) &&
            const DeepCollectionEquality().equals(other._dishes, _dishes) &&
            (identical(other.typeId, typeId) || other.typeId == typeId) &&
            const DeepCollectionEquality()
                .equals(other._additionalData, _additionalData) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.comment, comment) || other.comment == comment) &&
            (identical(other.startedAt, startedAt) ||
                other.startedAt == startedAt) &&
            (identical(other.finishedAt, finishedAt) ||
                other.finishedAt == finishedAt) &&
            (identical(other.fulfillment, fulfillment) ||
                other.fulfillment == fulfillment) &&
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
      userId,
      title,
      const DeepCollectionEquality().hash(_dishes),
      typeId,
      const DeepCollectionEquality().hash(_additionalData),
      description,
      comment,
      startedAt,
      finishedAt,
      fulfillment,
      createdAt,
      updatedAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_NutriMealsModelCopyWith<_$_NutriMealsModel> get copyWith =>
      __$$_NutriMealsModelCopyWithImpl<_$_NutriMealsModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_NutriMealsModelToJson(
      this,
    );
  }
}

abstract class _NutriMealsModel implements NutriMealsModel {
  const factory _NutriMealsModel(
      {required final String id,
      required final String creatorId,
      required final String userId,
      required final String title,
      final List<NutriDishModel?> dishes,
      final String? typeId,
      final Map<dynamic, dynamic> additionalData,
      final String? description,
      final String? comment,
      final String? startedAt,
      final String? finishedAt,
      final int fulfillment,
      final String? createdAt,
      final String? updatedAt}) = _$_NutriMealsModel;

  factory _NutriMealsModel.fromJson(Map<String, dynamic> json) =
      _$_NutriMealsModel.fromJson;

  @override
  String get id;
  @override
  String get creatorId;
  @override
  String get userId;
  @override
  String get title;
  @override //array with dishes objects
  List<NutriDishModel?> get dishes;
  @override
  String? get typeId;
  @override
  Map<dynamic, dynamic> get additionalData;
  @override
  String? get description;
  @override
  String? get comment;
  @override
  String? get startedAt;
  @override
  String? get finishedAt;
  @override
  int get fulfillment;
  @override
  String? get createdAt;
  @override
  String? get updatedAt;
  @override
  @JsonKey(ignore: true)
  _$$_NutriMealsModelCopyWith<_$_NutriMealsModel> get copyWith =>
      throw _privateConstructorUsedError;
}

NutriDishModel _$NutriDishModelFromJson(Map<String, dynamic> json) {
  return _NutriDishModel.fromJson(json);
}

/// @nodoc
mixin _$NutriDishModel {
  File? get file => throw _privateConstructorUsedError;
  set file(File? value) =>
      throw _privateConstructorUsedError; //для себя чтобы добавить новое событие приема пищи
  String? get title =>
      throw _privateConstructorUsedError; //для себя чтобы добавить новое событие приема пищи
  set title(String? value) => throw _privateConstructorUsedError;
  String? get image => throw _privateConstructorUsedError;
  set image(String? value) => throw _privateConstructorUsedError;
  String? get lifeImage => throw _privateConstructorUsedError;
  set lifeImage(String? value) => throw _privateConstructorUsedError;
  String? get thumbnail => throw _privateConstructorUsedError;
  set thumbnail(String? value) => throw _privateConstructorUsedError;
  List<String?> get tags => throw _privateConstructorUsedError;
  set tags(List<String?> value) => throw _privateConstructorUsedError;
  String? get typeId => throw _privateConstructorUsedError;
  set typeId(String? value) => throw _privateConstructorUsedError;
  int? get kcal => throw _privateConstructorUsedError;
  set kcal(int? value) => throw _privateConstructorUsedError;
  int? get mass => throw _privateConstructorUsedError;
  set mass(int? value) => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  set description(String? value) => throw _privateConstructorUsedError;
  String? get comment => throw _privateConstructorUsedError;
  set comment(String? value) => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $NutriDishModelCopyWith<NutriDishModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NutriDishModelCopyWith<$Res> {
  factory $NutriDishModelCopyWith(
          NutriDishModel value, $Res Function(NutriDishModel) then) =
      _$NutriDishModelCopyWithImpl<$Res, NutriDishModel>;
  @useResult
  $Res call(
      {File? file,
      String? title,
      String? image,
      String? lifeImage,
      String? thumbnail,
      List<String?> tags,
      String? typeId,
      int? kcal,
      int? mass,
      String? description,
      String? comment});
}

/// @nodoc
class _$NutriDishModelCopyWithImpl<$Res, $Val extends NutriDishModel>
    implements $NutriDishModelCopyWith<$Res> {
  _$NutriDishModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? file = freezed,
    Object? title = freezed,
    Object? image = freezed,
    Object? lifeImage = freezed,
    Object? thumbnail = freezed,
    Object? tags = null,
    Object? typeId = freezed,
    Object? kcal = freezed,
    Object? mass = freezed,
    Object? description = freezed,
    Object? comment = freezed,
  }) {
    return _then(_value.copyWith(
      file: freezed == file
          ? _value.file
          : file // ignore: cast_nullable_to_non_nullable
              as File?,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      image: freezed == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String?,
      lifeImage: freezed == lifeImage
          ? _value.lifeImage
          : lifeImage // ignore: cast_nullable_to_non_nullable
              as String?,
      thumbnail: freezed == thumbnail
          ? _value.thumbnail
          : thumbnail // ignore: cast_nullable_to_non_nullable
              as String?,
      tags: null == tags
          ? _value.tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<String?>,
      typeId: freezed == typeId
          ? _value.typeId
          : typeId // ignore: cast_nullable_to_non_nullable
              as String?,
      kcal: freezed == kcal
          ? _value.kcal
          : kcal // ignore: cast_nullable_to_non_nullable
              as int?,
      mass: freezed == mass
          ? _value.mass
          : mass // ignore: cast_nullable_to_non_nullable
              as int?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      comment: freezed == comment
          ? _value.comment
          : comment // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_NutriDishModelCopyWith<$Res>
    implements $NutriDishModelCopyWith<$Res> {
  factory _$$_NutriDishModelCopyWith(
          _$_NutriDishModel value, $Res Function(_$_NutriDishModel) then) =
      __$$_NutriDishModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {File? file,
      String? title,
      String? image,
      String? lifeImage,
      String? thumbnail,
      List<String?> tags,
      String? typeId,
      int? kcal,
      int? mass,
      String? description,
      String? comment});
}

/// @nodoc
class __$$_NutriDishModelCopyWithImpl<$Res>
    extends _$NutriDishModelCopyWithImpl<$Res, _$_NutriDishModel>
    implements _$$_NutriDishModelCopyWith<$Res> {
  __$$_NutriDishModelCopyWithImpl(
      _$_NutriDishModel _value, $Res Function(_$_NutriDishModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? file = freezed,
    Object? title = freezed,
    Object? image = freezed,
    Object? lifeImage = freezed,
    Object? thumbnail = freezed,
    Object? tags = null,
    Object? typeId = freezed,
    Object? kcal = freezed,
    Object? mass = freezed,
    Object? description = freezed,
    Object? comment = freezed,
  }) {
    return _then(_$_NutriDishModel(
      file: freezed == file
          ? _value.file
          : file // ignore: cast_nullable_to_non_nullable
              as File?,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      image: freezed == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String?,
      lifeImage: freezed == lifeImage
          ? _value.lifeImage
          : lifeImage // ignore: cast_nullable_to_non_nullable
              as String?,
      thumbnail: freezed == thumbnail
          ? _value.thumbnail
          : thumbnail // ignore: cast_nullable_to_non_nullable
              as String?,
      tags: null == tags
          ? _value.tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<String?>,
      typeId: freezed == typeId
          ? _value.typeId
          : typeId // ignore: cast_nullable_to_non_nullable
              as String?,
      kcal: freezed == kcal
          ? _value.kcal
          : kcal // ignore: cast_nullable_to_non_nullable
              as int?,
      mass: freezed == mass
          ? _value.mass
          : mass // ignore: cast_nullable_to_non_nullable
              as int?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      comment: freezed == comment
          ? _value.comment
          : comment // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_NutriDishModel implements _NutriDishModel {
  _$_NutriDishModel(
      {this.file,
      this.title,
      this.image,
      this.lifeImage,
      this.thumbnail,
      this.tags = const [],
      this.typeId,
      this.kcal,
      this.mass,
      this.description,
      this.comment});

  factory _$_NutriDishModel.fromJson(Map<String, dynamic> json) =>
      _$$_NutriDishModelFromJson(json);

  @override
  File? file;
//для себя чтобы добавить новое событие приема пищи
  @override
  String? title;
  @override
  String? image;
  @override
  String? lifeImage;
  @override
  String? thumbnail;
  @override
  @JsonKey()
  List<String?> tags;
  @override
  String? typeId;
  @override
  int? kcal;
  @override
  int? mass;
  @override
  String? description;
  @override
  String? comment;

  @override
  String toString() {
    return 'NutriDishModel(file: $file, title: $title, image: $image, lifeImage: $lifeImage, thumbnail: $thumbnail, tags: $tags, typeId: $typeId, kcal: $kcal, mass: $mass, description: $description, comment: $comment)';
  }

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_NutriDishModelCopyWith<_$_NutriDishModel> get copyWith =>
      __$$_NutriDishModelCopyWithImpl<_$_NutriDishModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_NutriDishModelToJson(
      this,
    );
  }
}

abstract class _NutriDishModel implements NutriDishModel {
  factory _NutriDishModel(
      {File? file,
      String? title,
      String? image,
      String? lifeImage,
      String? thumbnail,
      List<String?> tags,
      String? typeId,
      int? kcal,
      int? mass,
      String? description,
      String? comment}) = _$_NutriDishModel;

  factory _NutriDishModel.fromJson(Map<String, dynamic> json) =
      _$_NutriDishModel.fromJson;

  @override
  File? get file;
  set file(File? value);
  @override //для себя чтобы добавить новое событие приема пищи
  String? get title; //для себя чтобы добавить новое событие приема пищи
  set title(String? value);
  @override
  String? get image;
  set image(String? value);
  @override
  String? get lifeImage;
  set lifeImage(String? value);
  @override
  String? get thumbnail;
  set thumbnail(String? value);
  @override
  List<String?> get tags;
  set tags(List<String?> value);
  @override
  String? get typeId;
  set typeId(String? value);
  @override
  int? get kcal;
  set kcal(int? value);
  @override
  int? get mass;
  set mass(int? value);
  @override
  String? get description;
  set description(String? value);
  @override
  String? get comment;
  set comment(String? value);
  @override
  @JsonKey(ignore: true)
  _$$_NutriDishModelCopyWith<_$_NutriDishModel> get copyWith =>
      throw _privateConstructorUsedError;
}

// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sneaker_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

SneakerModel _$SneakerModelFromJson(Map<String, dynamic> json) {
  return _SneakerModel.fromJson(json);
}

/// @nodoc
mixin _$SneakerModel {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get brand => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  double get price => throw _privateConstructorUsedError;
  String get imageUrl => throw _privateConstructorUsedError;
  List<int> get sizes => throw _privateConstructorUsedError;
  bool get isFavorite => throw _privateConstructorUsedError;

  /// Serializes this SneakerModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SneakerModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SneakerModelCopyWith<SneakerModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SneakerModelCopyWith<$Res> {
  factory $SneakerModelCopyWith(
    SneakerModel value,
    $Res Function(SneakerModel) then,
  ) = _$SneakerModelCopyWithImpl<$Res, SneakerModel>;
  @useResult
  $Res call({
    String id,
    String name,
    String brand,
    String description,
    double price,
    String imageUrl,
    List<int> sizes,
    bool isFavorite,
  });
}

/// @nodoc
class _$SneakerModelCopyWithImpl<$Res, $Val extends SneakerModel>
    implements $SneakerModelCopyWith<$Res> {
  _$SneakerModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SneakerModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? brand = null,
    Object? description = null,
    Object? price = null,
    Object? imageUrl = null,
    Object? sizes = null,
    Object? isFavorite = null,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String,
            name: null == name
                ? _value.name
                : name // ignore: cast_nullable_to_non_nullable
                      as String,
            brand: null == brand
                ? _value.brand
                : brand // ignore: cast_nullable_to_non_nullable
                      as String,
            description: null == description
                ? _value.description
                : description // ignore: cast_nullable_to_non_nullable
                      as String,
            price: null == price
                ? _value.price
                : price // ignore: cast_nullable_to_non_nullable
                      as double,
            imageUrl: null == imageUrl
                ? _value.imageUrl
                : imageUrl // ignore: cast_nullable_to_non_nullable
                      as String,
            sizes: null == sizes
                ? _value.sizes
                : sizes // ignore: cast_nullable_to_non_nullable
                      as List<int>,
            isFavorite: null == isFavorite
                ? _value.isFavorite
                : isFavorite // ignore: cast_nullable_to_non_nullable
                      as bool,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$SneakerModelImplCopyWith<$Res>
    implements $SneakerModelCopyWith<$Res> {
  factory _$$SneakerModelImplCopyWith(
    _$SneakerModelImpl value,
    $Res Function(_$SneakerModelImpl) then,
  ) = __$$SneakerModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    String name,
    String brand,
    String description,
    double price,
    String imageUrl,
    List<int> sizes,
    bool isFavorite,
  });
}

/// @nodoc
class __$$SneakerModelImplCopyWithImpl<$Res>
    extends _$SneakerModelCopyWithImpl<$Res, _$SneakerModelImpl>
    implements _$$SneakerModelImplCopyWith<$Res> {
  __$$SneakerModelImplCopyWithImpl(
    _$SneakerModelImpl _value,
    $Res Function(_$SneakerModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of SneakerModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? brand = null,
    Object? description = null,
    Object? price = null,
    Object? imageUrl = null,
    Object? sizes = null,
    Object? isFavorite = null,
  }) {
    return _then(
      _$SneakerModelImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        name: null == name
            ? _value.name
            : name // ignore: cast_nullable_to_non_nullable
                  as String,
        brand: null == brand
            ? _value.brand
            : brand // ignore: cast_nullable_to_non_nullable
                  as String,
        description: null == description
            ? _value.description
            : description // ignore: cast_nullable_to_non_nullable
                  as String,
        price: null == price
            ? _value.price
            : price // ignore: cast_nullable_to_non_nullable
                  as double,
        imageUrl: null == imageUrl
            ? _value.imageUrl
            : imageUrl // ignore: cast_nullable_to_non_nullable
                  as String,
        sizes: null == sizes
            ? _value._sizes
            : sizes // ignore: cast_nullable_to_non_nullable
                  as List<int>,
        isFavorite: null == isFavorite
            ? _value.isFavorite
            : isFavorite // ignore: cast_nullable_to_non_nullable
                  as bool,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$SneakerModelImpl extends _SneakerModel {
  const _$SneakerModelImpl({
    required this.id,
    required this.name,
    required this.brand,
    required this.description,
    required this.price,
    required this.imageUrl,
    required final List<int> sizes,
    this.isFavorite = false,
  }) : _sizes = sizes,
       super._();

  factory _$SneakerModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$SneakerModelImplFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final String brand;
  @override
  final String description;
  @override
  final double price;
  @override
  final String imageUrl;
  final List<int> _sizes;
  @override
  List<int> get sizes {
    if (_sizes is EqualUnmodifiableListView) return _sizes;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_sizes);
  }

  @override
  @JsonKey()
  final bool isFavorite;

  @override
  String toString() {
    return 'SneakerModel(id: $id, name: $name, brand: $brand, description: $description, price: $price, imageUrl: $imageUrl, sizes: $sizes, isFavorite: $isFavorite)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SneakerModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.brand, brand) || other.brand == brand) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl) &&
            const DeepCollectionEquality().equals(other._sizes, _sizes) &&
            (identical(other.isFavorite, isFavorite) ||
                other.isFavorite == isFavorite));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    name,
    brand,
    description,
    price,
    imageUrl,
    const DeepCollectionEquality().hash(_sizes),
    isFavorite,
  );

  /// Create a copy of SneakerModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SneakerModelImplCopyWith<_$SneakerModelImpl> get copyWith =>
      __$$SneakerModelImplCopyWithImpl<_$SneakerModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SneakerModelImplToJson(this);
  }
}

abstract class _SneakerModel extends SneakerModel {
  const factory _SneakerModel({
    required final String id,
    required final String name,
    required final String brand,
    required final String description,
    required final double price,
    required final String imageUrl,
    required final List<int> sizes,
    final bool isFavorite,
  }) = _$SneakerModelImpl;
  const _SneakerModel._() : super._();

  factory _SneakerModel.fromJson(Map<String, dynamic> json) =
      _$SneakerModelImpl.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  String get brand;
  @override
  String get description;
  @override
  double get price;
  @override
  String get imageUrl;
  @override
  List<int> get sizes;
  @override
  bool get isFavorite;

  /// Create a copy of SneakerModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SneakerModelImplCopyWith<_$SneakerModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

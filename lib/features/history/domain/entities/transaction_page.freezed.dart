// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'transaction_page.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$TransactionCursor {
  DateTime get createdAt => throw _privateConstructorUsedError;
  String get documentId => throw _privateConstructorUsedError;

  /// Create a copy of TransactionCursor
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TransactionCursorCopyWith<TransactionCursor> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TransactionCursorCopyWith<$Res> {
  factory $TransactionCursorCopyWith(
          TransactionCursor value, $Res Function(TransactionCursor) then) =
      _$TransactionCursorCopyWithImpl<$Res, TransactionCursor>;
  @useResult
  $Res call({DateTime createdAt, String documentId});
}

/// @nodoc
class _$TransactionCursorCopyWithImpl<$Res, $Val extends TransactionCursor>
    implements $TransactionCursorCopyWith<$Res> {
  _$TransactionCursorCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TransactionCursor
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? createdAt = null,
    Object? documentId = null,
  }) {
    return _then(_value.copyWith(
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      documentId: null == documentId
          ? _value.documentId
          : documentId // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TransactionCursorImplCopyWith<$Res>
    implements $TransactionCursorCopyWith<$Res> {
  factory _$$TransactionCursorImplCopyWith(_$TransactionCursorImpl value,
          $Res Function(_$TransactionCursorImpl) then) =
      __$$TransactionCursorImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({DateTime createdAt, String documentId});
}

/// @nodoc
class __$$TransactionCursorImplCopyWithImpl<$Res>
    extends _$TransactionCursorCopyWithImpl<$Res, _$TransactionCursorImpl>
    implements _$$TransactionCursorImplCopyWith<$Res> {
  __$$TransactionCursorImplCopyWithImpl(_$TransactionCursorImpl _value,
      $Res Function(_$TransactionCursorImpl) _then)
      : super(_value, _then);

  /// Create a copy of TransactionCursor
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? createdAt = null,
    Object? documentId = null,
  }) {
    return _then(_$TransactionCursorImpl(
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      documentId: null == documentId
          ? _value.documentId
          : documentId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$TransactionCursorImpl implements _TransactionCursor {
  const _$TransactionCursorImpl(
      {required this.createdAt, required this.documentId});

  @override
  final DateTime createdAt;
  @override
  final String documentId;

  @override
  String toString() {
    return 'TransactionCursor(createdAt: $createdAt, documentId: $documentId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TransactionCursorImpl &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.documentId, documentId) ||
                other.documentId == documentId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, createdAt, documentId);

  /// Create a copy of TransactionCursor
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TransactionCursorImplCopyWith<_$TransactionCursorImpl> get copyWith =>
      __$$TransactionCursorImplCopyWithImpl<_$TransactionCursorImpl>(
          this, _$identity);
}

abstract class _TransactionCursor implements TransactionCursor {
  const factory _TransactionCursor(
      {required final DateTime createdAt,
      required final String documentId}) = _$TransactionCursorImpl;

  @override
  DateTime get createdAt;
  @override
  String get documentId;

  /// Create a copy of TransactionCursor
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TransactionCursorImplCopyWith<_$TransactionCursorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$TransactionPage {
  List<Transaction> get items => throw _privateConstructorUsedError;
  TransactionCursor? get nextCursor => throw _privateConstructorUsedError;
  bool get hasMore => throw _privateConstructorUsedError;

  /// Create a copy of TransactionPage
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TransactionPageCopyWith<TransactionPage> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TransactionPageCopyWith<$Res> {
  factory $TransactionPageCopyWith(
          TransactionPage value, $Res Function(TransactionPage) then) =
      _$TransactionPageCopyWithImpl<$Res, TransactionPage>;
  @useResult
  $Res call(
      {List<Transaction> items, TransactionCursor? nextCursor, bool hasMore});

  $TransactionCursorCopyWith<$Res>? get nextCursor;
}

/// @nodoc
class _$TransactionPageCopyWithImpl<$Res, $Val extends TransactionPage>
    implements $TransactionPageCopyWith<$Res> {
  _$TransactionPageCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TransactionPage
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? items = null,
    Object? nextCursor = freezed,
    Object? hasMore = null,
  }) {
    return _then(_value.copyWith(
      items: null == items
          ? _value.items
          : items // ignore: cast_nullable_to_non_nullable
              as List<Transaction>,
      nextCursor: freezed == nextCursor
          ? _value.nextCursor
          : nextCursor // ignore: cast_nullable_to_non_nullable
              as TransactionCursor?,
      hasMore: null == hasMore
          ? _value.hasMore
          : hasMore // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }

  /// Create a copy of TransactionPage
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $TransactionCursorCopyWith<$Res>? get nextCursor {
    if (_value.nextCursor == null) {
      return null;
    }

    return $TransactionCursorCopyWith<$Res>(_value.nextCursor!, (value) {
      return _then(_value.copyWith(nextCursor: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$TransactionPageImplCopyWith<$Res>
    implements $TransactionPageCopyWith<$Res> {
  factory _$$TransactionPageImplCopyWith(_$TransactionPageImpl value,
          $Res Function(_$TransactionPageImpl) then) =
      __$$TransactionPageImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<Transaction> items, TransactionCursor? nextCursor, bool hasMore});

  @override
  $TransactionCursorCopyWith<$Res>? get nextCursor;
}

/// @nodoc
class __$$TransactionPageImplCopyWithImpl<$Res>
    extends _$TransactionPageCopyWithImpl<$Res, _$TransactionPageImpl>
    implements _$$TransactionPageImplCopyWith<$Res> {
  __$$TransactionPageImplCopyWithImpl(
      _$TransactionPageImpl _value, $Res Function(_$TransactionPageImpl) _then)
      : super(_value, _then);

  /// Create a copy of TransactionPage
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? items = null,
    Object? nextCursor = freezed,
    Object? hasMore = null,
  }) {
    return _then(_$TransactionPageImpl(
      items: null == items
          ? _value._items
          : items // ignore: cast_nullable_to_non_nullable
              as List<Transaction>,
      nextCursor: freezed == nextCursor
          ? _value.nextCursor
          : nextCursor // ignore: cast_nullable_to_non_nullable
              as TransactionCursor?,
      hasMore: null == hasMore
          ? _value.hasMore
          : hasMore // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$TransactionPageImpl implements _TransactionPage {
  const _$TransactionPageImpl(
      {final List<Transaction> items = const <Transaction>[],
      this.nextCursor,
      this.hasMore = false})
      : _items = items;

  final List<Transaction> _items;
  @override
  @JsonKey()
  List<Transaction> get items {
    if (_items is EqualUnmodifiableListView) return _items;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_items);
  }

  @override
  final TransactionCursor? nextCursor;
  @override
  @JsonKey()
  final bool hasMore;

  @override
  String toString() {
    return 'TransactionPage(items: $items, nextCursor: $nextCursor, hasMore: $hasMore)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TransactionPageImpl &&
            const DeepCollectionEquality().equals(other._items, _items) &&
            (identical(other.nextCursor, nextCursor) ||
                other.nextCursor == nextCursor) &&
            (identical(other.hasMore, hasMore) || other.hasMore == hasMore));
  }

  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(_items), nextCursor, hasMore);

  /// Create a copy of TransactionPage
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TransactionPageImplCopyWith<_$TransactionPageImpl> get copyWith =>
      __$$TransactionPageImplCopyWithImpl<_$TransactionPageImpl>(
          this, _$identity);
}

abstract class _TransactionPage implements TransactionPage {
  const factory _TransactionPage(
      {final List<Transaction> items,
      final TransactionCursor? nextCursor,
      final bool hasMore}) = _$TransactionPageImpl;

  @override
  List<Transaction> get items;
  @override
  TransactionCursor? get nextCursor;
  @override
  bool get hasMore;

  /// Create a copy of TransactionPage
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TransactionPageImplCopyWith<_$TransactionPageImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

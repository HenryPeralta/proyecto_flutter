// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'transfer_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$TransferRequest {
  String get userId => throw _privateConstructorUsedError;
  String get sourceAccount => throw _privateConstructorUsedError;
  String get destinationAccount => throw _privateConstructorUsedError;
  String get transferType => throw _privateConstructorUsedError;
  int get amountInCents => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  String get currency => throw _privateConstructorUsedError;

  /// Create a copy of TransferRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TransferRequestCopyWith<TransferRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TransferRequestCopyWith<$Res> {
  factory $TransferRequestCopyWith(
          TransferRequest value, $Res Function(TransferRequest) then) =
      _$TransferRequestCopyWithImpl<$Res, TransferRequest>;
  @useResult
  $Res call(
      {String userId,
      String sourceAccount,
      String destinationAccount,
      String transferType,
      int amountInCents,
      String description,
      String currency});
}

/// @nodoc
class _$TransferRequestCopyWithImpl<$Res, $Val extends TransferRequest>
    implements $TransferRequestCopyWith<$Res> {
  _$TransferRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TransferRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
    Object? sourceAccount = null,
    Object? destinationAccount = null,
    Object? transferType = null,
    Object? amountInCents = null,
    Object? description = null,
    Object? currency = null,
  }) {
    return _then(_value.copyWith(
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      sourceAccount: null == sourceAccount
          ? _value.sourceAccount
          : sourceAccount // ignore: cast_nullable_to_non_nullable
              as String,
      destinationAccount: null == destinationAccount
          ? _value.destinationAccount
          : destinationAccount // ignore: cast_nullable_to_non_nullable
              as String,
      transferType: null == transferType
          ? _value.transferType
          : transferType // ignore: cast_nullable_to_non_nullable
              as String,
      amountInCents: null == amountInCents
          ? _value.amountInCents
          : amountInCents // ignore: cast_nullable_to_non_nullable
              as int,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      currency: null == currency
          ? _value.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TransferRequestImplCopyWith<$Res>
    implements $TransferRequestCopyWith<$Res> {
  factory _$$TransferRequestImplCopyWith(_$TransferRequestImpl value,
          $Res Function(_$TransferRequestImpl) then) =
      __$$TransferRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String userId,
      String sourceAccount,
      String destinationAccount,
      String transferType,
      int amountInCents,
      String description,
      String currency});
}

/// @nodoc
class __$$TransferRequestImplCopyWithImpl<$Res>
    extends _$TransferRequestCopyWithImpl<$Res, _$TransferRequestImpl>
    implements _$$TransferRequestImplCopyWith<$Res> {
  __$$TransferRequestImplCopyWithImpl(
      _$TransferRequestImpl _value, $Res Function(_$TransferRequestImpl) _then)
      : super(_value, _then);

  /// Create a copy of TransferRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
    Object? sourceAccount = null,
    Object? destinationAccount = null,
    Object? transferType = null,
    Object? amountInCents = null,
    Object? description = null,
    Object? currency = null,
  }) {
    return _then(_$TransferRequestImpl(
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      sourceAccount: null == sourceAccount
          ? _value.sourceAccount
          : sourceAccount // ignore: cast_nullable_to_non_nullable
              as String,
      destinationAccount: null == destinationAccount
          ? _value.destinationAccount
          : destinationAccount // ignore: cast_nullable_to_non_nullable
              as String,
      transferType: null == transferType
          ? _value.transferType
          : transferType // ignore: cast_nullable_to_non_nullable
              as String,
      amountInCents: null == amountInCents
          ? _value.amountInCents
          : amountInCents // ignore: cast_nullable_to_non_nullable
              as int,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      currency: null == currency
          ? _value.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$TransferRequestImpl implements _TransferRequest {
  const _$TransferRequestImpl(
      {required this.userId,
      required this.sourceAccount,
      required this.destinationAccount,
      required this.transferType,
      required this.amountInCents,
      required this.description,
      this.currency = 'GTQ'});

  @override
  final String userId;
  @override
  final String sourceAccount;
  @override
  final String destinationAccount;
  @override
  final String transferType;
  @override
  final int amountInCents;
  @override
  final String description;
  @override
  @JsonKey()
  final String currency;

  @override
  String toString() {
    return 'TransferRequest(userId: $userId, sourceAccount: $sourceAccount, destinationAccount: $destinationAccount, transferType: $transferType, amountInCents: $amountInCents, description: $description, currency: $currency)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TransferRequestImpl &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.sourceAccount, sourceAccount) ||
                other.sourceAccount == sourceAccount) &&
            (identical(other.destinationAccount, destinationAccount) ||
                other.destinationAccount == destinationAccount) &&
            (identical(other.transferType, transferType) ||
                other.transferType == transferType) &&
            (identical(other.amountInCents, amountInCents) ||
                other.amountInCents == amountInCents) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.currency, currency) ||
                other.currency == currency));
  }

  @override
  int get hashCode => Object.hash(runtimeType, userId, sourceAccount,
      destinationAccount, transferType, amountInCents, description, currency);

  /// Create a copy of TransferRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TransferRequestImplCopyWith<_$TransferRequestImpl> get copyWith =>
      __$$TransferRequestImplCopyWithImpl<_$TransferRequestImpl>(
          this, _$identity);
}

abstract class _TransferRequest implements TransferRequest {
  const factory _TransferRequest(
      {required final String userId,
      required final String sourceAccount,
      required final String destinationAccount,
      required final String transferType,
      required final int amountInCents,
      required final String description,
      final String currency}) = _$TransferRequestImpl;

  @override
  String get userId;
  @override
  String get sourceAccount;
  @override
  String get destinationAccount;
  @override
  String get transferType;
  @override
  int get amountInCents;
  @override
  String get description;
  @override
  String get currency;

  /// Create a copy of TransferRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TransferRequestImplCopyWith<_$TransferRequestImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
